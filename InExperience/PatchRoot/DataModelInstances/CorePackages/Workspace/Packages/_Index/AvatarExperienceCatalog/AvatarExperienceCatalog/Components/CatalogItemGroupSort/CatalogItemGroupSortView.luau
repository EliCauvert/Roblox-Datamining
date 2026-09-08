local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local impressionsModule = require(parent.Impressions)
local useImpressionsTagger = impressionsModule.useImpressionsTagger
local screenSizeImpressionsDetector = impressionsModule.ScreenSizeImpressionsDetector
local _ = require(parent.AppCommonLib)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCatalogItemInformationPopover = avatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover
local fFlagAXCatalogUseFixedWidgetPadding = avatarExperienceFlagsModule.FFlagAXCatalogUseFixedWidgetPadding
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local resolveWidgetListItemBottomPaddingPxModule = require(avatarExperienceCatalog.Utils.resolveWidgetListItemBottomPaddingPx)
local widgetHeader = avatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local widgetLayout = avatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local widgetListItem = avatarExperienceUIKitModule.WidgetComponents.WidgetListItem
local grid = avatarExperienceUIKitModule.GridComponents.Grid

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useImpressionsTagger (ref), widgetConstantsModule (ref), useTokens (ref), reactModule (ref), widgetListItem (ref), fFlagAXCatalogUseFixedWidgetPadding (ref), resolveWidgetListItemBottomPaddingPxModule (ref), widgetLayout (ref), widgetHeader (ref), fFlagAXCatalogItemInformationPopover (ref), grid (ref), screenSizeImpressionsDetector (ref)
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
					["Widget_" .. p0.widgetId] = reactModule.createElement(grid, {
						itemsPerRow = p1.itemsPerRow,
						renderItem = function(p3)
							-- upvalues: p1 (ref)
							local item = p3.item
							
							return p1.renderTile({
								id = item.id,
								type = item.type,
								gridInformation = p3.gridInformation
							}, p3.index)
						end,
						getItemId = function(p3)
							-- upvalues: p1 (ref)
							return tostring(p3.id) .. "_" .. tostring(p1.itemsPerRow)
						end,
						items = p1.gridItems,
						gapVertical = p1.itemGap,
						gapHorizontal = p1.itemGap,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						ref = p1.containerRef,
						[reactModule.Tag] = "data-testid=CatalogItemGroupSortView"
					}),
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