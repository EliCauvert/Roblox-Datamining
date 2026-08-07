local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local itemGridModule = require(inExperienceShop.Components.ItemGrid)
local _ = require(inExperienceShop.Components.ItemRow)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local var5 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var6 = if var5 then var5.Constants.ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)

return function(p0) --[[ line: 34 | named "CategoryPageView" ]]
	-- upvalues: useShopImpressionsDetectorModule (ref), var6 (ref), reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), view (ref), scrollView (ref), foundationModule (ref), itemGridModule (ref)
	local var8 = useShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if var6 then var6.Category else ""
	})
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		testId = "CategoryPageView",
		LayoutOrder = p0.LayoutOrder
	}, {
		Scroll = reactModule.createElement(scrollView, {
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_) --[[ line: 41 ]]
				-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var8 (ref)
				if fFlagEnableInExperienceShopUnifiedLoggingModule then
					var8.onLayoutChange()
				end
			end, { var8.onLayoutChange }) else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			Content = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var8.gridRef else nil,
				onAbsoluteSizeChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then function(_) --[[ line: 72 ]]
					-- upvalues: var8 (ref)
					var8.onLayoutChange()
				end else nil
			}, {
				Grid = reactModule.createElement(itemGridModule, {
					gap = "gap-large",
					items = p0.items,
					itemsPerRow = p0.itemsPerRow,
					sectionId = p0.sectionId,
					onItemActivated = p0.onItemActivated,
					renderTile = p0.renderTile,
					isFeaturedDoubleWidthRobux = p0.isFeaturedDoubleWidthRobux,
					onGridLayoutChange = if fFlagEnableInExperienceShopUnifiedLoggingModule then var8.onLayoutChange else nil
				})
			})
		}),
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var8.impressionsDetector else nil
	})
end