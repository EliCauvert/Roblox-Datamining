local FacialAgeEstimationServiceAvailableEngineFeature = game:GetEngineFeature("FacialAgeEstimationServiceAvailable")
local FacialAgeEstimationService = if FacialAgeEstimationServiceAvailableEngineFeature then game:GetService("FacialAgeEstimationService") else nil
local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local PromiseModule = require(AmpV2Wizard.Parent.Promise)
local FFlagAmpV2WizardVerificationDiagnosticsModule = require(AmpV2Wizard.FFlagAmpV2WizardVerificationDiagnostics)

return {
	isAvailable = function()
		-- upvalues: FacialAgeEstimationServiceAvailableEngineFeature (copy), FacialAgeEstimationService (copy)
		return FacialAgeEstimationServiceAvailableEngineFeature and FacialAgeEstimationService:IsAvailable()
	end,
	startInquiry = function(InquiryId)
		-- upvalues: PromiseModule (copy), FacialAgeEstimationService (copy), FFlagAmpV2WizardVerificationDiagnosticsModule (copy)
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: FacialAgeEstimationService (upval), InquiryId (copy), FFlagAmpV2WizardVerificationDiagnosticsModule (upval)
			local Success, Result = pcall(function()
				-- upvalues: FacialAgeEstimationService (upval), InquiryId (upval)
				return FacialAgeEstimationService:InquiryAsync({ inquiryId = InquiryId })
			end)
			
			if not Success then
				Callback(Result)
				
				return
			end
			if FFlagAmpV2WizardVerificationDiagnosticsModule then
				Callback1({
					resultType = Result.resultType,
					debugMessage = Result.debugMessage
				})
				
				return
			else
				Callback1(Result.resultType)
			end
		end)
	end
}