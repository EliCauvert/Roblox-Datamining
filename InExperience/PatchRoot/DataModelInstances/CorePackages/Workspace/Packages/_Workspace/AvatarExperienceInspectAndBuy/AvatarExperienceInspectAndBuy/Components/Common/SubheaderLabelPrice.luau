local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local ShouldShowPriceLabelFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel
local _ = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

return function(Frame) --[[ Line: 35 | Named "SubheaderLabelPrice" ]]
	-- upvalues: ReactModule (copy), ShouldShowPriceLabelFunction (copy), FoundationModule (copy), Text (copy), Icon (copy), IconSize (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: ShouldShowPriceLabelFunction (upval), Frame (copy)
		return ShouldShowPriceLabelFunction(Frame.priceStatus)
	end, { Frame.priceStatus })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		LeftSlotLabel = if Frame.subheaderText.leftSlotLabel then ReactModule.createElement(Text, {
			tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
			LayoutOrder = 1,
			Text = Frame.subheaderText.leftSlotLabel
		}) else nil,
		Spacer = if UseMemoResult and Frame.subheaderText.leftSlotLabel and Frame.subheaderText.leftSlotLabel ~= "" then ReactModule.createElement(Icon, {
			name = "icons/controls/keys/period",
			LayoutOrder = 2,
			size = IconSize.Small
		}) else nil,
		RightSlotLabel = if UseMemoResult and Frame.subheaderText.rightSlotPrice then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = "icons/common/robux",
				LayoutOrder = 1,
				size = IconSize.Small
			}),
			RightSlotLabel = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
				LayoutOrder = 2,
				Text = Frame.subheaderText.rightSlotPrice
			})
		}) else nil
	})
end