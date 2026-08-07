local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local getFIntUniqueUVToleranceModule = require(parent.flags.getFIntUniqueUVTolerance)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p0, p1, p2) --[[ line: 17 | named "validateCageUVs" ]]
	-- upvalues: constantsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), getFIntUniqueUVToleranceModule (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	local var6 = assert(constantsModule.WRAP_TARGET_CAGE_MESH_UV_COUNTS[p1.Parent.Name], "WrapTarget is not parented to a MeshPart")
	local _ = nil
	local _ = nil
	local var7 = nil
	local var8, var9 = pcallDeferredModule(function() --[[ line: 34 ]]
		-- upvalues: var7 (write), UGCValidationService (copy), p0 (ref), var6 (ref), getFIntUniqueUVToleranceModule (copy)
		var7 = UGCValidationService:CalculateEditableMeshUniqueUVCount(p0.editableMesh)
		
		return math.abs(var7 - var6) <= getFIntUniqueUVToleranceModule()
	end, p2)
	
	if var8 then
		if var9 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p2)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVs_TestPassed, nil, p2)
		
		return false, {
			string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", p1:GetFullName(), p0.fieldName, if p0.contentId then p0.contentId else "", var6, var7)
		}
	else
		local formattedText = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", p1:GetFullName())
		
		if isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVs_TestExecutedSuccessfully, nil, p2)
		
		return false, { formattedText }
	end
end