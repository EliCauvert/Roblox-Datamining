local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Chrome)
local View = require(Parent.Foundation).View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RobuxPill = require(Parent.RobuxPill).RobuxPill
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local UseRobuxBalanceModule = require(InExperienceSideSheet.Hooks.useRobuxBalance)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)

return ReactModule.memo(function(p1)
	-- upvalues: UseRobuxBalanceModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), RobuxPill (copy)
	local UseResult = if FFlagSideSheetFocusNav then ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		if p2 and p1.firstIntegrationToFocusCallback then
			p1.firstIntegrationToFocusCallback(p2)
		end
	end, { p1.firstIntegrationToFocusCallback }) else nil
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-bottom-medium",
		LayoutOrder = p1.layoutOrder or 1
	}, {
		RobuxPill = ReactModule.createElement(RobuxPill, {
			layoutOrder = 1,
			isCompact = true,
			robuxBalance = UseRobuxBalanceModule(),
			buyButtonText = UseLocalizationFunction({ buyRobux = "IAPExperience.RobuxUpsell.Action.BuyRobux" }).buyRobux,
			onBuyActivated = ReactModule.useCallback(function()
				-- upvalues: p1 (copy), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
				p1.onBuyActivated()
				ToggleSideSheetModule(false)
				SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.RobuxWidget)
			end, { p1.onBuyActivated }),
			ref = if FFlagSideSheetFocusNav then UseResult else nil
		})
	})
end)