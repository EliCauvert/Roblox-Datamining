local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalRobuxBalance = require(parent.RobloxAppHooks).useLocalRobuxBalance
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local divider = foundationModule.Divider
local createNextOrder = require(parent.ReactUtils).createNextOrder
local constantsModule = require(script.Parent.Parent.Constants)
local useFlyoutNavigationItemsModule = require(script.Parent.Parent.Hooks.useFlyoutNavigationItems)
local drawerContainer = require(parent.Drawer).DrawerContainer
local robuxPillModule = require(script.Parent.RobuxPill)
local flyoutNavigationListModule = require(script.Parent.FlyoutNavigationList)
local flyoutQuickSigninButtonModule = require(script.Parent.FlyoutQuickSigninButton)
local flyoutReportLogsModule = require(script.Parent.FlyoutReportLogs)
local flyoutSwitchAccountButtonModule = require(script.Parent.FlyoutSwitchAccountButton)
local flyoutProfileCardModule = require(script.Parent.FlyoutProfileCard)
local useDismissFlyoutOnPartyTopBannerModule = require(script.Parent.Parent.Hooks.useDismissFlyoutOnPartyTopBanner)
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local fFlagFlyoutTradesEntryExposureLoggingModule = require(script.Parent.Parent.Flags.FFlagFlyoutTradesEntryExposureLogging)
local fFlagFlyoutSidePanelUseSharedProfileCardModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelUseSharedProfileCard)
local var1 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then require(parent.ProfileCard).ProfileCard else nil
local useFlyoutTradesEntryExposureLoggingModule = require(script.Parent.Parent.Hooks.useFlyoutTradesEntryExposureLogging)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local termsPrivacyFooterModule = require(script.Parent.TermsPrivacyFooter)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbird = sharedFlagsModule.FFlagEnableBlackbird
local fFlagEnableBlackbirdOnFlyoutMenu = sharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local enableBlackbirdUpsellOnFlyoutMenu = game:DefineFastFlag("EnableBlackbirdUpsellOnFlyoutMenu", false)
local fFlagEnableFlyoutMenuRobuxCardRefactor = sharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagEnableFlyoutOnNavRail = sharedFlagsModule.FFlagEnableFlyoutOnNavRail
local fFlagFlyoutSidePanelUseProfileFrameThumbnail = sharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail
local var2 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var3 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p1)
	return p1.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(value)
	return value.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

return reactModule.memo(function(p1, _)
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var2 (ref), var3 (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), fFlagFlyoutSidePanelUseSharedProfileCardModule (ref), useRoactService (ref), appEventIngestService (ref), fFlagFlyoutTradesEntryExposureLoggingModule (ref), useFlyoutTradesEntryExposureLoggingModule (ref), reactModule (ref), flyoutAnalyticsModule (ref), var1 (ref), fFlagFlyoutSidePanelUseProfileFrameThumbnail (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var4 = useTokens()
	local var5 = useLocalRobuxBalance()
	local var6 = useSelector(selectGlobalGuiInset)
	local var7 = var6.top + useSelector(selectStatusBarHeight)
	local bottom = var6.bottom
	local var8 = if fFlagEnableFlyoutOnNavRail then nil else var6.left
	local var9 = useScreenSize()
	local var10 = if var9.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var9.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	local var11 = if fFlagEnableBlackbirdCheck then var2() else false
	local var12 = not useAppPolicy(function(p2)
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (var3 ~= nil and not var11)
	local var13 = var5 and var5 >= 0
	local var14 = var13 or var12
	local var15 = useFlyoutNavigationItemsModule()
	local var16 = createNextOrder()
	local var17 = useSetDrawerVisible()
	local var18 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then useRoactService(appEventIngestService) else nil
	
	if fFlagFlyoutTradesEntryExposureLoggingModule then
		useFlyoutTradesEntryExposureLoggingModule()
	end
	local var19
	local var20 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(false)
	end, { var17 })
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p2)
	end, {})
	local var22 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then reactModule.useCallback(function()
		-- upvalues: var20 (ref), p1 (ref), flyoutAnalyticsModule (copy), var18 (write)
		var20()
		
		if p1.onProfileActivated then
			p1.onProfileActivated()
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var18, "Profile", if p1.localUserModel then p1.localUserModel.id else "")
		end
	end, { var20, var18, p1.localUserModel, p1.onProfileActivated }) else nil
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var23 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var4.Padding.XLarge),
			PaddingBottom = UDim.new(0, var4.Padding.XLarge),
			PaddingLeft = UDim.new(0, var4.Padding.XLarge),
			PaddingRight = UDim.new(0, var4.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var4.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = if fFlagFlyoutSidePanelUseSharedProfileCardModule then reactModule.createElement(var1, {
			layoutOrder = var16(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var11 else nil,
			onProfileActivated = var22,
			useProfileFrameThumbnail = fFlagFlyoutSidePanelUseProfileFrameThumbnail
		}) else reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var16(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var11 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var20
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var13 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var16(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var5,
			closeDrawer = var20
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var14 then
		var19 = reactModule.createElement
		var19 = var19(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var16(),
			stroke = {
				Color = var4.Color.Stroke.Default.Color3,
				Transparency = var4.Color.Stroke.Default.Transparency,
				Thickness = var4.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var4.Radius.Medium)
		}, {
			RobuxPill = if var13 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var5,
				closeDrawer = var20
			}) else nil,
			UpsellDivider = if var13 and var12 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var12 then reactModule.createElement(var3, { layoutOrder = 3, closeDrawer = var20 }) else nil
		})
	else
		var19 = nil
	end
	t.RobuxCard = var19
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var16(),
		navigationItems = var15.myLibraryItems,
		closeDrawer = var20,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var16() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var16(),
		navigationItems = var15.additionalNavigationItems,
		closeDrawer = var20,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var16(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var20
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var16(), closeDrawer = var20 })
	t.LogOut = p1.renderLogOut(var16())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var16(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var20
	}) else nil
	t.TermsPrivacyFooter = reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var16(), closeDrawer = var20 })
	createElement = createElement(fragment, var23, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var10,
		children = createElement,
		leftOffset = var8,
		topOffset = var7,
		bottomOffset = bottom,
		backgroundStyle = var4.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var21
	})
end)