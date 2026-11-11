local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)

return function(Object, Object1, p1)
	-- upvalues: AnalyticsModule (copy)
	local Handle = Object:FindFirstChild("Handle")
	assert(Handle and Handle:IsA("MeshPart"))
	local Handle1 = Object1:FindFirstChild("Handle")
	assert(Handle1 and Handle1:IsA("Part"))
	local SpecialMesh = Handle1:FindFirstChildOfClass("SpecialMesh")
	assert(SpecialMesh)
	
	if Handle.MeshId ~= SpecialMesh.MeshId then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch, nil, p1)
		
		return false, {
			string.format("Model meshId mismatch with rigid accessory SpecialMesh.MeshId for '%s'. You need to match the meshIds and try again.", Object.Name)
		}
	end
	local TextureID = Handle.TextureID
	
	if TextureID == "" then
		local SurfaceAppearance = Handle:FindFirstChildOfClass("SurfaceAppearance")
		
		if SurfaceAppearance then
			TextureID = SurfaceAppearance.ColorMap
		end
	end
	if TextureID == SpecialMesh.TextureId then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch, nil, p1)
		
		return false, {
			string.format("Model textureId mismatch with rigid accessory SpecialMesh.TextureId for '%s'. You need to match the textureIds and try again.", Object.Name)
		}
	end
end