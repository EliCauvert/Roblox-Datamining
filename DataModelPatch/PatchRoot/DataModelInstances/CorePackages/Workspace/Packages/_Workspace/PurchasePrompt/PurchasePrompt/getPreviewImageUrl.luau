local Parent = script.Parent
local ItemTypeModule = require(Parent.Enums.ItemType)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local Replaced = string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "https?://m.", "https?://www.")
local Text = Replaced .. "thumbs/asset.ashx?assetid="
local Text1 = Replaced .. "outfit-thumbnail/image?userOutfitId=%s&width=100&height=100&format=png"

return function(p1, Platform)
	-- upvalues: ItemTypeModule (copy), Text1 (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), Text (copy)
	local AssetId = nil
	
	if p1.itemType == ItemTypeModule.Bundle then
		if p1.costumeId then
			return string.format(Text1, p1.costumeId)
		end
		AssetId = p1.items[1].id
	elseif p1.AssetId == nil or p1.AssetId == 0 then
		if p1.IconImageAssetId ~= nil then
			AssetId = p1.IconImageAssetId
		elseif FFlagEnableUnifiedProductPurchaseFlow and p1.ImageUrl ~= nil then
			return p1.ImageUrl
		elseif Platform == Enum.Platform.XBoxOne then
			return "rbxasset://textures/ui/Shell/Icons/ROBUXIcon@1080.png"
		end
	else
		AssetId = p1.AssetId
	end
	return Text .. tostring(AssetId) .. "&x=100&y=100&format=png"
end