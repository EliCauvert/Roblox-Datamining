local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local AXCommonModule = require(Parent.AXCommon)
local IxpUtilsModule = require(Parent.IxpUtils)
local RoactGamepadModule = require(Parent.RoactGamepad)
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local CatalogItemCard = AXCommonModule.Components.CatalogItemCard.CatalogItemCard
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local ItemCardThumbnail = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnail
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local CarouselModule = require(AvatarExperienceSearch.Components.Carousel.Carousel)
local SearchLandingPageWidgetEnumModule = require(AvatarExperienceSearch.Enums.SearchLandingPageWidgetEnum)
local GetRbxThumbTypeFunction = AXCommonModule.Utils.getRbxThumbType
local _ = require(AvatarExperienceSearch.Features.RecentlyViewedSearchItemsWidget.useRecentlyViewedSearchItemsWidgetProps)
local AXRecentlyViewedSearchItemsIXPTest = AXCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest
local config = {
	widgetTitleSearchItems = "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedSearchItems",
	widgetTitleAllItems = "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedItems"
}

return function(Frame)
	-- upvalues: UseNavigationFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), IxpUtilsModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), ReactModule (copy), GetRbxThumbTypeFunction (copy), CatalogItemCard (copy), RoactGamepadModule (copy), ItemCardThumbnail (copy), WidgetLayout (copy), WidgetHeader (copy), AvatarScreen (copy), SearchLandingPageWidgetEnumModule (copy), CarouselModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = UseTokensFunction()
	local Items = Frame.items or {}
	local UseLocalizationResult = UseLocalizationFunction(config)
	local TestVariable = IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledSaveInCatalog)
	local ItemWidth = Frame.itemWidth
	
	if Frame.itemsPerRow > 0 and Frame.itemsPerRow < #Items then
		ItemWidth = math.floor(ItemWidth * 0.95)
	end
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
		headerSlot = ReactModule.createElement(WidgetHeader, {
			titleText = if TestVariable then UseLocalizationResult.widgetTitleAllItems else UseLocalizationResult.widgetTitleSearchItems,
			seeAllCallback = function()
				-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SearchLandingPageWidgetEnumModule (upval)
				UseNavigationResult.navigate(AvatarScreen.SearchLandingFocusedWidgetPage, {
					widgetType = SearchLandingPageWidgetEnumModule.RecentlyViewedItems
				})
			end,
			NextSelectionDown = Frame.firstSuggestedItemRef,
			NextSelectionUp = Frame.nextSelectionUp
		}),
		contentSlot = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, -UseTokensResult.Size.Size_600),
				PaddingRight = UDim.new(0, -UseTokensResult.Size.Size_600)
			}),
			RecentlyViewedSearchItemsWidgetContent = ReactModule.createElement(CarouselModule, {
				itemPadding = UseTokensResult.Size.Size_250,
				carouselMargin = UseTokensResult.Size.Size_600
			}, (ReactModule.useCallback(function()
				-- upvalues: Items (copy), GetRbxThumbTypeFunction (upval), ReactModule (upval), CatalogItemCard (upval), RoactGamepadModule (upval), UseTokensResult (copy), ItemCardThumbnail (upval), ItemWidth (ref), Frame (copy)
				local Elements = {}
				
				for LayoutOrder, item in Items do
					local RecentlyViewedSearchItemTileName: string = `RecentlyViewedSearchItemTile-{item.id}`
					local RbxThumbType = GetRbxThumbTypeFunction(item.itemType)
					local LowestPrice = item.lowestPrice or (item.priceInRobux or nil)
					
					if RbxThumbType ~= nil then
						Elements[RecentlyViewedSearchItemTileName] = ReactModule.createElement(CatalogItemCard, {
							onActivated = item.onActivated,
							presentationSlot = ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
								ClipsDescendants = true,
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Size = UDim2.fromScale(1, 1)
							}, {
								CornerRadius = ReactModule.createElement("UICorner", {
									CornerRadius = UDim.new(0, UseTokensResult.Size.Size_600)
								}),
								Thumbnail = ReactModule.createElement(ItemCardThumbnail, {
									url = `rbxthumb://type={RbxThumbType}&id={item.id}&w=150&h=150`
								})
							}),
							priceLineContent = if item.priceStatus then { type = "text", text = item.priceStatus } elseif LowestPrice then { type = "price", price = LowestPrice or 0 } else nil,
							title = item.name,
							Size = UDim2.fromOffset(ItemWidth, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							ref = if LayoutOrder == 1 then Frame.firstSuggestedItemRef else nil,
							nextSelectionDown = Frame.nextSelectionDown,
							nextSelectionUp = Frame.nextSelectionUp,
							LayoutOrder = LayoutOrder
						})
					end
				end
				return Elements
			end, {
				Items,
				Frame.firstSuggestedItemRef,
				Frame.nextSelectionDown,
				Frame.nextSelectionUp,
				ItemWidth
			})()))
		})
	})
end