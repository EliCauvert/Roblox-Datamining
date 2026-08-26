local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCValidateCageMeshDistanceThresholdModule = require(parent.flags.getFIntUGCValidateCageMeshDistanceThreshold)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidateCageMeshDistanceThresholdModule (ref)
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		return UGCValidationService:CalculateAverageEditableCageMeshDistance(p1.editableMesh, p2.editableMesh, p3.editableMesh, p4, p5)
	end, p6)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageMeshDistance_FailedToExecute, nil, p6)
		
		return false, {
			string.format("Failed to execute cage mesh distance validation for '%s'. Make sure the cage mesh exists and try again.", p3.fullName)
		}
	end
	local t = {}
	local var3 = true
	
	if getFIntUGCValidateCageMeshDistanceThresholdModule() < var2 * 100 or var2 < 0 then
		var3 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance, nil, p6)
		
		if var2 < 0 then
			table.insert(t, "Average distance between outer cage to mesh is too high. Mesh seems to be outside of the outer cage." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)")
		else
			table.insert(t, string.format("Average distance between outer cage to mesh is too high (%.2f). Make adjustment to cage to fit the mesh better.", var2) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)")
		end
	end
	return var3, t
end