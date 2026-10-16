local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(Parent.AXCommon)
local _ = require(Parent.Foundation)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local FFlagAXIaBDiscountPriceLine = require(Parent.AvatarExperienceFlags).FFlagAXIaBDiscountPriceLine
local FFlagAXIaBEnableShopContext = require(Parent.AvatarExperienceFlags).FFlagAXIaBEnableShopContext
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy or FFlagAXIaBEnableShopContext
local GetPriceStatusInShopModule = if FFlagSocialEnableProfileInspectAndBuy then require(AvatarExperienceInspectAndBuy.Utils.getPriceStatusInShop) else nil

return function(p1, p2, p3, p4) --[[ Line: 35 | Named "getPriceLineContent" ]]
	-- upvalues: FFlagSocialEnableProfileInspectAndBuy (copy), GetPriceStatusInShopModule (copy), GetPriceStatusModule (copy), FFlagAXIaBDiscountPriceLine (copy), PriceStatusModule (copy)
	local t = {}
	local PriceStatusModule1 = nil
	
	if FFlagSocialEnableProfileInspectAndBuy and p4 and p4.isShopContext then
		assert(not p4.disableResaleWhenStockIsAvailable, "disableResaleWhenStockIsAvailable is not applicable when isShopContext is true")
		PriceStatusModule1 = GetPriceStatusInShopModule(p1)
	else
		PriceStatusModule1 = GetPriceStatusModule(p1, true)
	end
	local v1 = nil
	
	if FFlagAXIaBDiscountPriceLine and p1.discountInformation then
		local DiscountInformation = p1.discountInformation
		
		if DiscountInformation.totalDiscountAmount and DiscountInformation.totalDiscountAmount > 0 then
			v1 = DiscountInformation
		end
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
		[PriceStatusModule.PurchaseFromRoblox] = if v1 then {
			{
				type = "price",
				strikethrough = true,
				isOriginalPrice = true,
				price = v1.originalPrice
			},
			{ type = "price", price = p1.priceInRobux }
		} else { { type = "price", price = p1.priceInRobux } },
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