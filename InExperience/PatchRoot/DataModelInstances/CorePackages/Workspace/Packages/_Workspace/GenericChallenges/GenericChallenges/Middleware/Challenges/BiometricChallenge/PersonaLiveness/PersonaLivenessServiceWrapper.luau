local promiseModule = require(script:FindFirstAncestor("GenericChallenges").Parent.Promise)
local facialAgeEstimationServiceAvailableEngineFeature = game:GetEngineFeature("FacialAgeEstimationServiceAvailable")
local var2 = if facialAgeEstimationServiceAvailableEngineFeature then game:GetService("FacialAgeEstimationService") else nil

return {
	isAvailable = function()
		-- upvalues: facialAgeEstimationServiceAvailableEngineFeature (ref), var2 (ref)
		return facialAgeEstimationServiceAvailableEngineFeature and var2:IsAvailable()
	end,
	startFlow = function(p0, p1)
		-- upvalues: promiseModule (ref), var2 (ref)
		return promiseModule.new(function(p2, p3)
			-- upvalues: var2 (copy), p0 (ref), p1 (ref)
			local ok, status = pcall(function()
				-- upvalues: var2 (copy), p0 (copy), p1 (copy)
				return var2:InquiryAsync({ inquiryId = p0, sessionToken = p1 })
			end)
			
			if not ok then
				p3(status)
				
				return
			end
			local resultType = status.resultType
			
			if resultType == Enum.FacialAgeEstimationResultType.Complete then
				p2(p0)
				
				return
			elseif resultType == Enum.FacialAgeEstimationResultType.Cancel then
				p3({ resultType = resultType })
				
				return
			elseif resultType == Enum.FacialAgeEstimationResultType.Error then
				p3({ resultType = resultType })
			end
		end)
	end
}