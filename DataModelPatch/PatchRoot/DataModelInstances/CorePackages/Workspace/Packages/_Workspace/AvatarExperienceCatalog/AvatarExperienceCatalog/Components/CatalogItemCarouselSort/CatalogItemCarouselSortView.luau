local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local ImpressionsModule = require(Parent.Impressions)
local UseImpressionsTaggerFunction = ImpressionsModule.useImpressionsTagger
local ScreenSizeImpressionsDetector = ImpressionsModule.ScreenSizeImpressionsDetector
local _ = require(Parent.AppCommonLib)
local ScrollingAppCarousel = require(Parent.AppBlox).ScrollingAppCarousel
local FFlagAXCatalogItemInformationPopover = require(Parent.AvatarExperienceFlags).FFlagAXCatalogItemInformationPopover
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local WidgetListItem = AvatarExperienceUIKitModule.WidgetComponents.WidgetListItem
local WidgetPaddingSizing = game:DefineFastInt("WidgetPaddingSizing", 32)

local function _(p1)
	-- upvalues: WidgetPaddingSizing (copy)
	local XXLarge = p1.Padding.XXLarge
	
	return ({
		[32] = XXLarge,
		[24] = p1.Padding.XXLarge,
		[20] = p1.Padding.XLarge,
		[16] = p1.Padding.Large
	})[WidgetPaddingSizing] or XXLarge
end

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseImpressionsTaggerFunction (copy), WidgetConstantsModule (copy), UseTokensFunction (copy), ReactModule (copy), WidgetListItem (copy), WidgetPaddingSizing (copy), WidgetLayout (copy), WidgetHeader (copy), FFlagAXCatalogItemInformationPopover (copy), ScrollingAppCarousel (copy), ScreenSizeImpressionsDetector (copy)
	UseImpressionsTaggerFunction(p1.containerRef, WidgetConstantsModule.WidgetExposureMetadata.TagName, p1.widgetRow)
	local UseTokensResult = UseTokensFunction()
	local HasSeeAllCallback: boolean = if p1.headerText == nil then if p1.headerDescription == nil then p1.seeAllCallback ~= nil else p1.headerDescription ~= "" or p1.seeAllCallback ~= nil else p1.headerText ~= "" or (if p1.headerDescription == nil then p1.seeAllCallback ~= nil else p1.headerDescription ~= "" or p1.seeAllCallback ~= nil)
	local Items = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, p1.itemGap),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
	}
	
	for _, visibleItem in p1.visibleItems do
		Items[`item-{visibleItem.absoluteIndex}`] = p1.renderTile({
			id = visibleItem.id,
			type = visibleItem.type,
			gridInformation = visibleItem.gridInformation
		}, visibleItem.absoluteIndex)
	end
	local XXLarge = UseTokensResult.Padding.XXLarge
	
	return ReactModule.createElement(WidgetListItem, {
		ref = Ref,
		padding = {
			bottom = UDim.new(0, ({
				[32] = XXLarge,
				[24] = UseTokensResult.Padding.XXLarge,
				[20] = UseTokensResult.Padding.XLarge,
				[16] = UseTokensResult.Padding.Large
			})[WidgetPaddingSizing] or XXLarge)
		},
		horizontalMargin = p1.horizontalMargin
	}, {
		Widget = ReactModule.createElement(WidgetLayout, {
			headerSlot = if HasSeeAllCallback then ReactModule.createElement(WidgetHeader, {
				LayoutOrder = 1,
				titleText = p1.headerText,
				descriptionText = p1.headerDescription,
				informationPopoverText = if FFlagAXCatalogItemInformationPopover then p1.informationPopoverText else nil,
				onInformationIconActivated = if FFlagAXCatalogItemInformationPopover then p1.onInformationIconActivated else nil,
				seeAllCallback = p1.seeAllCallback
			}) else nil,
			contentSlot = ReactModule.createElement(ReactModule.Fragment, nil, {
				["Widget_" .. p1.widgetId] = ReactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ref = p1.containerRef,
					[ReactModule.Tag] = "data-testid=CatalogItemCarouselSortView"
				}, ReactModule.createElement(ScrollingAppCarousel, {
					carouselHeight = 0,
					shouldExpandToFitContentHeight = true,
					items = Items,
					index = math.max(1, (math.min(p1.carouselIndex, (math.max(1, p1.carouselItemCount))))),
					styleProps = p1.carouselArrowStyleProps,
					itemCount = p1.carouselItemCount,
					itemWidth = math.max(1, p1.itemWidth),
					itemPadding = p1.itemGap,
					carouselMargin = p1.carouselMargin,
					canvasWidth = math.max(1, p1.canvasWidth),
					onChangeCanvasPosition = p1.onScrollChanged,
					onRefCallback = p1.onScrollChanged
				})),
				ImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsDetector, {
					onRequestImpressionsSignal = p1.onItemsUpdatedSignal,
					onImpressionsDetected = p1.onImpressionsDetected,
					filterImpressionFunc = p1.filterImpressionFunc,
					impressionsTag = p1.impressionsKey
				})
			})
		})
	})
end)