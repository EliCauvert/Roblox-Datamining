-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(vectorA, vectorB) --[[ line: 12 | named "validateMeshTriangleArea" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local var4 = if vectorB then vectorB.isServer else nil
	local var5, var6 = pcallDeferredModule(function() --[[ line: 20 ]]
		-- upvalues: UGCValidationService (copy), vectorA (ref)
		return UGCValidationService:ValidateEditableMeshTriangleArea(vectorA.editableMesh)
	end, vectorB)
	
	if var5 then
		if var6 then
			analyticsModule.recordScriptTime(script.Name, currentTime, vectorB)
			
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshTriangleArea_NoArea, nil, vectorB)
		
		return false, {
			string.format("Detected zero-area triangle in model mesh %s. You need to edit the mesh to remove zero-area triangles.", vectorA.fullName)
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshTriangleArea_FailedToLoadMesh, nil, vectorB)
		
		if var4 then
			error(string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", vectorA.fullName))
		end
		return false, {
			string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", vectorA.fullName)
		}
	end
end