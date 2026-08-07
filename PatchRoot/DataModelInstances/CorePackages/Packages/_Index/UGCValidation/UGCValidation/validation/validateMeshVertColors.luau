-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

return function(p0, p1, p2) --[[ line: 10 | named "validateMeshVertexColors" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	local var4, var5 = pcallDeferredModule(function() --[[ line: 19 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref), p1 (ref)
		return UGCValidationService:ValidateEditableMeshVertColors(p0.editableMesh, p1)
	end, p2)
	
	if var4 then
		if var5 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p2)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshVertexColors_NonNeutralVertexColors, nil, p2)
		
		return false, {
			string.format("Invalid vertex color found in mesh model '%s'. You need to edit the color map to be all white %s and try again.", p0.fullName, if p1 then "with no transarency" else "")
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshVertexColors_FailedToLoadMesh, nil, p2)
		local formattedText = string.format("Failed to load vertex color map for model mesh %s. Make sure it exists and try again.", p0.fullName)
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end