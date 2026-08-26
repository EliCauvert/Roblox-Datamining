local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(parent.AXCommon)
local _ = require(parent.Foundation)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Types)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local var1 = if fFlagSocialEnableProfileInspectAndBuy then require(avatarExperienceInspectAndBuy.Utils.getPriceStatusInShop) else nil

return function(p1, p2, p3, p4)
	-- upvalues: fFlagSocialEnableProfileInspectAndBuy (ref), var1 (ref), getPriceStatusModule (ref), priceStatusModule (ref)
	local var2
	local t = {}
	local _ = nil
	
	if fFlagSocialEnableProfileInspectAndBuy and p4 and p4.isShopContext then
		assert(not p4.disableResaleWhenStockIsAvailable, "disableResaleWhenStockIsAvailable is not applicable when isShopContext is true")
		var2 = var1(p1)
	else
		var2 = getPriceStatusModule(p1, true)
	end
	local t_1 = {
		[priceStatusModule.Owned] = { { type = "text", text = p3[priceStatusModule.Owned] } },
		[priceStatusModule.Free] = { { type = "text", text = p3[priceStatusModule.Free] } },
		[priceStatusModule.QuantityLimitReached] = {
			{
				type = "text",
				colorStyle = p2.Color.System.Warning,
				text = p3[priceStatusModule.QuantityLimitReached]
			}
		},
		[priceStatusModule.InExperienceOnly] = {
			{
				type = "text",
				text = p3[priceStatusModule.InExperienceOnly],
				colorStyle = p2.Color.System.Warning
			}
		},
		[priceStatusModule.PurchaseFromRoblox] = { { type = "price", price = p1.priceInRobux } },
		[priceStatusModule.PurchaseFromResale] = if p1.isOffSale then {
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
		[priceStatusModule.SoldOut] = {
			{
				type = "text",
				text = p3[priceStatusModule.SoldOut],
				colorStyle = p2.Color.System.Warning
			}
		},
		[priceStatusModule.OffSale] = {
			{
				type = "text",
				text = p3[priceStatusModule.OffSale],
				colorStyle = p2.Color.System.Warning
			}
		},
		[priceStatusModule.Unavailable] = {
			{
				type = "text",
				text = p3[priceStatusModule.Unavailable],
				colorStyle = p2.Color.System.Warning
			}
		}
	}
	
	if t_1[var2] then
		t = t_1[var2]
	end
	return t
end