local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCValidateCageMeshDistanceThresholdModule = require(parent.flags.getFIntUGCValidateCageMeshDistanceThreshold)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 16 | named "validateCageMeshDistance" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidateCageMeshDistanceThresholdModule (ref)
	local var4, var5 = pcallDeferredModule(function() --[[ line: 24 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		return UGCValidationService:CalculateAverageEditableCageMeshDistance(p0.editableMesh, p1.editableMesh, p2.editableMesh, p3, p4)
	end, p5)
	
	if not var4 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageMeshDistance_FailedToExecute, nil, p5)
		
		return false, {
			string.format("Failed to execute cage mesh distance validation for '%s'. Make sure the cage mesh exists and try again.", p2.fullName)
		}
	end
	local t = {}
	local var7 = true
	
	if getFIntUGCValidateCageMeshDistanceThresholdModule() < var5 * 100 or var5 < 0 then
		var7 = false
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance, nil, p5)
		
		if var5 < 0 then
			table.insert(t, "Average distance between outer cage to mesh is too high. Mesh seems to be outside of the outer cage." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)")
		else
			table.insert(t, string.format("Average distance between outer cage to mesh is too high (%.2f). Make adjustment to cage to fit the mesh better.", var5) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageMeshDistance)")
		end
	end
	return var7, t
end