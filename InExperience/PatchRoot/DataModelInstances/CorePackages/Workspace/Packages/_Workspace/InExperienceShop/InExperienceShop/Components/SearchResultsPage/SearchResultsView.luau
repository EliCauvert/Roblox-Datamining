local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local scrollView = foundationModule.ScrollView
local itemRowModule = require(inExperienceShop.Components.ItemRow)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagPassShopPurchaseSurfaceToBuyModal = require(parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local var1 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var2 = if var1 then var1.Constants.ShopPageType else nil
local var3 = if fFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)
local formattedText = string.format("Type at least %d characters to search", require(inExperienceShop.Constants).SEARCH_MIN_LENGTH)
local t = { emptyText = "CommonUI.Messages.Response.NoResults" }

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), useShopImpressionsDetectorModule (ref), var2 (ref), reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), itemRowModule (ref), var3 (ref), formattedText (ref), view (ref), scrollView (ref), foundationModule (ref), text (ref)
	local var4 = useShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if var2 then var2.Search else ""
	})
	local var5 = if p1.state == "hint" then formattedText elseif p1.state == "empty" then useLocalization(t).emptyText else nil
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		testId = "SearchResultsView",
		LayoutOrder = p1.LayoutOrder
	}, {
		Scroll = if var5 == nil then reactModule.createElement(scrollView, {
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_)
				-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var4 (ref)
				if fFlagEnableInExperienceShopUnifiedLoggingModule then
					var4.onLayoutChange()
				end
			end, { var4.onLayoutChange }) else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			Content = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var4.gridRef else nil,
				onAbsoluteSizeChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then function(_)
					-- upvalues: var4 (ref)
					var4.onLayoutChange()
				end else nil
			}, reactModule.useMemo(function()
				-- upvalues: p1 (ref), reactModule (copy), itemRowModule (copy), var3 (copy)
				if p1.state ~= "results" then
					return {}
				end
				local t = {}
				
				for i, v in p1.rows do
					t["Row" .. i] = reactModule.createElement(itemRowModule, {
						items = v,
						columnCount = p1.columnCount,
						rowIndex = i,
						onItemActivated = p1.onItemActivated,
						shopPageType = if var3 then var3.Search else nil,
						LayoutOrder = i
					})
				end
				return t
			end, { p1.rows, p1.columnCount, p1.onItemActivated, p1.state }))
		}) else nil,
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var4.impressionsDetector else nil,
		Message = if var5 ~= nil then nil else reactModule.createElement(view, {
			tag = "col align-x-center align-y-center size-full padding-x-xlarge padding-y-xlarge",
			testId = "SearchResultsMessage"
		}, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = var5
			})
		})
	})
end