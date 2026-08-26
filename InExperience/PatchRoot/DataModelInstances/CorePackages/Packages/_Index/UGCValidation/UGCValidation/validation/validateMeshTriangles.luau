local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)

return function(vectorA, vectorB, p1)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), constantsModule (ref), analyticsModule (ref)
	local isServer = p1.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), vectorA (ref)
		return UGCValidationService:GetEditableMeshTriCount(vectorA.editableMesh)
	end, p1)
	
	if vectorB == nil then
		vectorB = constantsModule.MAX_HAT_TRIANGLES
	end
	if var1 then
		if vectorB < var2 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshTriangles_TooManyTriangles, nil, p1)
			
			return false, {
				string.format("Model mesh %s resolution of %d is higher than max support value of %d. You need to retopologize your model and try again.", vectorA.fullName, var2, vectorB)
			}
		end
		return true
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshTriangles_FailedToLoadMesh, nil, p1)
		
		if isServer ~= nil and isServer then
			error(string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", vectorA.fullName))
		end
		return false, {
			string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", vectorA.fullName)
		}
	end
end