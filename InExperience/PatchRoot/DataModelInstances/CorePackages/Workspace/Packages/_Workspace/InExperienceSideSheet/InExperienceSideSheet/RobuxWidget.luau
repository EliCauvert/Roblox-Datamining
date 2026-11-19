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
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)
local SideSheetBesideMenuPolicyModule = require(InExperienceSideSheet.Utils.sideSheetBesideMenuPolicy)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagKeepSideSheetOpenBesideMenu = require(InExperienceSideSheet.Flags).FFlagKeepSideSheetOpenBesideMenu
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage

return ReactModule.memo(function(p1)
	-- upvalues: UseRobuxBalanceModule (copy), UseLocalizationFunction (copy), FFlagKeepSideSheetOpenBesideMenu (copy), ReactModule (copy), SideSheetBesideMenuPolicyModule (copy), GetSideSheetConfigStoreModule (copy), RegisterInGameMenuPeoplePageActionsModule (copy), FFlagSideSheetOpenPeoplePage (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), RobuxPill (copy)
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
				-- upvalues: FFlagKeepSideSheetOpenBesideMenu (upval), SideSheetBesideMenuPolicyModule (upval), p1 (copy), GetSideSheetConfigStoreModule (upval), RegisterInGameMenuPeoplePageActionsModule (upval), FFlagSideSheetOpenPeoplePage (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
				if not FFlagKeepSideSheetOpenBesideMenu or SideSheetBesideMenuPolicyModule.shouldCloseSideSheetOnItemActivated(p1.sideSheetOpenBehavior) then
					p1.onBuyActivated()
					ToggleSideSheetModule(false)
					SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.RobuxWidget)
					
					return
				end
				local SideSheetConfigStoreModule = GetSideSheetConfigStoreModule(false)
				
				if SideSheetConfigStoreModule.getWindowShownBesideSideSheet(false) == "in_experience_shop" then return end
				if p1.onBuyActivated() == false then return end
				if SideSheetConfigStoreModule.getWindowShownBesideSideSheet(false) ~= "in_experience_shop" then
					RegisterInGameMenuPeoplePageActionsModule.closeWindowShownBesideSideSheet()
					SideSheetConfigStoreModule.setWindowShownBesideSideSheet("in_experience_shop")
				end
				if FFlagSideSheetOpenPeoplePage then
					SideSheetConfigStoreModule.setDidSideSheetOpenWithPeoplePage(false)
				end
				RegisterInGameMenuPeoplePageActionsModule.closeMenuShownBesideSideSheet()
			end, if FFlagKeepSideSheetOpenBesideMenu then { p1.onBuyActivated, p1.sideSheetOpenBehavior } else { p1.onBuyActivated }),
			ref = if FFlagSideSheetFocusNav then UseResult else nil
		})
	})
end)