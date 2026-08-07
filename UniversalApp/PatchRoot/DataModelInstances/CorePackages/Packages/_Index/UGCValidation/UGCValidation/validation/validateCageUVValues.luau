local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p0, p1, p2) --[[ line: 19 | named "validateCageUVValues" ]]
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	local var5 = assert(wrapTargetCageUVReferenceValuesModule[p1.Parent.Name], "WrapTarget is not parented to a MeshPart")
	local var6, var7 = pcallDeferredModule(function() --[[ line: 32 ]]
		-- upvalues: UGCValidationService (copy), var5 (ref), p0 (ref)
		return UGCValidationService:ValidateEditableMeshUVValuesInReference(var5, p0.editableMesh)
	end, p2)
	
	if var6 then
		if var7 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p2)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVValues_UnexpectedUVValue, nil, p2)
		
		return false, {
			string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", p1:GetFullName())
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVValues_FailedToLoadMesh, nil, p2)
		local formattedText = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", p1:GetFullName())
		
		if isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end