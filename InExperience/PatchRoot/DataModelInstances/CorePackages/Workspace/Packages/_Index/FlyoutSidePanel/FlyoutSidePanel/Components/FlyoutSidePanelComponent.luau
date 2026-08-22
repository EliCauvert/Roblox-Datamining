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
local var17 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var18 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p0) --[[ line: 66 ]]
	return p0.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(value) --[[ line: 70 ]]
	return value.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

return reactModule.memo(function(p1, _) --[[ line: 74 ]]
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var17 (ref), var18 (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), fFlagFlyoutTradesEntryExposureLoggingModule (ref), useFlyoutTradesEntryExposureLoggingModule (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var21 = useTokens()
	local var22 = useLocalRobuxBalance()
	local var23 = useSelector(selectGlobalGuiInset)
	local var24 = var23.top + useSelector(selectStatusBarHeight)
	local bottom = var23.bottom
	local var25 = if fFlagEnableFlyoutOnNavRail then nil else var23.left
	local var26 = useScreenSize()
	local var27 = if var26.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var26.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	local var28 = if fFlagEnableBlackbirdCheck then var17() else false
	local var29 = not useAppPolicy(function(p2) --[[ line: 89 ]]
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (var18 ~= nil and not var28)
	local var30 = var22 and var22 >= 0
	local var30_1 = var30 or var29
	local var32 = useFlyoutNavigationItemsModule()
	local var33 = createNextOrder()
	local var34 = useSetDrawerVisible()
	
	if fFlagFlyoutTradesEntryExposureLoggingModule then
		useFlyoutTradesEntryExposureLoggingModule()
	end
	local var39
	local var35 = reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: var34 (ref)
		var34(false)
	end, { var34 })
	local var36 = reactModule.useCallback(function(p3) --[[ line: 107 ]]
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p3)
	end, {})
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var37 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var21.Padding.XLarge),
			PaddingBottom = UDim.new(0, var21.Padding.XLarge),
			PaddingLeft = UDim.new(0, var21.Padding.XLarge),
			PaddingRight = UDim.new(0, var21.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var21.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var33(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var28 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var35
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var30 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var33(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var22,
			closeDrawer = var35
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var30_1 then
		var39 = reactModule.createElement
		var39 = var39(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var33(),
			stroke = {
				Color = var21.Color.Stroke.Default.Color3,
				Transparency = var21.Color.Stroke.Default.Transparency,
				Thickness = var21.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var21.Radius.Medium)
		}, {
			RobuxPill = if var30 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var22,
				closeDrawer = var35
			}) else nil,
			UpsellDivider = if var30 and var29 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var29 then reactModule.createElement(var18, { layoutOrder = 3, closeDrawer = var35 }) else nil
		})
	else
		var39 = nil
	end
	t.RobuxCard = var39
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var33(),
		navigationItems = var32.myLibraryItems,
		closeDrawer = var35,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var33() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var33(),
		navigationItems = var32.additionalNavigationItems,
		closeDrawer = var35,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var33(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var35
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var33(), closeDrawer = var35 })
	t.LogOut = p1.renderLogOut(var33())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var33(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var35
	}) else nil
	t.TermsPrivacyFooter = reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var33(), closeDrawer = var35 })
	createElement = createElement(fragment, var37, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var27,
		children = createElement,
		leftOffset = var25,
		topOffset = var24,
		bottomOffset = bottom,
		backgroundStyle = var21.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var36
	})
end)