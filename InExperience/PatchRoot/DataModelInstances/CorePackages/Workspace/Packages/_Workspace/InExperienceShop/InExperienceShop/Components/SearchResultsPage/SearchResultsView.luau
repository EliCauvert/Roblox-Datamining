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
local var5 = if fFlagEnableInExperienceShopUnifiedLoggingModule then require(inExperienceShop.Analytics) else nil
local var6 = if var5 then var5.Constants.ShopPageType else nil
local var7 = if fFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopImpressionsDetectorModule = require(inExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(inExperienceShop.Types)
local formattedText = string.format("Type at least %d characters to search", require(inExperienceShop.Constants).SEARCH_MIN_LENGTH)
local t = { emptyText = "CommonUI.Messages.Response.NoResults" }

return function(p0) --[[ line: 51 | named "SearchResultsView" ]]
	-- upvalues: useLocalization (ref), t (ref), useShopImpressionsDetectorModule (ref), var6 (ref), reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), itemRowModule (ref), var7 (ref), formattedText (ref), view (ref), scrollView (ref), foundationModule (ref), text (ref)
	local var11 = useShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if var6 then var6.Search else ""
	})
	local var12 = if p0.state == "hint" then formattedText elseif p0.state == "empty" then useLocalization(t).emptyText else nil
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		testId = "SearchResultsView",
		LayoutOrder = p0.LayoutOrder
	}, {
		Scroll = if var12 == nil then reactModule.createElement(scrollView, {
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_) --[[ line: 60 ]]
				-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var11 (ref)
				if fFlagEnableInExperienceShopUnifiedLoggingModule then
					var11.onLayoutChange()
				end
			end, { var11.onLayoutChange }) else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			Content = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var11.gridRef else nil,
				onAbsoluteSizeChanged = if fFlagEnableInExperienceShopUnifiedLoggingModule then function(_) --[[ line: 122 ]]
					-- upvalues: var11 (ref)
					var11.onLayoutChange()
				end else nil
			}, reactModule.useMemo(function() --[[ line: 66 ]]
				-- upvalues: p0 (ref), reactModule (copy), itemRowModule (copy), var7 (copy)
				if p0.state ~= "results" then
					return {}
				end
				local t = {}
				
				for i, v in p0.rows do
					t["Row" .. i] = reactModule.createElement(itemRowModule, {
						items = v,
						columnCount = p0.columnCount,
						rowIndex = i,
						onItemActivated = p0.onItemActivated,
						shopPageType = if var7 then var7.Search else nil,
						LayoutOrder = i
					})
				end
				return t
			end, { p0.rows, p0.columnCount, p0.onItemActivated, p0.state }))
		}) else nil,
		ImpressionsDetector = if fFlagEnableInExperienceShopUnifiedLoggingModule then var11.impressionsDetector else nil,
		Message = if var12 ~= nil then nil else reactModule.createElement(view, {
			tag = "col align-x-center align-y-center size-full padding-x-xlarge padding-y-xlarge",
			testId = "SearchResultsMessage"
		}, {
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = var12
			})
		})
	})
end