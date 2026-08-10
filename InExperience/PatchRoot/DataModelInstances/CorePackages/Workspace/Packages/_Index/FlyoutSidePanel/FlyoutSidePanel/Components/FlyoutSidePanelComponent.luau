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
local fFlagFlyoutTermsPrivacyFooterModule = require(script.Parent.Parent.Flags.FFlagFlyoutTermsPrivacyFooter)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbird = sharedFlagsModule.FFlagEnableBlackbird
local fFlagEnableBlackbirdOnFlyoutMenu = sharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local enableBlackbirdUpsellOnFlyoutMenu = game:DefineFastFlag("EnableBlackbirdUpsellOnFlyoutMenu", false)
local fFlagEnableFlyoutMenuRobuxCardRefactor = sharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagEnableFlyoutOnNavRail = sharedFlagsModule.FFlagEnableFlyoutOnNavRail
local var16 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var17 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p0) --[[ line: 65 ]]
	return p0.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(value) --[[ line: 69 ]]
	return value.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

return reactModule.memo(function(p1, _) --[[ line: 73 ]]
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var16 (ref), var17 (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), reactModule (ref), flyoutAnalyticsModule (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), fFlagFlyoutTermsPrivacyFooterModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var38
	local var20 = useTokens()
	local var21 = useLocalRobuxBalance()
	local var22 = useSelector(selectGlobalGuiInset)
	local var23 = var22.top + useSelector(selectStatusBarHeight)
	local bottom = var22.bottom
	local var24 = if fFlagEnableFlyoutOnNavRail then nil else var22.left
	local var25 = useScreenSize()
	local var26 = if var25.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var25.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	local var27 = if fFlagEnableBlackbirdCheck then var16() else false
	local var28 = not useAppPolicy(function(p2) --[[ line: 88 ]]
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (var17 ~= nil and not var27)
	local var29 = var21 and var21 >= 0
	local var29_1 = var29 or var28
	local var31 = useFlyoutNavigationItemsModule()
	local var32 = createNextOrder()
	local var33 = useSetDrawerVisible()
	local var34 = reactModule.useCallback(function() --[[ line: 100 ]]
		-- upvalues: var33 (ref)
		var33(false)
	end, { var33 })
	local var35 = reactModule.useCallback(function(p3) --[[ line: 103 ]]
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p3)
	end, {})
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var36 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var20.Padding.XLarge),
			PaddingBottom = UDim.new(0, var20.Padding.XLarge),
			PaddingLeft = UDim.new(0, var20.Padding.XLarge),
			PaddingRight = UDim.new(0, var20.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var20.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var32(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var27 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var34
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var29 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var32(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var21,
			closeDrawer = var34
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var29_1 then
		var38 = reactModule.createElement
		var38 = var38(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var32(),
			stroke = {
				Color = var20.Color.Stroke.Default.Color3,
				Transparency = var20.Color.Stroke.Default.Transparency,
				Thickness = var20.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var20.Radius.Medium)
		}, {
			RobuxPill = if var29 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var21,
				closeDrawer = var34
			}) else nil,
			UpsellDivider = if var29 and var28 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var28 then reactModule.createElement(var17, { layoutOrder = 3, closeDrawer = var34 }) else nil
		})
	else
		var38 = nil
	end
	t.RobuxCard = var38
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var32(),
		navigationItems = var31.myLibraryItems,
		closeDrawer = var34,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var32() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var32(),
		navigationItems = var31.additionalNavigationItems,
		closeDrawer = var34,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var32(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var34
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var32(), closeDrawer = var34 })
	t.LogOut = p1.renderLogOut(var32())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var32(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var34
	}) else nil
	t.TermsPrivacyFooter = if fFlagFlyoutTermsPrivacyFooterModule then reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var32(), closeDrawer = var34 }) else nil
	createElement = createElement(fragment, var36, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var26,
		children = createElement,
		leftOffset = var24,
		topOffset = var23,
		bottomOffset = bottom,
		backgroundStyle = var20.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var35
	})
end)