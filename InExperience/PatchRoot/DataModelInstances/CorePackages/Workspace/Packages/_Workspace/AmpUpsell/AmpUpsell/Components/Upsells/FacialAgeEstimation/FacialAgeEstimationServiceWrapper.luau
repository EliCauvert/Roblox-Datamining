local promiseModule = require(script:FindFirstAncestor("AmpUpsell").Parent.Promise)
local facialAgeEstimationServiceAvailableEngineFeature = game:GetEngineFeature("FacialAgeEstimationServiceAvailable")
local var1 = if facialAgeEstimationServiceAvailableEngineFeature then game:GetService("FacialAgeEstimationService") else nil

return {
	isAvailable = function()
		-- upvalues: facialAgeEstimationServiceAvailableEngineFeature (ref), var1 (ref)
		return facialAgeEstimationServiceAvailableEngineFeature and var1:IsAvailable()
	end,
	startFlow = function(p1, p2)
		-- upvalues: promiseModule (ref), var1 (ref)
		return promiseModule.new(function(p3, p4)
			-- upvalues: var1 (copy), p1 (ref), p2 (ref)
			local ok, status = pcall(function()
				-- upvalues: var1 (copy), p1 (copy), p2 (copy)
				return var1:InquiryAsync({ inquiryId = p1, sessionToken = p2 })
			end)
			
			if not ok then
				p4(status)
				
				return
			end
			local resultType = status.resultType
			
			if resultType == Enum.FacialAgeEstimationResultType.Complete then
				p3(p1)
				
				return
			elseif resultType == Enum.FacialAgeEstimationResultType.Cancel then
				p4({ resultType = resultType })
				
				return
			elseif resultType == Enum.FacialAgeEstimationResultType.Error then
				p4({ resultType = resultType })
			end
		end)
	end
}