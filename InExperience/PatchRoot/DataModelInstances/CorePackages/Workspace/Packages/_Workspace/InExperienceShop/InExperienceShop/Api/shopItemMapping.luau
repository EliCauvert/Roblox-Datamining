local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Types)
local formatUpdatedDateModule = require(inExperienceShop.Utils.formatUpdatedDate)
local fFlagShopProductsUseDisplayNameModule = require(inExperienceShop.Flags.FFlagShopProductsUseDisplayName)

local function _(p1)
	-- upvalues: fFlagShopProductsUseDisplayNameModule (ref)
	return if fFlagShopProductsUseDisplayNameModule then p1.DisplayName or p1.Name else p1.Name
end

return {
	makeRequestKey = function(p1, p2)
		return tostring(p1) .. ":" .. tostring(p2)
	end,
	toShopItemThumbnail = function(p1)
		return if p1 == nil then "" else "rbxassetid://" .. tostring(p1)
	end,
	toShopItemCreator = function(p1)
		return if p1 == nil then nil else {
			name = p1.Name,
			hasVerifiedBadge = p1.HasVerifiedBadge == true
		}
	end,
	toShopItem = function(p1, p2, p3)
		-- upvalues: fFlagShopProductsUseDisplayNameModule (ref), formatUpdatedDateModule (ref)
		local t = {
			isOwned = false,
			id = if p2 == "Product" then tostring(p1.ProductId) else tostring(p3),
			name = if fFlagShopProductsUseDisplayNameModule then p1.DisplayName or p1.Name else p1.Name
		}
		local iconImageAssetId = p1.IconImageAssetId
		t.thumbnail = if iconImageAssetId == nil then "" else "rbxassetid://" .. tostring(iconImageAssetId)
		t.price = p1.PriceInRobux
		t.userBasePriceInRobux = p1.UserBasePriceInRobux or p1.BasePriceInRobux
		t.description = p1.Description
		t.updated = formatUpdatedDateModule(p1.Updated)
		t.itemType = p2
		local creator = p1.Creator
		t.creator = if creator == nil then nil else {
			name = creator.Name,
			hasVerifiedBadge = creator.HasVerifiedBadge == true
		}
		
		return t
	end
}