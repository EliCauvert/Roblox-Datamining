local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Types)
local FormatUpdatedDateModule = require(InExperienceShop.Utils.formatUpdatedDate)
local FFlagShopProductsUseDisplayNameModule = require(InExperienceShop.Flags.FFlagShopProductsUseDisplayName)

local function _(Player) --[[ Line: 76 | Named "toShopItemName" ]]
	-- upvalues: FFlagShopProductsUseDisplayNameModule (copy)
	return FFlagShopProductsUseDisplayNameModule and Player.DisplayName or Player.Name
end

return {
	makeRequestKey = function(p1, p2): string --[[ Line: 28 ]]
		return tostring(p1) .. ":" .. tostring(p2)
	end,
	toShopItemThumbnail = function(p1): string --[[ Line: 37 ]]
		return if p1 == nil then "" else "rbxassetid://" .. tostring(p1)
	end,
	toShopItemCreator = function(p1) --[[ Line: 50 ]]
		return if p1 == nil then nil else {
			name = p1.Name,
			hasVerifiedBadge = p1.HasVerifiedBadge == true
		}
	end,
	toShopItem = function(Player, ItemType, p1) --[[ Line: 83 ]]
		-- upvalues: FFlagShopProductsUseDisplayNameModule (copy), FormatUpdatedDateModule (copy)
		local IconImageAssetId = Player.IconImageAssetId
		local Creator = Player.Creator
		
		return {
			isOwned = false,
			id = if ItemType == "Product" then tostring(Player.ProductId) else tostring(p1),
			name = FFlagShopProductsUseDisplayNameModule and Player.DisplayName or Player.Name,
			thumbnail = if IconImageAssetId == nil then "" else "rbxassetid://" .. tostring(IconImageAssetId),
			price = Player.PriceInRobux,
			userBasePriceInRobux = Player.UserBasePriceInRobux or Player.BasePriceInRobux,
			description = Player.Description,
			updated = FormatUpdatedDateModule(Player.Updated),
			itemType = ItemType,
			creator = if Creator == nil then nil else {
				name = Creator.Name,
				hasVerifiedBadge = Creator.HasVerifiedBadge == true
			}
		}
	end
}