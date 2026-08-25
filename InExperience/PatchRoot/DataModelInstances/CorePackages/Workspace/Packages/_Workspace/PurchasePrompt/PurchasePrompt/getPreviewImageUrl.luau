local parent = script.Parent
local contentProviderService = game:GetService("ContentProvider")
local itemTypeModule = require(parent.Enums.ItemType)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local replaced = string.gsub(contentProviderService.BaseUrl:lower(), "https?://m.", "https?://www.")
local text = replaced .. "thumbs/asset.ashx?assetid="
local text_1 = replaced .. "outfit-thumbnail/image?userOutfitId=%s&width=100&height=100&format=png"

return function(p0, p1)
	-- upvalues: itemTypeModule (ref), text_1 (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), text (ref)
	local iconImageAssetId = nil
	
	if p0.itemType == itemTypeModule.Bundle then
		if p0.costumeId then
			return string.format(text_1, p0.costumeId)
		end
		iconImageAssetId = p0.items[1].id
	elseif p0.AssetId ~= nil and p0.AssetId ~= 0 then
		iconImageAssetId = p0.AssetId
	elseif p0.IconImageAssetId == nil then
		return if fFlagEnableUnifiedProductPurchaseFlow and p0.ImageUrl ~= nil then p0.ImageUrl elseif p1 == Enum.Platform.XBoxOne then "rbxasset://textures/ui/Shell/Icons/ROBUXIcon@1080.png" else text .. tostring(iconImageAssetId) .. "&x=100&y=100&format=png"
	end
	iconImageAssetId = p0.IconImageAssetId
end