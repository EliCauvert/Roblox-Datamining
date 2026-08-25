local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

return function(value, p0, p1)
	-- upvalues: analyticsModule (ref)
	local handle = value:FindFirstChild("Handle")
	assert(handle and handle:IsA("MeshPart"))
	local handle_1 = p0:FindFirstChild("Handle")
	assert(handle_1 and handle_1:IsA("Part"))
	local specialMesh = handle_1:FindFirstChildOfClass("SpecialMesh")
	assert(specialMesh)
	
	if handle.MeshId ~= specialMesh.MeshId then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch, nil, p1)
		
		return false, {
			string.format("Model meshId mismatch with rigid accessory SpecialMesh.MeshId for '%s'. You need to match the meshIds and try again.", value.Name)
		}
	end
	local textureID = handle.TextureID
	
	if textureID == "" then
		local surfaceAppearance = handle:FindFirstChildOfClass("SurfaceAppearance")
		
		if surfaceAppearance then
			textureID = surfaceAppearance.ColorMap
		end
	end
	if textureID == specialMesh.TextureId then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch, nil, p1)
	
	return false, {
		string.format("Model textureId mismatch with rigid accessory SpecialMesh.TextureId for '%s'. You need to match the textureIds and try again.", value.Name)
	}
end