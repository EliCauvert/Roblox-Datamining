local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFIntUGCLCCagingRelevancyMinimumModule = require(Parent.flags.getFIntUGCLCCagingRelevancyMinimum)

return function(p1, p2, p3, OffsetInner, OffsetOuter, p4) --[[ Line: 11 | Named "validateLCCagingRelevancy" ]]
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCLCCagingRelevancyMinimumModule (copy)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2, PcallDeferredModuleResult3 = PcallDeferredModule(function() --[[ Line: 19 ]]
		-- upvalues: UGCValidationService (upval), p1 (copy), p2 (copy), p3 (copy), OffsetInner (copy), OffsetOuter (copy)
		return UGCValidationService:GetEditableCagingRelevancyMetrics(p1.editableMesh, p2.editableMesh, p3.editableMesh, OffsetInner, OffsetOuter)
	end, p4)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCagingRelevancy_FailedToExecute, nil, p4)
		
		return false, {
			string.format("Failed to execute cage relevancy detection for '%s'. Make sure the cage mesh exists and try again.", p3.fullName)
		}
	elseif PcallDeferredModuleResult3 == 0 then
		return true
	else
		local Floored = math.floor(100 * PcallDeferredModuleResult2 / PcallDeferredModuleResult3)
		
		if Floored < GetFIntUGCLCCagingRelevancyMinimumModule() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCagingRelevancy_IrrelevantCaging, nil, p4)
			
			return false, {
				string.format("Validation detected %d%% of the outer cage edits do not cover the accessory. Make sure you are moving the outer cage only where needed." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageRelevancy)", 100 - Floored)
			}
		else
			return true
		end
	end
end