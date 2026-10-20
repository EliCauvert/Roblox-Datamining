local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local ImpressionsModule = require(Parent.Impressions)
local UseImpressionsTaggerFunction = ImpressionsModule.useImpressionsTagger
local ScreenSizeImpressionsDetector = ImpressionsModule.ScreenSizeImpressionsDetector
local _ = require(Parent.AppCommonLib)
local FFlagAXCatalogItemInformationPopover = require(Parent.AvatarExperienceFlags).FFlagAXCatalogItemInformationPopover
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local WidgetHeader = AvatarExperienceUIKitModule.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKitModule.WidgetComponents.WidgetLayout
local WidgetListItem = AvatarExperienceUIKitModule.WidgetComponents.WidgetListItem
local Grid = AvatarExperienceUIKitModule.GridComponents.Grid
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
	-- upvalues: UseImpressionsTaggerFunction (copy), WidgetConstantsModule (copy), UseTokensFunction (copy), ReactModule (copy), WidgetListItem (copy), WidgetPaddingSizing (copy), WidgetLayout (copy), WidgetHeader (copy), FFlagAXCatalogItemInformationPopover (copy), Grid (copy), ScreenSizeImpressionsDetector (copy)
	UseImpressionsTaggerFunction(p1.containerRef, WidgetConstantsModule.WidgetExposureMetadata.TagName, p1.widgetRow)
	local UseTokensResult = UseTokensFunction()
	local HasSeeAllCallback: boolean = if p1.headerText == nil then if p1.headerDescription == nil then p1.seeAllCallback ~= nil else p1.headerDescription ~= "" or p1.seeAllCallback ~= nil else p1.headerText ~= "" or (if p1.headerDescription == nil then p1.seeAllCallback ~= nil else p1.headerDescription ~= "" or p1.seeAllCallback ~= nil)
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
				["Widget_" .. p1.widgetId] = ReactModule.createElement(Grid, {
					itemsPerRow = p1.itemsPerRow,
					renderItem = function(p2)
						-- upvalues: p1 (copy)
						local Item = p2.item
						
						return p1.renderTile({
							id = Item.id,
							type = Item.type,
							gridInformation = p2.gridInformation
						}, p2.index)
					end,
					getItemId = function(p2): string
						-- upvalues: p1 (copy)
						return tostring(p2.id) .. "_" .. tostring(p1.itemsPerRow)
					end,
					items = p1.gridItems,
					gapVertical = p1.itemGap,
					gapHorizontal = p1.itemGap,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					ref = p1.containerRef,
					[ReactModule.Tag] = "data-testid=CatalogItemGroupSortView"
				}),
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