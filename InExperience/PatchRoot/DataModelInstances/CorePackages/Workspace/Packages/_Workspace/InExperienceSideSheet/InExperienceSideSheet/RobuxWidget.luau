local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.Chrome)
local view = require(parent.Foundation).View
local useLocalization = require(parent.Localization).Hooks.useLocalization
local robuxPill = require(parent.RobuxPill).RobuxPill
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), view (ref), robuxPill (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-y-small",
		LayoutOrder = p1.layoutOrder or 1
	}, {
		RobuxPill = reactModule.createElement(robuxPill, {
			layoutOrder = 1,
			robuxBalance = 0,
			buyButtonText = useLocalization({ buyRobux = "IAPExperience.RobuxUpsell.Action.BuyRobux" }).buyRobux,
			onBuyActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
				p1.onBuyActivated()
				toggleSideSheetModule(false)
				sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.RobuxWidget)
			end, { p1.onBuyActivated })
		})
	})
end)