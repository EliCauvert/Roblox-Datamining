local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local itemGridModule = require(inExperienceShop.Components.ItemGrid)
local _ = require(inExperienceShop.Components.ItemRow)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local var1 = if require(inExperienceShop.Flags.FFlagShopRobuxTermsDisclosure) then require(inExperienceShop.Components.RobuxTermsDisclosure) else nil
local isSubjectToDesktopPolicies = require(parent.SharedFlags).isSubjectToDesktopPolicies
local var2 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var3 = if var2 then var2.Constants.ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)

return function(p1)
	-- upvalues: isSubjectToDesktopPolicies (ref), useShopImpressionsDetectorModule (ref), var3 (ref), reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), view (ref), scrollView (ref), foundationModule (ref), var1 (ref), itemGridModule (ref)
	local var4 = p1.showRobuxTermsDisclosure == true
	local var5 = useShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if var3 then var3.Category else ""
	})
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		testId = "CategoryPageView",
		LayoutOrder = p1.LayoutOrder
	}, {
		Scroll = reactModule.createElement(scrollView, {
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_)
				-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var5 (ref)
				if fFlagEnableInExperienceShopUnifiedLoggingModule then
					var5.onLayoutChange()
				end
			end, { var5.onLayoutChange }) else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			Content = reactModule.createElement(view, {
				tag = if var4 then "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge" else "size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var5.gridRef else nil,
				onAbsoluteSizeChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then function(_)
					-- upvalues: var5 (ref)
					var5.onLayoutChange()
				end else nil
			}, {
				Disclosure = if var4 and var1 then reactModule.createElement(var1, {
					LayoutOrder = 1,
					isMobile = not isSubjectToDesktopPolicies()
				}) else nil,
				Grid = reactModule.createElement(itemGridModule, {
					gap = "gap-large",
					LayoutOrder = if var4 then 2 else nil,
					items = p1.items,
					itemsPerRow = p1.itemsPerRow,
					sectionId = p1.sectionId,
					onItemActivated = p1.onItemActivated,
					renderTile = p1.renderTile,
					isFeaturedDoubleWidthRobux = p1.isFeaturedDoubleWidthRobux,
					onGridLayoutChange = if fFlagEnableInExperienceShopUnifiedLoggingModule then var5.onLayoutChange else nil
				})
			})
		}),
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var5.impressionsDetector else nil
	})
end