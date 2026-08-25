local _ = script.Parent.Parent

function isCreatorStoreAssetType(value)
	if value == nil or type(value) ~= "string" then
		return false
	end
	for i, v in {
		"Model", "Plugin", "Audio", "Decal", "FontFamily", "MeshPart", "Video"
	} do
		if value == v then
			return true
		end
	end
	return false
end

return isCreatorStoreAssetType