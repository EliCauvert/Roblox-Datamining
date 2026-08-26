local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCLCCagingRelevancyMinimumModule = require(parent.flags.getFIntUGCLCCagingRelevancyMinimum)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCLCCagingRelevancyMinimumModule (ref)
	local var1, var2, var3 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		return UGCValidationService:GetEditableCagingRelevancyMetrics(p1.editableMesh, p2.editableMesh, p3.editableMesh, p4, p5)
	end, p6)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCagingRelevancy_FailedToExecute, nil, p6)
		
		return false, {
			string.format("Failed to execute cage relevancy detection for '%s'. Make sure the cage mesh exists and try again.", p3.fullName)
		}
	elseif var3 == 0 then
		return true
	end
	local floored = math.floor(100 * var2 / var3)
	
	if floored < getFIntUGCLCCagingRelevancyMinimumModule() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCagingRelevancy_IrrelevantCaging, nil, p6)
		
		return false, {
			string.format("Validation detected %d%% of the outer cage edits do not cover the accessory. Make sure you are moving the outer cage only where needed." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageRelevancy)", 100 - floored)
		}
	end
	return true
end