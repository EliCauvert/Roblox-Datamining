-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)

return function(vectorA, vectorB, p0) --[[ line: 12 | named "validateMeshTriangles" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), constantsModule (ref), analyticsModule (ref)
	local isServer = p0.isServer
	local var4, var5 = pcallDeferredModule(function() --[[ line: 19 ]]
		-- upvalues: UGCValidationService (copy), vectorA (ref)
		return UGCValidationService:GetEditableMeshTriCount(vectorA.editableMesh)
	end, p0)
	
	if vectorB == nil then
		vectorB = constantsModule.MAX_HAT_TRIANGLES
	end
	if var4 then
		if vectorB < var5 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshTriangles_TooManyTriangles, nil, p0)
			
			return false, {
				string.format("Model mesh %s resolution of %d is higher than max support value of %d. You need to retopologize your model and try again.", vectorA.fullName, var5, vectorB)
			}
		end
		return true
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshTriangles_FailedToLoadMesh, nil, p0)
		
		if isServer ~= nil and isServer then
			error(string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", vectorA.fullName))
		end
		return false, {
			string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", vectorA.fullName)
		}
	end
end