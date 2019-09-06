//
//  GetCarRepairListUseCaseSpec.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/2/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Quick
import Nimble

@testable import CarRepair

class GetCarRepairListUseCaseSpec: QuickSpec {
    override func spec() {
        var sut: GetCarRepairListUseCase!
        var presenter: GetCarRepairListPresenterSpy!
        var location = ["-43.4444", "-43.4434"]
        var errorMessage = "Error message"
        var reponse = CarRepairReponse.successMock()
        var api: CarRepairAPISpy!

        func setup(result: Result<CarRepairReponse>) {
            api = CarRepairAPISpy()
            api.stubbedGetCarRepairListCallbackResult = result
            presenter = GetCarRepairListPresenterSpy()
            sut = GetCarRepairListUseCase(location: location, presenter: presenter, carRepairAPI: api)
            sut.run()
        }

        describe("GetCarRepairListUseCase") {
            context("when success") {

                beforeEach {
                    setup(result: .success(reponse))
                }

                it("should call getCarRepairList API method") {
                    expect(api.invokedGetCarRepairList) == true
                }

                it("should pass parameters correctly through API") {
                    expect(api.invokedGetCarRepairListParameters?.location) == location
                }

                it("should call showCarRepair presenter method") {
                    expect(presenter.invokedShowCarRepair) == true
                }

                it("should return a response with the correct number of venues") {
                    expect(presenter.invokedShowCarRepairParameters?.list.count) == reponse.carRepairList.count
                }
            }

            context("when error") {

                beforeEach {
                    setup(result: .failure(errorMessage))
                }

                it("should call getCarRepairList API method") {
                    expect(api.invokedGetCarRepairList) == true
                }

                it("should pass parameters correctly through API") {
                    expect(api.invokedGetCarRepairListParameters?.location) == location
                }

                it("should call showError presenter method") {
                    expect(presenter.invokedShowError) == true
                }

                it("should return an error with the correct message text") {
                    expect(presenter.invokedShowErrorParameters?.message) == errorMessage
                }
            }

            context("when empty state") {

                beforeEach {
                    let emptyMock = CarRepairReponse.emptyMock()
                    setup(result: .success(emptyMock))
                }

                it("should call getCarRepairList API method") {
                    expect(api.invokedGetCarRepairList) == true
                }

                it("should pass parameters correctly through API") {
                    expect(api.invokedGetCarRepairListParameters?.location) == location
                }

                it("should call showEmptyState presenter method") {
                    expect(presenter.invokedShowEmptyState) == true
                }
            }
        }
    }
}
