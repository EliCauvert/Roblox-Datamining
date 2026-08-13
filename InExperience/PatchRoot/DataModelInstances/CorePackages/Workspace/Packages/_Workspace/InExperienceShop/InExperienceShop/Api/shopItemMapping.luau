local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Types)
local formatUpdatedDateModule = require(inExperienceShop.Utils.formatUpdatedDate)
local fFlagShopProductsUseDisplayNameModule = require(inExperienceShop.Flags.FFlagShopProductsUseDisplayName)

local function _(p0) --[[ line: 76 | named "toShopItemName" ]]
	-- upvalues: fFlagShopProductsUseDisplayNameModule (ref)
	return if fFlagShopProductsUseDisplayNameModule then p0.DisplayName or p0.Name else p0.Name
end

return {
	makeRequestKey = function(p1, p2) --[[ line: 28 ]]
		return tostring(p1) .. ":" .. tostring(p2)
	end,
	toShopItemThumbnail = function(p3) --[[ line: 37 ]]
		return if p3 == nil then "" else "rbxassetid://" .. tostring(p3)
	end,
	toShopItemCreator = function(p4) --[[ line: 50 ]]
		return if p4 == nil then nil else {
			name = p4.Name,
			hasVerifiedBadge = p4.HasVerifiedBadge == true
		}
	end,
	toShopItem = function(p5, p6, p7) --[[ line: 83 ]]
		-- upvalues: fFlagShopProductsUseDisplayNameModule (ref), formatUpdatedDateModule (ref)
		local t = {
			isOwned = false,
			id = if p6 == "Product" then tostring(p5.ProductId) else tostring(p7),
			name = if fFlagShopProductsUseDisplayNameModule then p5.DisplayName or p5.Name else p5.Name
		}
		local iconImageAssetId = p5.IconImageAssetId
		t.thumbnail = if iconImageAssetId == nil then "" else "rbxassetid://" .. tostring(iconImageAssetId)
		t.price = p5.PriceInRobux
		t.userBasePriceInRobux = p5.UserBasePriceInRobux or p5.BasePriceInRobux
		t.description = p5.Description
		t.updated = formatUpdatedDateModule(p5.Updated)
		t.itemType = p6
		local creator = p5.Creator
		t.creator = if creator == nil then nil else {
			name = creator.Name,
			hasVerifiedBadge = creator.HasVerifiedBadge == true
		}
		
		return t
	end
}