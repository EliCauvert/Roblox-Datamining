local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(Parent.AXCommon)
local _ = require(Parent.Foundation)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local GetPriceStatusInShopModule = if FFlagSocialEnableProfileInspectAndBuy then require(AvatarExperienceInspectAndBuy.Utils.getPriceStatusInShop) else nil

return function(p1, p2, p3, p4)
	-- upvalues: FFlagSocialEnableProfileInspectAndBuy (copy), GetPriceStatusInShopModule (copy), GetPriceStatusModule (copy), PriceStatusModule (copy)
	local t = {}
	local PriceStatusModule1 = nil
	
	if FFlagSocialEnableProfileInspectAndBuy and p4 and p4.isShopContext then
		assert(not p4.disableResaleWhenStockIsAvailable, "disableResaleWhenStockIsAvailable is not applicable when isShopContext is true")
		PriceStatusModule1 = GetPriceStatusInShopModule(p1)
	else
		PriceStatusModule1 = GetPriceStatusModule(p1, true)
	end
	local config = {
		[PriceStatusModule.Owned] = { { type = "text", text = p3[PriceStatusModule.Owned] } },
		[PriceStatusModule.Free] = { { type = "text", text = p3[PriceStatusModule.Free] } },
		[PriceStatusModule.QuantityLimitReached] = {
			{
				type = "text",
				colorStyle = p2.Color.System.Warning,
				text = p3[PriceStatusModule.QuantityLimitReached]
			}
		},
		[PriceStatusModule.InExperienceOnly] = {
			{
				type = "text",
				text = p3[PriceStatusModule.InExperienceOnly],
				colorStyle = p2.Color.System.Warning
			}
		},
		[PriceStatusModule.PurchaseFromRoblox] = { { type = "price", price = p1.priceInRobux } },
		[PriceStatusModule.PurchaseFromResale] = if p1.isOffSale then {
			{
				type = "price",
				price = if p1.collectibleItemDetails then p1.collectibleItemDetails.lowestResalePrice else 0
			}
		} else {
			{
				type = "price",
				strikethrough = true,
				price = p1.priceInRobux
			},
			{
				type = "price",
				price = if p1.collectibleItemDetails then p1.collectibleItemDetails.lowestResalePrice else 0,
				colorStyle = p2.Color.System.Warning
			}
		},
		[PriceStatusModule.SoldOut] = {
			{
				type = "text",
				text = p3[PriceStatusModule.SoldOut],
				colorStyle = p2.Color.System.Warning
			}
		},
		[PriceStatusModule.OffSale] = {
			{
				type = "text",
				text = p3[PriceStatusModule.OffSale],
				colorStyle = p2.Color.System.Warning
			}
		},
		[PriceStatusModule.Unavailable] = {
			{
				type = "text",
				text = p3[PriceStatusModule.Unavailable],
				colorStyle = p2.Color.System.Warning
			}
		}
	}
	
	if config[PriceStatusModule1] then
		t = config[PriceStatusModule1]
	end
	return t
end