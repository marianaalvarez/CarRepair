//
//  GetCarRepairDetailUseCaseSpec.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Quick
import Nimble

@testable import CarRepair

final class GetCarRepairDetailUseCaseSpec: QuickSpec {
    override func spec() {
        var sut: GetCarRepairDetailUseCase!
        var presenter: GetCarRepairDetailPresenterSpy!
        var placeId = "ChIJG2GCqQ5azpQRBiBpTWTPZ4M"
        var errorMessage = "Error message"
        var response = CarRepairDetailReponse.successMock()
        var api: CarRepairAPISpy!

        func setup(result: Result<CarRepairDetailReponse>) {
            api = CarRepairAPISpy()
            api.stubbedGetCarRepairDetailCallbackResult = result
            presenter = GetCarRepairDetailPresenterSpy()
            sut = GetCarRepairDetailUseCase(placeId: placeId, carRepairAPI: api, presenter: presenter)
            sut.run()
        }

        describe("GetCarRepairDetailUseCaseSpec") {
            context("when success") {
                beforeEach {
                    setup(result: .success(response))
                }
                
                it("should call getCarRepairDetail API method") {
                    expect(api.invokedGetCarRepairDetail) == true
                }

                it("should pass parameters correctly through API") {
                    expect(api.invokedGetCarRepairDetailParameters?.id) == placeId
                }

                it("should call show presenter method") {
                    expect(presenter.invokedShow) == true
                }

                it("should return a response with the correct venue name") {
                    expect(presenter.invokedShowParameters?.carRepair.name) == response.carRepair.name
                }
            }
        }

        context("when error") {

            beforeEach {
                setup(result: .failure(errorMessage))
            }

            it("should call getCarRepairDetailList API method") {
                expect(api.invokedGetCarRepairDetail) == true
            }

            it("should pass parameters correctly through API") {
                expect(api.invokedGetCarRepairDetailParameters?.id) == placeId
            }

            it("should call showError presenter method") {
                expect(presenter.invokedShowError) == true
            }

            it("should return an error with the correct message text") {
                expect(presenter.invokedShowErrorParameters?.message) == errorMessage
            }
        }
    }
}
