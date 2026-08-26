local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
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
local var1 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var2 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p1)
	return p1.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(value)
	return value.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

return reactModule.memo(function(p1, _)
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var1 (ref), var2 (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), fFlagFlyoutTradesEntryExposureLoggingModule (ref), useFlyoutTradesEntryExposureLoggingModule (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var3 = useTokens()
	local var4 = useLocalRobuxBalance()
	local var5 = useSelector(selectGlobalGuiInset)
	local var6 = var5.top + useSelector(selectStatusBarHeight)
	local bottom = var5.bottom
	local var7 = if fFlagEnableFlyoutOnNavRail then nil else var5.left
	local var8 = useScreenSize()
	local var9 = if var8.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var8.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	local var10 = if fFlagEnableBlackbirdCheck then var1() else false
	local var11 = not useAppPolicy(function(p2)
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (var2 ~= nil and not var10)
	local var12 = var4 and var4 >= 0
	local var13 = var12 or var11
	local var14 = useFlyoutNavigationItemsModule()
	local var15 = createNextOrder()
	local var16 = useSetDrawerVisible()
	
	if fFlagFlyoutTradesEntryExposureLoggingModule then
		useFlyoutTradesEntryExposureLoggingModule()
	end
	local var17
	local var18 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16(false)
	end, { var16 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p2)
	end, {})
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var20 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var3.Padding.XLarge),
			PaddingBottom = UDim.new(0, var3.Padding.XLarge),
			PaddingLeft = UDim.new(0, var3.Padding.XLarge),
			PaddingRight = UDim.new(0, var3.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var3.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var15(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var10 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var18
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var12 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var15(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var4,
			closeDrawer = var18
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var13 then
		var17 = reactModule.createElement
		var17 = var17(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var15(),
			stroke = {
				Color = var3.Color.Stroke.Default.Color3,
				Transparency = var3.Color.Stroke.Default.Transparency,
				Thickness = var3.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var3.Radius.Medium)
		}, {
			RobuxPill = if var12 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var4,
				closeDrawer = var18
			}) else nil,
			UpsellDivider = if var12 and var11 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var11 then reactModule.createElement(var2, { layoutOrder = 3, closeDrawer = var18 }) else nil
		})
	else
		var17 = nil
	end
	t.RobuxCard = var17
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var15(),
		navigationItems = var14.myLibraryItems,
		closeDrawer = var18,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var15() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var15(),
		navigationItems = var14.additionalNavigationItems,
		closeDrawer = var18,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var15(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var18
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var15(), closeDrawer = var18 })
	t.LogOut = p1.renderLogOut(var15())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var15(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var18
	}) else nil
	t.TermsPrivacyFooter = reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var15(), closeDrawer = var18 })
	createElement = createElement(fragment, var20, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var9,
		children = createElement,
		leftOffset = var7,
		topOffset = var6,
		bottomOffset = bottom,
		backgroundStyle = var3.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var19
	})
end)