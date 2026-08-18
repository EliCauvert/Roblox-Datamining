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

return reactModule.forwardRef(function(p0, p1) --[[ line: 79 | named "CatalogItemGroupSortView" ]]
	-- upvalues: useImpressionsTagger (ref), widgetConstantsModule (ref), useTokens (ref), reactModule (ref), widgetListItem (ref), fFlagAXCatalogUseFixedWidgetPadding (ref), resolveWidgetListItemBottomPaddingPxModule (ref), widgetLayout (ref), widgetHeader (ref), fFlagAXCatalogItemInformationPopover (ref), grid (ref), screenSizeImpressionsDetector (ref)
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
					["Widget_" .. p0.widgetId] = reactModule.createElement(grid, {
						itemsPerRow = p0.itemsPerRow,
						renderItem = function(p2) --[[ line: 86 ]]
							-- upvalues: p0 (ref)
							local item = p2.item
							
							return p0.renderTile({
								id = item.id,
								type = item.type,
								gridInformation = p2.gridInformation
							}, p2.index)
						end,
						getItemId = function(p3) --[[ line: 95 ]]
							-- upvalues: p0 (ref)
							return tostring(p3.id) .. "_" .. tostring(p0.itemsPerRow)
						end,
						items = p0.gridItems,
						gapVertical = p0.itemGap,
						gapHorizontal = p0.itemGap,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						ref = p0.containerRef,
						[reactModule.Tag] = "data-testid=CatalogItemGroupSortView"
					}),
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