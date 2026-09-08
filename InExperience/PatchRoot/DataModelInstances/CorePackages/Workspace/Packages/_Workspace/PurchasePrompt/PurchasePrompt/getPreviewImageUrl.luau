local itemTypeModule = require(script.Parent.Enums.ItemType)
local replaced = string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "https?://m.", "https?://www.")
local text = replaced .. "thumbs/asset.ashx?assetid="
local text_1 = replaced .. "outfit-thumbnail/image?userOutfitId=%s&width=100&height=100&format=png"

return function(p1, p2)
	-- upvalues: itemTypeModule (ref), text_1 (ref), text (ref)
	local iconImageAssetId = nil
	
	if p1.itemType == itemTypeModule.Bundle then
		if p1.costumeId then
			return string.format(text_1, p1.costumeId)
		end
		iconImageAssetId = p1.items[1].id
	elseif p1.AssetId ~= nil and p1.AssetId ~= 0 then
		iconImageAssetId = p1.AssetId
	elseif p1.IconImageAssetId == nil then
		return if p1.ImageUrl == nil then if p2 == Enum.Platform.XBoxOne then "rbxasset://textures/ui/Shell/Icons/ROBUXIcon@1080.png" else text .. tostring(iconImageAssetId) .. "&x=100&y=100&format=png" else p1.ImageUrl
	end
	iconImageAssetId = p1.IconImageAssetId
end