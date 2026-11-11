local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)

return function(Object, Object1, p1)
	-- upvalues: AnalyticsModule (copy)
	local Handle = Object:FindFirstChild("Handle")
	assert(Handle and Handle:IsA("MeshPart"))
	local Handle1 = Object1:FindFirstChild("Handle")
	assert(Handle1 and Handle1:IsA("MeshPart"))
	
	if Handle.MeshId ~= Handle1.MeshId then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch, nil, p1)
		
		return false, {
			string.format("Model meshId mismatch between MeshPart.MeshId and SpecialMesh.MeshId for %s. You need to match the meshIds and try again.", Object.Name)
		}
	elseif Handle.TextureID == Handle1.TextureID then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch, nil, p1)
		
		return false, {
			string.format("Model textureId mismatch between MeshPart.TextureID and SpecialMesh.TextureId for %s. You need to match the textureIds and try again.", Object.Name)
		}
	end
end