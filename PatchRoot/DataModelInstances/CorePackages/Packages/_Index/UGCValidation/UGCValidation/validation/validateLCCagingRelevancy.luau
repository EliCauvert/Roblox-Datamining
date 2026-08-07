-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:43 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCLCCagingRelevancyMinimumModule = require(parent.flags.getFIntUGCLCCagingRelevancyMinimum)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 11 | named "validateLCCagingRelevancy" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCLCCagingRelevancyMinimumModule (ref)
	local var4, var5, var6 = pcallDeferredModule(function() --[[ line: 19 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		return UGCValidationService:GetEditableCagingRelevancyMetrics(p0.editableMesh, p1.editableMesh, p2.editableMesh, p3, p4)
	end, p5)
	
	if not var4 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCagingRelevancy_FailedToExecute, nil, p5)
		
		return false, {
			string.format("Failed to execute cage relevancy detection for '%s'. Make sure the cage mesh exists and try again.", p2.fullName)
		}
	elseif var6 == 0 then
		return true
	end
	local floored = math.floor(100 * var5 / var6)
	
	if floored < getFIntUGCLCCagingRelevancyMinimumModule() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCagingRelevancy_IrrelevantCaging, nil, p5)
		
		return false, {
			string.format("Validation detected %d%% of the outer cage edits do not cover the accessory. Make sure you are moving the outer cage only where needed." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageRelevancy)", 100 - floored)
		}
	end
	return true
end