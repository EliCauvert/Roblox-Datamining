local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local impressionsModule = require(parent.Impressions)
local useImpressionsTagger = impressionsModule.useImpressionsTagger
local screenSizeImpressionsDetector = impressionsModule.ScreenSizeImpressionsDetector
local _ = require(parent.AppCommonLib)
local scrollingAppCarousel = require(parent.AppBlox).ScrollingAppCarousel
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCatalogItemInformationPopover = avatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover
local fFlagAXCatalogUseFixedWidgetPadding = avatarExperienceFlagsModule.FFlagAXCatalogUseFixedWidgetPadding
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local resolveWidgetListItemBottomPaddingPxModule = require(avatarExperienceCatalog.Utils.resolveWidgetListItemBottomPaddingPx)
local widgetHeader = avatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local widgetLayout = avatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local widgetListItem = avatarExperienceUIKitModule.WidgetComponents.WidgetListItem

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useImpressionsTagger (ref), widgetConstantsModule (ref), useTokens (ref), reactModule (ref), widgetListItem (ref), fFlagAXCatalogUseFixedWidgetPadding (ref), resolveWidgetListItemBottomPaddingPxModule (ref), widgetLayout (ref), widgetHeader (ref), fFlagAXCatalogItemInformationPopover (ref), scrollingAppCarousel (ref), screenSizeImpressionsDetector (ref)
	local var1
	useImpressionsTagger(p1.containerRef, widgetConstantsModule.WidgetExposureMetadata.TagName, p1.widgetRow)
	local var2 = useTokens()
	
	if p1.headerText ~= nil then
		var1 = true
		
		if p1.headerText == "" then
			if p1.headerDescription ~= nil then
				var1 = if p1.headerDescription == "" then p1.seeAllCallback ~= nil else true
			end
		end
		local t = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, p1.itemGap),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}
		
		for i, v in p1.visibleItems do
			t[`item-{v.absoluteIndex}`] = p1.renderTile({
				id = v.id,
				type = v.type,
				gridInformation = v.gridInformation
			}, v.absoluteIndex)
		end
		return reactModule.createElement(widgetListItem, {
			ref = p2,
			padding = {
				bottom = UDim.new(0, if fFlagAXCatalogUseFixedWidgetPadding then var2.Size.Size_800 else resolveWidgetListItemBottomPaddingPxModule(var2))
			},
			horizontalMargin = p1.horizontalMargin
		}, {
			Widget = reactModule.createElement(widgetLayout, {
				headerSlot = if var1 then reactModule.createElement(widgetHeader, {
					LayoutOrder = 1,
					titleText = p1.headerText,
					descriptionText = p1.headerDescription,
					informationPopoverText = if fFlagAXCatalogItemInformationPopover then p1.informationPopoverText else nil,
					onInformationIconActivated = if fFlagAXCatalogItemInformationPopover then p1.onInformationIconActivated else nil,
					seeAllCallback = p1.seeAllCallback
				}) else nil,
				contentSlot = reactModule.createElement(reactModule.Fragment, nil, {
					["Widget_" .. p0.widgetId] = reactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						ref = p1.containerRef,
						[reactModule.Tag] = "data-testid=CatalogItemCarouselSortView"
					}, reactModule.createElement(scrollingAppCarousel, {
						carouselHeight = 0,
						shouldExpandToFitContentHeight = true,
						items = t,
						index = math.max(1, math.min(p1.carouselIndex, math.max(1, p1.carouselItemCount))),
						styleProps = p1.carouselArrowStyleProps,
						itemCount = p1.carouselItemCount,
						itemWidth = math.max(1, p1.itemWidth),
						itemPadding = p1.itemGap,
						carouselMargin = p1.carouselMargin,
						canvasWidth = math.max(1, p1.canvasWidth),
						onChangeCanvasPosition = p1.onScrollChanged,
						onRefCallback = p1.onScrollChanged
					})),
					ImpressionsDetector = reactModule.createElement(screenSizeImpressionsDetector, {
						onRequestImpressionsSignal = p1.onItemsUpdatedSignal,
						onImpressionsDetected = p1.onImpressionsDetected,
						filterImpressionFunc = p1.filterImpressionFunc,
						impressionsTag = p1.impressionsKey
					})
				})
			})
		})
	end
end)