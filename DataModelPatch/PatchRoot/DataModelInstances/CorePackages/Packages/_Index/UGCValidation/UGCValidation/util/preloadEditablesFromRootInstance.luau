local UGCValidationService = game:GetService("UGCValidationService")
local config = { MeshId = true, CageMeshId = true, ReferenceMeshId = true }
local config1 = {
	TextureId = true,
	MetalnessMap = true,
	NormalMap = true,
	RoughnessMap = true
}

return function(Object)
	-- upvalues: config (copy), UGCValidationService (copy), config1 (copy)
	local EditableMeshFromBinaryStringRobloxOnlies = {}
	local EditableImageFromBinaryStringRobloxOnlies = {}
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	
	for _, BinaryStringValue in Descendants do
		if BinaryStringValue:IsA("BinaryStringValue") and config[BinaryStringValue.Name] then
			EditableMeshFromBinaryStringRobloxOnlies[BinaryStringValue.Parent[BinaryStringValue.Name]] = UGCValidationService:CreateEditableMeshFromBinaryStringRobloxOnly(BinaryStringValue)
		elseif BinaryStringValue:IsA("BinaryStringValue") and config1[BinaryStringValue.Name] then
			EditableImageFromBinaryStringRobloxOnlies[BinaryStringValue.Parent[BinaryStringValue.Name]] = UGCValidationService:CreateEditableImageFromBinaryStringRobloxOnly(BinaryStringValue)
		end
	end
	return EditableMeshFromBinaryStringRobloxOnlies, EditableImageFromBinaryStringRobloxOnlies
end