local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local ScrollView = FoundationModule.ScrollView
local ItemRowModule = require(InExperienceShop.Components.ItemRow)
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagPassShopPurchaseSurfaceToBuyModal = require(Parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local AnalyticsModule = if FFlagEnableInExperienceShopUnifiedLoggingModule then require(InExperienceShop.Analytics) else nil
local ShopPageType = if AnalyticsModule then AnalyticsModule.Constants.ShopPageType else nil
local ShopPageType1 = if FFlagPassShopPurchaseSurfaceToBuyModal then require(InExperienceShop.Analytics.Constants).ShopPageType else nil
local UseShopImpressionsDetectorModule = require(InExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(InExperienceShop.Types)
local Formatted = string.format("Type at least %d characters to search", require(InExperienceShop.Constants).SEARCH_MIN_LENGTH)
local config = { emptyText = "CommonUI.Messages.Response.NoResults" }

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseShopImpressionsDetectorModule (copy), ShopPageType (copy), ReactModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), ItemRowModule (copy), ShopPageType1 (copy), Formatted (copy), View (copy), ScrollView (copy), FoundationModule (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseShopImpressionsDetectorModuleResult = UseShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if ShopPageType then ShopPageType.Search else ""
	})
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), UseShopImpressionsDetectorModuleResult (copy)
		if FFlagEnableInExperienceShopUnifiedLoggingModule then
			UseShopImpressionsDetectorModuleResult.onLayoutChange()
		end
	end, { UseShopImpressionsDetectorModuleResult.onLayoutChange })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), ReactModule (upval), ItemRowModule (upval), ShopPageType1 (upval)
		if Frame.state ~= "results" then
			return {}
		end
		local Elements = {}
		
		for LayoutOrder, row in Frame.rows do
			Elements["Row" .. LayoutOrder] = ReactModule.createElement(ItemRowModule, {
				items = row,
				columnCount = Frame.columnCount,
				rowIndex = LayoutOrder,
				onItemActivated = Frame.onItemActivated,
				shopPageType = if ShopPageType1 then ShopPageType1.Search else nil,
				LayoutOrder = LayoutOrder
			})
		end
		return Elements
	end, {
		Frame.rows,
		Frame.columnCount,
		Frame.onItemActivated,
		Frame.state
	})
	local Formatted1 = if Frame.state == "hint" then Formatted elseif Frame.state == "empty" then UseLocalizationResult.emptyText else nil
	
	return ReactModule.createElement(View, {
		tag = "fill size-full-0",
		testId = "SearchResultsView",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Scroll = if Formatted1 == nil then ReactModule.createElement(ScrollView, {
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseResult else nil,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = FoundationModule.Enums.Visibility.None
			}
		}, {
			Content = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.gridRef else nil,
				onAbsoluteSizeChanged = if FFlagEnableInExperienceShopUnifiedLoggingModule then function(_)
					-- upvalues: UseShopImpressionsDetectorModuleResult (copy)
					UseShopImpressionsDetectorModuleResult.onLayoutChange()
				end else nil
			}, UseMemoResult)
		}) else nil,
		ImpressionsDetector = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.impressionsDetector else nil,
		Message = if Formatted1 == nil then nil else ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center size-full padding-x-xlarge padding-y-xlarge",
			testId = "SearchResultsMessage"
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = Formatted1
			})
		})
	})
end