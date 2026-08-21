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
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local termsPrivacyFooterModule = require(script.Parent.TermsPrivacyFooter)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbird = sharedFlagsModule.FFlagEnableBlackbird
local fFlagEnableBlackbirdOnFlyoutMenu = sharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local enableBlackbirdUpsellOnFlyoutMenu = game:DefineFastFlag("EnableBlackbirdUpsellOnFlyoutMenu", false)
local fFlagEnableFlyoutMenuRobuxCardRefactor = sharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagEnableFlyoutOnNavRail = sharedFlagsModule.FFlagEnableFlyoutOnNavRail
local var15 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var16 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p0) --[[ line: 64 ]]
	return p0.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(value) --[[ line: 68 ]]
	return value.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

return reactModule.memo(function(p1, _) --[[ line: 72 ]]
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var15 (ref), var16 (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var37
	local var19 = useTokens()
	local var20 = useLocalRobuxBalance()
	local var21 = useSelector(selectGlobalGuiInset)
	local var22 = var21.top + useSelector(selectStatusBarHeight)
	local bottom = var21.bottom
	local var23 = if fFlagEnableFlyoutOnNavRail then nil else var21.left
	local var24 = useScreenSize()
	local var25 = if var24.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var24.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	local var26 = if fFlagEnableBlackbirdCheck then var15() else false
	local var27 = not useAppPolicy(function(p2) --[[ line: 87 ]]
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (var16 ~= nil and not var26)
	local var28 = var20 and var20 >= 0
	local var28_1 = var28 or var27
	local var30 = useFlyoutNavigationItemsModule()
	local var31 = createNextOrder()
	local var32 = useSetDrawerVisible()
	local var33 = reactModule.useCallback(function() --[[ line: 99 ]]
		-- upvalues: var32 (ref)
		var32(false)
	end, { var32 })
	local var34 = reactModule.useCallback(function(p3) --[[ line: 102 ]]
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p3)
	end, {})
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var35 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var19.Padding.XLarge),
			PaddingBottom = UDim.new(0, var19.Padding.XLarge),
			PaddingLeft = UDim.new(0, var19.Padding.XLarge),
			PaddingRight = UDim.new(0, var19.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var19.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var31(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var26 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var33
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var28 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var31(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var20,
			closeDrawer = var33
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var28_1 then
		var37 = reactModule.createElement
		var37 = var37(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var31(),
			stroke = {
				Color = var19.Color.Stroke.Default.Color3,
				Transparency = var19.Color.Stroke.Default.Transparency,
				Thickness = var19.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var19.Radius.Medium)
		}, {
			RobuxPill = if var28 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var20,
				closeDrawer = var33
			}) else nil,
			UpsellDivider = if var28 and var27 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var27 then reactModule.createElement(var16, { layoutOrder = 3, closeDrawer = var33 }) else nil
		})
	else
		var37 = nil
	end
	t.RobuxCard = var37
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var31(),
		navigationItems = var30.myLibraryItems,
		closeDrawer = var33,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var31() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var31(),
		navigationItems = var30.additionalNavigationItems,
		closeDrawer = var33,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var31(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var33
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var31(), closeDrawer = var33 })
	t.LogOut = p1.renderLogOut(var31())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var31(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var33
	}) else nil
	t.TermsPrivacyFooter = reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var31(), closeDrawer = var33 })
	createElement = createElement(fragment, var35, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var25,
		children = createElement,
		leftOffset = var23,
		topOffset = var22,
		bottomOffset = bottom,
		backgroundStyle = var19.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var34
	})
end)