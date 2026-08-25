local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(value, p0, p1)
	-- upvalues: analyticsModule (ref)
	local handle = value:FindFirstChild("Handle")
	assert(handle and handle:IsA("MeshPart"))
	local handle_1 = p0:FindFirstChild("Handle")
	assert(handle_1 and handle_1:IsA("MeshPart"))
	
	if handle.MeshId ~= handle_1.MeshId then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch, nil, p1)
		
		return false, {
			string.format("Model meshId mismatch between MeshPart.MeshId and SpecialMesh.MeshId for %s. You need to match the meshIds and try again.", value.Name)
		}
	elseif handle.TextureID == handle_1.TextureID then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch, nil, p1)
	
	return false, {
		string.format("Model textureId mismatch between MeshPart.TextureID and SpecialMesh.TextureId for %s. You need to match the textureIds and try again.", value.Name)
	}
end