local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, p2, p3)
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	local var1 = assert(wrapTargetCageUVReferenceValuesModule[p2.Parent.Name], "WrapTarget is not parented to a MeshPart")
	local var2, var3 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), var1 (ref), p1 (ref)
		return UGCValidationService:ValidateEditableMeshUVValuesInReference(var1, p1.editableMesh)
	end, p3)
	
	if var2 then
		if var3 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p3)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVValues_UnexpectedUVValue, nil, p3)
		
		return false, {
			string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", p2:GetFullName())
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVValues_FailedToLoadMesh, nil, p3)
		local formattedText = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", p2:GetFullName())
		
		if isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end