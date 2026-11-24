local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local SuggestedItemListModule = require(AvatarExperienceSearch.Components.SuggestedItemList)
local config = {
	widgetTitle = "Feature.Avatar.Label.SearchLandingPage.Title.RecentSearches"
}

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), WidgetLayout (copy), WidgetHeader (copy), SuggestedItemListModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(WidgetLayout, {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = Frame.LayoutOrder,
		padding = {
			left = UDim.new(0, UseTokensResult.Size.Size_400),
			right = UDim.new(0, UseTokensResult.Size.Size_400)
		},
		headerSlot = if Frame.hasQuery then nil else ReactModule.createElement(WidgetHeader, { titleText = UseLocalizationResult.widgetTitle }),
		contentSlot = ReactModule.createElement(SuggestedItemListModule, {
			disableScroll = true,
			items = Frame.items,
			firstSuggestedItemRef = Frame.firstSuggestedItemRef
		})
	})
end