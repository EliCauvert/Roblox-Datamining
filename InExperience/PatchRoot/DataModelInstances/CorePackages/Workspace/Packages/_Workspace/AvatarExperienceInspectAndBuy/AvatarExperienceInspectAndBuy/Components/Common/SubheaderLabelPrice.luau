local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local shouldShowPriceLabel = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)

return function(p0)
	-- upvalues: reactModule (ref), shouldShowPriceLabel (ref), foundationModule (ref), text (ref), icon (ref), iconSize (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: shouldShowPriceLabel (copy), p0 (ref)
		return shouldShowPriceLabel(p0.priceStatus)
	end, { p0.priceStatus })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
		LayoutOrder = p0.LayoutOrder
	}, {
		LeftSlotLabel = if p0.subheaderText.leftSlotLabel then reactModule.createElement(text, {
			tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
			LayoutOrder = 1,
			Text = p0.subheaderText.leftSlotLabel
		}) else nil,
		Spacer = if var3 and p0.subheaderText.leftSlotLabel and p0.subheaderText.leftSlotLabel ~= "" then reactModule.createElement(icon, {
			name = "icons/controls/keys/period",
			LayoutOrder = 2,
			size = iconSize.Small
		}) else nil,
		RightSlotLabel = if var3 and p0.subheaderText.rightSlotPrice then reactModule.createElement(foundationModule.View, {
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
				Text = p0.subheaderText.rightSlotPrice
			})
		}) else nil
	})
end