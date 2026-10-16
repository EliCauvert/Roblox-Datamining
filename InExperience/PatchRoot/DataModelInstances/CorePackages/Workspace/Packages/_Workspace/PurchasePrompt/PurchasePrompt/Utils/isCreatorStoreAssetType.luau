local _ = script.Parent.Parent

function isCreatorStoreAssetType(p1): boolean --[[ Line: 3 ]]
	if p1 == nil or type(p1) ~= "string" then
		return false
	end
	for _, value in {
		"Model", "Plugin", "Audio", "Decal", "FontFamily", "MeshPart", "Video"
	} do
		if p1 == value then
			return true
		end
	end
	return false
end

return isCreatorStoreAssetType