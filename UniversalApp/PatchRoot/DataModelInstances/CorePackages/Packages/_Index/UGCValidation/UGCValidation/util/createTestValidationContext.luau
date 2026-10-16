local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(script.Parent.Parent.util.Types)

return function(AssetTypeEnum, List) --[[ Line: 7 ]]
	-- upvalues: UGCValidationService (copy)
	local config = {
		isServer = true,
		validateMeshPartAccessories = false,
		assetTypeEnum = AssetTypeEnum
	}
	local EditableMeshes = {}
	local EditableImages = {}
	
	for _, value in List do
		for _, BinaryStringValue in value:GetDescendants() do
			if BinaryStringValue:IsA("BinaryStringValue") then
				if BinaryStringValue.Name == "MeshId" or BinaryStringValue.Name == "CageMeshId" or BinaryStringValue.Name == "ReferenceMeshId" then
					if not EditableMeshes[BinaryStringValue.Parent] then
						EditableMeshes[BinaryStringValue.Parent] = {}
					end
					EditableMeshes[BinaryStringValue.Parent][BinaryStringValue.Name] = {
						created = true,
						instance = UGCValidationService:CreateEditableMeshFromBinaryStringRobloxOnly(BinaryStringValue)
					}
				else
					if not EditableImages[BinaryStringValue.Parent] then
						EditableImages[BinaryStringValue.Parent] = {}
					end
					EditableImages[BinaryStringValue.Parent][BinaryStringValue.Name] = {
						created = true,
						instance = UGCValidationService:CreateEditableImageFromBinaryStringRobloxOnly(BinaryStringValue)
					}
				end
			end
		end
	end
	config.editableMeshes = EditableMeshes
	config.editableImages = EditableImages
	
	return config
end