local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceUIKitModule = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local IconSize = FoundationModule.Enums.IconSize
local GetLocalizedPriceFunction = AvatarExperienceUIKitModule.Utils.getLocalizedPrice
local UseTokensFunction = FoundationModule.Hooks.useTokens
local TimerBadge = AvatarExperienceUIKitModule.TimerBadge
local Text = FoundationModule.Text
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local AXHeroUnitHeaderWrapText = game:DefineFastFlag("AXHeroUnitHeaderWrapText", false)
local AXHeroUnitHeaderCenterAbsolute = game:DefineFastFlag("AXHeroUnitHeaderCenterAbsolute", false)

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), AXHeroUnitHeaderWrapText (copy), ReactModule (copy), View (copy), Text (copy), Icon (copy), IconSize (copy), GetLocalizedPriceFunction (copy), AXHeroUnitHeaderCenterAbsolute (copy), TimerBadge (copy)
	local UseTokensResult = UseTokensFunction()
	local TitleText = Frame.titleText
	local DescriptionText = Frame.descriptionText
	local PriceInRobux = Frame.priceInRobux
	local IsNotDescriptionTextMatch: boolean = DescriptionText ~= nil and DescriptionText ~= ""
	local TitleTag = Frame.titleTag
	local DescriptionTag = Frame.descriptionTag
	local Message: string = if AXHeroUnitHeaderWrapText then `size-full-0 auto-y text-wrap text-align-x-left content-emphasis {TitleTag}` else `size-full-0 auto-y text-truncate-end text-align-x-left content-emphasis {TitleTag}`
	local Message1: string = if AXHeroUnitHeaderWrapText then `size-full-0 auto-y text-wrap text-align-x-left content-default {DescriptionTag}` else `size-full-0 auto-y text-align-x-left content-default {DescriptionTag}`
	local Element = ReactModule.createElement(View, {
		LayoutOrder = 2,
		tag = `col align-x-left size-full-0 auto-y {Frame.titleGroupGapTag}`
	}, {
		Title = if TitleText then ReactModule.createElement(Text, { LayoutOrder = 1, Text = TitleText, tag = Message }) else nil,
		Description = if IsNotDescriptionTextMatch then ReactModule.createElement(Text, { LayoutOrder = 2, tag = Message1, Text = DescriptionText }) else nil,
		PriceLine = if PriceInRobux == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			RobuxIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = "robux",
				style = UseTokensResult.Color.Content.Default,
				size = IconSize.Small
			}),
			Price = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-large content-default",
				Text = GetLocalizedPriceFunction(PriceInRobux)
			})
		})
	})
	
	return if Frame.centerTitleGroup then if Frame.bottomSlot or not AXHeroUnitHeaderCenterAbsolute then ReactModule.createElement(View, {
		tag = "col flex-y-between align-x-left size-full",
		LayoutOrder = Frame.LayoutOrder
	}, {
		TopSlot = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "auto-xy",
			Size = UDim2.new(0, 0, 0, 0)
		}, {
			Badge = if Frame.availableUntil then ReactModule.createElement(TimerBadge, { endTime = Frame.availableUntil }) else nil
		}),
		TitleGroup = Element,
		BottomSlot = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "auto-xy",
			Size = UDim2.new(0, 0, 0, 0)
		}, { Slot = Frame.bottomSlot })
	}) else ReactModule.createElement(View, { tag = "size-full", LayoutOrder = Frame.LayoutOrder }, {
		TopSlot = if Frame.availableUntil then ReactModule.createElement(View, { tag = "auto-xy", Size = UDim2.new(0, 0, 0, 0) }, {
			Badge = ReactModule.createElement(TimerBadge, { endTime = Frame.availableUntil })
		}) else nil,
		TitleGroup = ReactModule.createElement(View, {
			tag = "col align-x-left",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, { Content = Element })
	}) else ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = `col align-x-left size-full-0 auto-y {Frame.badgeGapTag or "gap-large"}`
	}, {
		Badge = if Frame.availableUntil then ReactModule.createElement(TimerBadge, { LayoutOrder = 1, endTime = Frame.availableUntil }) else nil,
		TitleGroup = Element,
		BottomSlot = if Frame.bottomSlot then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "auto-xy",
			Size = UDim2.new(0, 0, 0, 0)
		}, { Slot = Frame.bottomSlot }) else nil
	})
end