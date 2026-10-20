local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local ItemGridModule = require(InExperienceShop.Components.ItemGrid)
local _ = require(InExperienceShop.Components.ItemRow)
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local RobuxTermsDisclosureModule = if require(InExperienceShop.Flags.FFlagShopRobuxTermsDisclosure) then require(InExperienceShop.Components.RobuxTermsDisclosure) else nil
local IsSubjectToDesktopPoliciesFunction = require(Parent.SharedFlags).isSubjectToDesktopPolicies
local AnalyticsModule = if FFlagEnableInExperienceShopUnifiedLoggingModule then require(InExperienceShop.Analytics) else nil
local ShopPageType = if AnalyticsModule then AnalyticsModule.Constants.ShopPageType else nil
local UseShopImpressionsDetectorModule = require(InExperienceShop.Hooks.useShopImpressionsDetector)
local _ = require(InExperienceShop.Types)

return function(Frame)
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy), UseShopImpressionsDetectorModule (copy), ShopPageType (copy), ReactModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), View (copy), ScrollView (copy), FoundationModule (copy), RobuxTermsDisclosureModule (copy), ItemGridModule (copy)
	local IsShowRobuxTermsDisclosure = Frame.showRobuxTermsDisclosure == true
	local Inverted = not IsSubjectToDesktopPoliciesFunction()
	local UseShopImpressionsDetectorModuleResult = UseShopImpressionsDetectorModule({
		isPageActive = true,
		externalScrollSignal = nil,
		pageType = if ShopPageType then ShopPageType.Category else ""
	})
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), UseShopImpressionsDetectorModuleResult (copy)
		if FFlagEnableInExperienceShopUnifiedLoggingModule then
			UseShopImpressionsDetectorModuleResult.onLayoutChange()
		end
	end, { UseShopImpressionsDetectorModuleResult.onLayoutChange })
	
	return ReactModule.createElement(View, {
		tag = "fill size-full-0",
		testId = "CategoryPageView",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Scroll = ReactModule.createElement(ScrollView, {
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
				tag = if IsShowRobuxTermsDisclosure then "col gap-medium size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge" else "size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium",
				ref = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.gridRef else nil,
				onAbsoluteSizeChanged = if FFlagEnableInExperienceShopUnifiedLoggingModule then function(_)
					-- upvalues: UseShopImpressionsDetectorModuleResult (copy)
					UseShopImpressionsDetectorModuleResult.onLayoutChange()
				end else nil
			}, {
				Disclosure = if IsShowRobuxTermsDisclosure and RobuxTermsDisclosureModule then ReactModule.createElement(RobuxTermsDisclosureModule, { LayoutOrder = 1, isMobile = Inverted }) else nil,
				Grid = ReactModule.createElement(ItemGridModule, {
					gap = "gap-large",
					LayoutOrder = if IsShowRobuxTermsDisclosure then 2 else nil,
					items = Frame.items,
					itemsPerRow = Frame.itemsPerRow,
					sectionId = Frame.sectionId,
					onItemActivated = Frame.onItemActivated,
					renderTile = Frame.renderTile,
					isFeaturedDoubleWidthRobux = Frame.isFeaturedDoubleWidthRobux,
					onGridLayoutChange = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.onLayoutChange else nil
				})
			})
		}),
		ImpressionsDetector = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseShopImpressionsDetectorModuleResult.impressionsDetector else nil
	})
end