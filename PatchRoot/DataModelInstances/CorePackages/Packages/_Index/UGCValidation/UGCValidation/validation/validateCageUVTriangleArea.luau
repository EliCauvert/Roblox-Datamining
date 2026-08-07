-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

return function(vectorA, vectorB) --[[ line: 12 | named "validateCageUVTriangleArea" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = vectorB.isServer
	local var4, var5 = pcallDeferredModule(function() --[[ line: 20 ]]
		-- upvalues: UGCValidationService (copy), vectorA (ref)
		return UGCValidationService:ValidateEditableMeshCageUVTriangleArea(vectorA.editableMesh)
	end, vectorB)
	
	if var4 then
		if var5 then
			analyticsModule.recordScriptTime(script.Name, currentTime, vectorB)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVTriangleArea_ZeroAreaTriangle, nil, vectorB)
		
		return false, {
			string.format("Detected zero-area triangle in UV map of '%s'. You need to edit the UV map to fix this issue.", vectorA.fullName)
		}
	elseif isServer then
		error(string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", vectorA.fullName))
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVTriangleArea_FailedToLoadMesh, nil, vectorB)
	
	return false, {
		string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", vectorA.fullName)
	}
end