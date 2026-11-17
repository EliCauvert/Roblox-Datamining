local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local ClosePeoplePageOpenedWithSideSheetModule = require(InExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)
local SideSheetBesideMenuPolicyModule = require(InExperienceSideSheet.Utils.sideSheetBesideMenuPolicy)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FlagsModule = require(InExperienceSideSheet.Flags)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagKeepSideSheetOpenBesideMenu = FlagsModule.FFlagKeepSideSheetOpenBesideMenu
local FFlagSideSheetOpenPeoplePage = FlagsModule.FFlagSideSheetOpenPeoplePage
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav

local function _(People)
	-- upvalues: GetSideSheetConfigStoreModule (copy), FFlagSideSheetOpenPeoplePage (copy), ConstantsModule (copy)
	if People == nil then
		return false
	else
		local SideSheetConfigStoreModule = GetSideSheetConfigStoreModule(false)
		
		return SideSheetConfigStoreModule.getWindowShownBesideSideSheet(false) == People or FFlagSideSheetOpenPeoplePage and (People == ConstantsModule.IntegrationIds.People and SideSheetConfigStoreModule.getIsPeoplePageOpen(false))
	end
end

local function activateBesideSideSheet(IntegrationId, SideSheetOpenBehavior, Callback: () -> ())
	-- upvalues: GetSideSheetConfigStoreModule (copy), FFlagSideSheetOpenPeoplePage (copy), ConstantsModule (copy), RegisterInGameMenuPeoplePageActionsModule (copy), SideSheetBesideMenuPolicyModule (copy)
	local IsWindowShownBesideSideSheetMatch = nil
	if IntegrationId == nil then
		IsWindowShownBesideSideSheetMatch = false
	else
		local SideSheetConfigStoreModule = GetSideSheetConfigStoreModule(false)
		IsWindowShownBesideSideSheetMatch = SideSheetConfigStoreModule.getWindowShownBesideSideSheet(false) == IntegrationId or FFlagSideSheetOpenPeoplePage and (IntegrationId == ConstantsModule.IntegrationIds.People and SideSheetConfigStoreModule.getIsPeoplePageOpen(false))
	end
	if IsWindowShownBesideSideSheetMatch then return end
	local SideSheetConfigStoreModule = GetSideSheetConfigStoreModule(false)
	
	if FFlagSideSheetOpenPeoplePage then
		SideSheetConfigStoreModule.setDidSideSheetOpenWithPeoplePage(false)
	end
	RegisterInGameMenuPeoplePageActionsModule.closeWindowShownBesideSideSheet()
	local IsWindowBesideSideSheet = SideSheetBesideMenuPolicyModule.isWindowBesideSideSheet(SideSheetOpenBehavior)
	
	if IsWindowBesideSideSheet then
		SideSheetConfigStoreModule.setWindowShownBesideSideSheet(IntegrationId)
	end
	Callback()
	
	if IsWindowBesideSideSheet then
		RegisterInGameMenuPeoplePageActionsModule.closeMenuShownBesideSideSheet()
	end
end

local _ = function(Callback: () -> ())
	-- upvalues: FFlagSideSheetOpenPeoplePage (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy)
	Callback()
	
	if FFlagSideSheetOpenPeoplePage then
		ClosePeoplePageOpenedWithSideSheetModule()
	end
	ToggleSideSheetModule(false)
	SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.ItemSelected)
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), SideSheetBesideMenuPolicyModule (copy), activateBesideSideSheet (copy), FFlagSideSheetOpenPeoplePage (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), Text (copy)
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	local UseResult = if FFlagSideSheetFocusNav then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p1 (copy)
		if UseRefResult then
			UseRefResult.current = Current
		end
		if Current and p1.firstIntegrationToFocusCallback then
			p1.firstIntegrationToFocusCallback(Current)
		end
	end, { p1.firstIntegrationToFocusCallback }) else nil
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-none size-full-1000 padding-left-xsmall radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagKeepSideSheetOpenBesideMenu (upval), SideSheetBesideMenuPolicyModule (upval), p1 (copy), activateBesideSideSheet (upval), FFlagSideSheetOpenPeoplePage (upval), ClosePeoplePageOpenedWithSideSheetModule (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
			if FFlagKeepSideSheetOpenBesideMenu and not SideSheetBesideMenuPolicyModule.shouldCloseSideSheetOnItemActivated(p1.sideSheetOpenBehavior) then
				activateBesideSideSheet(p1.integrationId, p1.sideSheetOpenBehavior, p1.onActivated)
				
				return
			end
			p1.onActivated()
			
			if FFlagSideSheetOpenPeoplePage then
				ClosePeoplePageOpenedWithSideSheetModule()
			end
			ToggleSideSheetModule(false)
			SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.ItemSelected)
		end, if FFlagKeepSideSheetOpenBesideMenu then { p1.onActivated, p1.sideSheetOpenBehavior } else { p1.onActivated }),
		selection = if FFlagSideSheetFocusNav and p1.disableGamepadDirections then {
			NextSelectionRight = if p1.disableGamepadDirections.right then UseRefResult else nil,
			NextSelectionLeft = if p1.disableGamepadDirections.left then UseRefResult else nil
		} else nil,
		ref = if FFlagSideSheetFocusNav then UseResult else nil
	}, {
		IconContainer = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center size-1000",
			LayoutOrder = 1
		}, { Icon = p1.icon({ visible = true }) }),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy padding-x-small text-label-medium text-align-x-left text-truncate-split content-emphasis",
			Text = p1.label
		})
	})
end)