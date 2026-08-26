local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

return function(p1, p2, p3)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), p2 (ref)
		return UGCValidationService:ValidateEditableMeshVertColors(p1.editableMesh, p2)
	end, p3)
	
	if var1 then
		if var2 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p3)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshVertexColors_NonNeutralVertexColors, nil, p3)
		
		return false, {
			string.format("Invalid vertex color found in mesh model '%s'. You need to edit the color map to be all white %s and try again.", p1.fullName, if p2 then "with no transarency" else "")
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshVertexColors_FailedToLoadMesh, nil, p3)
		local formattedText = string.format("Failed to load vertex color map for model mesh %s. Make sure it exists and try again.", p1.fullName)
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end