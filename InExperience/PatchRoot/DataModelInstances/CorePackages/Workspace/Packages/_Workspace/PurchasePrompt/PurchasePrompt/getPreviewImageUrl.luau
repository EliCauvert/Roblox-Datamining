local parent = script.Parent
local contentProviderService = game:GetService("ContentProvider")
local itemTypeModule = require(parent.Enums.ItemType)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local replaced = string.gsub(contentProviderService.BaseUrl:lower(), "https?://m.", "https?://www.")
local text = replaced .. "thumbs/asset.ashx?assetid="
local text_1 = replaced .. "outfit-thumbnail/image?userOutfitId=%s&width=100&height=100&format=png"

return function(p1, p2)
	-- upvalues: itemTypeModule (ref), text_1 (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), text (ref)
	local iconImageAssetId = nil
	
	if p1.itemType == itemTypeModule.Bundle then
		if p1.costumeId then
			return string.format(text_1, p1.costumeId)
		end
		iconImageAssetId = p1.items[1].id
	elseif p1.AssetId ~= nil and p1.AssetId ~= 0 then
		iconImageAssetId = p1.AssetId
	elseif p1.IconImageAssetId == nil then
		return if fFlagEnableUnifiedProductPurchaseFlow and p1.ImageUrl ~= nil then p1.ImageUrl elseif p2 == Enum.Platform.XBoxOne then "rbxasset://textures/ui/Shell/Icons/ROBUXIcon@1080.png" else text .. tostring(iconImageAssetId) .. "&x=100&y=100&format=png"
	end
	iconImageAssetId = p1.IconImageAssetId
end