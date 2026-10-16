local PromiseModule = require(script:FindFirstAncestor("GenericChallenges").Parent.Promise)
local FacialAgeEstimationServiceAvailableEngineFeature = game:GetEngineFeature("FacialAgeEstimationServiceAvailable")
local FacialAgeEstimationService = if FacialAgeEstimationServiceAvailableEngineFeature then game:GetService("FacialAgeEstimationService") else nil

return {
	isAvailable = function() --[[ Line: 13 ]]
		-- upvalues: FacialAgeEstimationServiceAvailableEngineFeature (copy), FacialAgeEstimationService (copy)
		return FacialAgeEstimationServiceAvailableEngineFeature and FacialAgeEstimationService:IsAvailable()
	end,
	startFlow = function(InquiryId, SessionToken) --[[ Line: 16 ]]
		-- upvalues: PromiseModule (copy), FacialAgeEstimationService (copy)
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 17 ]]
			-- upvalues: FacialAgeEstimationService (upval), InquiryId (copy), SessionToken (copy)
			local Success, Result = pcall(function() --[[ Line: 18 ]]
				-- upvalues: FacialAgeEstimationService (upval), InquiryId (upval), SessionToken (upval)
				return FacialAgeEstimationService:InquiryAsync({ inquiryId = InquiryId, sessionToken = SessionToken })
			end)
			
			if not Success then
				Callback(Result)
				
				return
			end
			local ResultType = Result.resultType
			
			if ResultType == Enum.FacialAgeEstimationResultType.Complete then
				Callback1(InquiryId)
				
				return
			end
			if ResultType == Enum.FacialAgeEstimationResultType.Cancel then
				Callback({ resultType = ResultType })
				
				return
			end
			if ResultType == Enum.FacialAgeEstimationResultType.Error then
				Callback({ resultType = ResultType })
			end
		end)
	end
}