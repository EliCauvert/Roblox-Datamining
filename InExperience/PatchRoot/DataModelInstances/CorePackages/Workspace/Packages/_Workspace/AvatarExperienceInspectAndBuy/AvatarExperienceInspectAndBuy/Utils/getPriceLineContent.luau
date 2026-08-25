local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(parent.AXCommon)
local _ = require(parent.Foundation)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Types)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local var3 = if fFlagSocialEnableProfileInspectAndBuy then require(avatarExperienceInspectAndBuy.Utils.getPriceStatusInShop) else nil

return function(p0, p1, p2, p3)
	-- upvalues: fFlagSocialEnableProfileInspectAndBuy (ref), var3 (ref), getPriceStatusModule (ref), priceStatusModule (ref)
	local var5
	local t = {}
	local _ = nil
	
	if fFlagSocialEnableProfileInspectAndBuy and p3 and p3.isShopContext then
		assert(not p3.disableResaleWhenStockIsAvailable, "disableResaleWhenStockIsAvailable is not applicable when isShopContext is true")
		var5 = var3(p0)
	else
		var5 = getPriceStatusModule(p0, true)
	end
	local t_1 = {
		[priceStatusModule.Owned] = { { type = "text", text = p2[priceStatusModule.Owned] } },
		[priceStatusModule.Free] = { { type = "text", text = p2[priceStatusModule.Free] } },
		[priceStatusModule.QuantityLimitReached] = {
			{
				type = "text",
				colorStyle = p1.Color.System.Warning,
				text = p2[priceStatusModule.QuantityLimitReached]
			}
		},
		[priceStatusModule.InExperienceOnly] = {
			{
				type = "text",
				text = p2[priceStatusModule.InExperienceOnly],
				colorStyle = p1.Color.System.Warning
			}
		},
		[priceStatusModule.PurchaseFromRoblox] = { { type = "price", price = p0.priceInRobux } },
		[priceStatusModule.PurchaseFromResale] = if p0.isOffSale then {
			{
				type = "price",
				price = if p0.collectibleItemDetails then p0.collectibleItemDetails.lowestResalePrice else 0
			}
		} else {
			{
				type = "price",
				strikethrough = true,
				price = p0.priceInRobux
			},
			{
				type = "price",
				price = if p0.collectibleItemDetails then p0.collectibleItemDetails.lowestResalePrice else 0,
				colorStyle = p1.Color.System.Warning
			}
		},
		[priceStatusModule.SoldOut] = {
			{
				type = "text",
				text = p2[priceStatusModule.SoldOut],
				colorStyle = p1.Color.System.Warning
			}
		},
		[priceStatusModule.OffSale] = {
			{
				type = "text",
				text = p2[priceStatusModule.OffSale],
				colorStyle = p1.Color.System.Warning
			}
		},
		[priceStatusModule.Unavailable] = {
			{
				type = "text",
				text = p2[priceStatusModule.Unavailable],
				colorStyle = p1.Color.System.Warning
			}
		}
	}
	
	if t_1[var5] then
		t = t_1[var5]
	end
	return t
end