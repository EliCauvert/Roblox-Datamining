local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local getFIntUniqueUVToleranceModule = require(parent.flags.getFIntUniqueUVTolerance)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), getFIntUniqueUVToleranceModule (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	local var1 = assert(constantsModule.WRAP_TARGET_CAGE_MESH_UV_COUNTS[p2.Parent.Name], "WrapTarget is not parented to a MeshPart")
	local _ = nil
	local _ = nil
	local var2 = nil
	local var3, var4 = pcallDeferredModule(function()
		-- upvalues: var2 (write), UGCValidationService (copy), p1 (ref), var1 (ref), getFIntUniqueUVToleranceModule (copy)
		var2 = UGCValidationService:CalculateEditableMeshUniqueUVCount(p1.editableMesh)
		
		return math.abs(var2 - var1) <= getFIntUniqueUVToleranceModule()
	end, p3)
	
	if var3 then
		if var4 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p3)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVs_TestPassed, nil, p3)
		
		return false, {
			string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", p2:GetFullName(), p1.fieldName, if p1.contentId then p1.contentId else "", var1, var2)
		}
	else
		local formattedText = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", p2:GetFullName())
		
		if isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVs_TestExecutedSuccessfully, nil, p3)
		
		return false, { formattedText }
	end
end