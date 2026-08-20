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

return reactModule.forwardRef(function(p0, p1) --[[ line: 82 | named "CatalogItemCarouselSortView" ]]
	-- upvalues: useImpressionsTagger (ref), widgetConstantsModule (ref), useTokens (ref), reactModule (ref), widgetListItem (ref), fFlagAXCatalogUseFixedWidgetPadding (ref), resolveWidgetListItemBottomPaddingPxModule (ref), widgetLayout (ref), widgetHeader (ref), fFlagAXCatalogItemInformationPopover (ref), scrollingAppCarousel (ref), screenSizeImpressionsDetector (ref)
	local var8
	useImpressionsTagger(p0.containerRef, widgetConstantsModule.WidgetExposureMetadata.TagName, p0.widgetRow)
	local var7 = useTokens()
	
	if p0.headerText ~= nil then
		var8 = true
		
		if p0.headerText == "" then
			if p0.headerDescription ~= nil then
				var8 = if p0.headerDescription == "" then p0.seeAllCallback ~= nil else true
			end
		end
		local t = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, p0.itemGap),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}
		
		for i, v in p0.visibleItems do
			t[`item-{v.absoluteIndex}`] = p0.renderTile({
				id = v.id,
				type = v.type,
				gridInformation = v.gridInformation
			}, v.absoluteIndex)
		end
		return reactModule.createElement(widgetListItem, {
			ref = p1,
			padding = {
				bottom = UDim.new(0, if fFlagAXCatalogUseFixedWidgetPadding then var7.Size.Size_800 else resolveWidgetListItemBottomPaddingPxModule(var7))
			},
			horizontalMargin = p0.horizontalMargin
		}, {
			Widget = reactModule.createElement(widgetLayout, {
				headerSlot = if var8 then reactModule.createElement(widgetHeader, {
					LayoutOrder = 1,
					titleText = p0.headerText,
					descriptionText = p0.headerDescription,
					informationPopoverText = if fFlagAXCatalogItemInformationPopover then p0.informationPopoverText else nil,
					onInformationIconActivated = if fFlagAXCatalogItemInformationPopover then p0.onInformationIconActivated else nil,
					seeAllCallback = p0.seeAllCallback
				}) else nil,
				contentSlot = reactModule.createElement(reactModule.Fragment, nil, {
					["Widget_" .. p0.widgetId] = reactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						ref = p0.containerRef,
						[reactModule.Tag] = "data-testid=CatalogItemCarouselSortView"
					}, reactModule.createElement(scrollingAppCarousel, {
						carouselHeight = 0,
						shouldExpandToFitContentHeight = true,
						items = t,
						index = math.max(1, math.min(p0.carouselIndex, math.max(1, p0.carouselItemCount))),
						styleProps = p0.carouselArrowStyleProps,
						itemCount = p0.carouselItemCount,
						itemWidth = math.max(1, p0.itemWidth),
						itemPadding = p0.itemGap,
						carouselMargin = p0.carouselMargin,
						canvasWidth = math.max(1, p0.canvasWidth),
						onChangeCanvasPosition = p0.onScrollChanged,
						onRefCallback = p0.onScrollChanged
					})),
					ImpressionsDetector = reactModule.createElement(screenSizeImpressionsDetector, {
						onRequestImpressionsSignal = p0.onItemsUpdatedSignal,
						onImpressionsDetected = p0.onImpressionsDetected,
						filterImpressionFunc = p0.filterImpressionFunc,
						impressionsTag = p0.impressionsKey
					})
				})
			})
		})
	end
end)