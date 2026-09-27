local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.Chrome)
local view = require(parent.Foundation).View
local useLocalization = require(parent.Localization).Hooks.useLocalization
local robuxPill = require(parent.RobuxPill).RobuxPill
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local useRobuxBalanceModule = require(inExperienceSideSheet.Hooks.useRobuxBalance)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

return reactModule.memo(function(p1)
	-- upvalues: useRobuxBalanceModule (ref), useLocalization (ref), reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), fFlagSideSheetFocusNav (ref), view (ref), robuxPill (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-bottom-medium",
		LayoutOrder = p1.layoutOrder or 1
	}, {
		RobuxPill = reactModule.createElement(robuxPill, {
			layoutOrder = 1,
			isCompact = true,
			robuxBalance = useRobuxBalanceModule(),
			buyButtonText = useLocalization({ buyRobux = "IAPExperience.RobuxUpsell.Action.BuyRobux" }).buyRobux,
			onBuyActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
				p1.onBuyActivated()
				toggleSideSheetModule(false)
				sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.RobuxWidget)
			end, { p1.onBuyActivated }),
			ref = if fFlagSideSheetFocusNav then if fFlagSideSheetFocusNav then reactModule.useCallback(function(p2)
				-- upvalues: p1 (ref)
				if p2 and p1.firstIntegrationToFocusCallback then
					p1.firstIntegrationToFocusCallback(p2)
				end
			end, { p1.firstIntegrationToFocusCallback }) else nil else nil
		})
	})
end)