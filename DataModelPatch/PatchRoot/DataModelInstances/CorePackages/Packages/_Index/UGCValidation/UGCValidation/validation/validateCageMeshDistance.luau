local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFIntUGCValidateCageMeshDistanceThresholdModule = require(Parent.flags.getFIntUGCValidateCageMeshDistanceThreshold)

return function(p1, p2, p3, InnerTransform, OuterTransform, p4)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCValidateCageMeshDistanceThresholdModule (copy)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy), p2 (copy), p3 (copy), InnerTransform (copy), OuterTransform (copy)
		return UGCValidationService:CalculateAverageEditableCageMeshDistance(p1.editableMesh, p2.editableMesh, p3.editableMesh, InnerTransform, OuterTransform)
	end, p4)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageMeshDistance_FailedToExecute, nil, p4)
		
		return false, {
			string.format("Failed to execute cage mesh distance validation for '%s'. Make sure the cage mesh exists and try again.", p3.fullName)
		}
	end
	local List = {}
	local Flag = true
	
	if GetFIntUGCValidateCageMeshDistanceThresholdModule() < PcallDeferredModuleResult2 * 100 or PcallDeferredModuleResult2 < 0 then
		Flag = false
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance, nil, p4)
		
		if PcallDeferredModuleResult2 < 0 then
			table.insert(List, "Average distance between outer cage to mesh is too high. Mesh seems to be outside of the outer cage." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)")
		else
			table.insert(List, string.format("Average distance between outer cage to mesh is too high (%.2f). Make adjustment to cage to fit the mesh better.", PcallDeferredModuleResult2) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)")
		end
	end
	return Flag, List
end