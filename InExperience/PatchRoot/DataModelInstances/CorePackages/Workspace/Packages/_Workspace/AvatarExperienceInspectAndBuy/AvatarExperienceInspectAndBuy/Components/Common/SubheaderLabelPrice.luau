local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local shouldShowPriceLabel = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)

return function(p1)
	-- upvalues: reactModule (ref), shouldShowPriceLabel (ref), foundationModule (ref), text (ref), icon (ref), iconSize (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: shouldShowPriceLabel (copy), p1 (ref)
		return shouldShowPriceLabel(p1.priceStatus)
	end, { p1.priceStatus })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
		LayoutOrder = p1.LayoutOrder
	}, {
		LeftSlotLabel = if p1.subheaderText.leftSlotLabel then reactModule.createElement(text, {
			tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
			LayoutOrder = 1,
			Text = p1.subheaderText.leftSlotLabel
		}) else nil,
		Spacer = if var1 and p1.subheaderText.leftSlotLabel and p1.subheaderText.leftSlotLabel ~= "" then reactModule.createElement(icon, {
			name = "icons/controls/keys/period",
			LayoutOrder = 2,
			size = iconSize.Small
		}) else nil,
		RightSlotLabel = if var1 and p1.subheaderText.rightSlotPrice then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3
		}, {
			Icon = reactModule.createElement(icon, {
				name = "icons/common/robux",
				LayoutOrder = 1,
				size = iconSize.Small
			}),
			RightSlotLabel = reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
				LayoutOrder = 2,
				Text = p1.subheaderText.rightSlotPrice
			})
		}) else nil
	})
end