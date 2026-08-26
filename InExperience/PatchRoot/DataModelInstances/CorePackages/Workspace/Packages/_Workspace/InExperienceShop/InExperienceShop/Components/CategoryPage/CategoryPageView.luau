local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local itemGridModule = require(inExperienceShop.Components.ItemGrid)
local _ = require(inExperienceShop.Components.ItemRow)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local var1 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var2 = if var1 then var1.Constants.ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)

return function(p1)
	-- upvalues: useShopImpressionsDetectorModule (ref), var2 (ref), reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), view (ref), scrollView (ref), foundationModule (ref), itemGridModule (ref)
	local var3 = useShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if var2 then var2.Category else ""
	})
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		testId = "CategoryPageView",
		LayoutOrder = p1.LayoutOrder
	}, {
		Scroll = reactModule.createElement(scrollView, {
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_)
				-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var3 (ref)
				if fFlagEnableInExperienceShopUnifiedLoggingModule then
					var3.onLayoutChange()
				end
			end, { var3.onLayoutChange }) else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			Content = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var3.gridRef else nil,
				onAbsoluteSizeChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then function(_)
					-- upvalues: var3 (ref)
					var3.onLayoutChange()
				end else nil
			}, {
				Grid = reactModule.createElement(itemGridModule, {
					gap = "gap-large",
					items = p1.items,
					itemsPerRow = p1.itemsPerRow,
					sectionId = p1.sectionId,
					onItemActivated = p1.onItemActivated,
					renderTile = p1.renderTile,
					isFeaturedDoubleWidthRobux = p1.isFeaturedDoubleWidthRobux,
					onGridLayoutChange = if fFlagEnableInExperienceShopUnifiedLoggingModule then var3.onLayoutChange else nil
				})
			})
		}),
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var3.impressionsDetector else nil
	})
end