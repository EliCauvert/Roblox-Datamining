local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalRobuxBalanceFunction = require(Parent.RobloxAppHooks).useLocalRobuxBalance
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Divider = FoundationModule.Divider
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local ConstantsModule = require(script.Parent.Parent.Constants)
local UseFlyoutNavigationItemsModule = require(script.Parent.Parent.Hooks.useFlyoutNavigationItems)
local DrawerContainer = require(Parent.Drawer).DrawerContainer
local RobuxPillModule = require(script.Parent.RobuxPill)
local FlyoutNavigationListModule = require(script.Parent.FlyoutNavigationList)
local FlyoutQuickSigninButtonModule = require(script.Parent.FlyoutQuickSigninButton)
local FlyoutReportLogsModule = require(script.Parent.FlyoutReportLogs)
local FlyoutSwitchAccountButtonModule = require(script.Parent.FlyoutSwitchAccountButton)
local FlyoutProfileCardModule = require(script.Parent.FlyoutProfileCard)
local UseDismissFlyoutOnPartyTopBannerModule = require(script.Parent.Parent.Hooks.useDismissFlyoutOnPartyTopBanner)
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local TermsPrivacyFooterModule = require(script.Parent.TermsPrivacyFooter)
local FFlagFlyoutTermsPrivacyFooterModule = require(script.Parent.Parent.Flags.FFlagFlyoutTermsPrivacyFooter)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableBlackbirdOnFlyoutMenu = SharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local EnableBlackbirdUpsellOnFlyoutMenu = game:DefineFastFlag("EnableBlackbirdUpsellOnFlyoutMenu", false)
local FFlagEnableFlyoutMenuRobuxCardRefactor = SharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local UseHasRobloxSubscriptionModule = if FFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local BlackbirdUpsellBannerModule = if SharedFlagsModule.FFlagEnableBlackbird and FFlagEnableBlackbirdOnFlyoutMenu and EnableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p1)
	return p1.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(p1)
	return p1.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

return ReactModule.memo(function(p1, _)
	-- upvalues: UseTokensFunction (copy), UseLocalRobuxBalanceFunction (copy), UseSelectorFunction (copy), selectStatusBarHeight (copy), selectGlobalGuiInset (copy), UseScreenSizeFunction (copy), ConstantsModule (copy), UseAppPolicyFunction (copy), FFlagEnableBlackbirdCheck (copy), UseHasRobloxSubscriptionModule (copy), BlackbirdUpsellBannerModule (copy), UseFlyoutNavigationItemsModule (copy), CreateNextOrderFunction (copy), UseSetDrawerVisibleFunction (copy), ReactModule (copy), FlyoutAnalyticsModule (copy), FlyoutProfileCardModule (copy), FFlagEnableFlyoutMenuRobuxCardRefactor (copy), RobuxPillModule (copy), FoundationModule (copy), Divider (copy), FlyoutNavigationListModule (copy), FlyoutSwitchAccountButtonModule (copy), FlyoutQuickSigninButtonModule (copy), FlyoutReportLogsModule (copy), FFlagFlyoutTermsPrivacyFooterModule (copy), TermsPrivacyFooterModule (copy), UseDismissFlyoutOnPartyTopBannerModule (copy), DrawerContainer (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalRobuxBalanceResult: number = UseLocalRobuxBalanceFunction()
	local UseSelectorResult = UseSelectorFunction(selectStatusBarHeight)
	local UseSelectorResult1 = UseSelectorFunction(selectGlobalGuiInset)
	local NewTop = UseSelectorResult1.top + UseSelectorResult
	local Bottom = UseSelectorResult1.bottom
	local Left = UseSelectorResult1.left
	local UseScreenSizeResult = UseScreenSizeFunction()
	local XDelta = if UseScreenSizeResult.X - ConstantsModule.FLYOUT_SIDE_PADDING < ConstantsModule.FLYOUT_SIDE_PANEL_WIDTH then UseScreenSizeResult.X - ConstantsModule.FLYOUT_SIDE_PADDING else ConstantsModule.FLYOUT_SIDE_PANEL_WIDTH
	local UseHasRobloxSubscriptionModuleResult = if FFlagEnableBlackbirdCheck then UseHasRobloxSubscriptionModule() else false
	local NoUseHasRobloxSubscriptionModuleResult: boolean = not UseAppPolicyFunction(function(p2)
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (BlackbirdUpsellBannerModule ~= nil and not UseHasRobloxSubscriptionModuleResult)
	local IsUseLocalRobuxBalanceResultAbove: boolean = UseLocalRobuxBalanceResult and UseLocalRobuxBalanceResult >= 0
	local IsUseLocalRobuxBalanceResultAbove1: boolean = IsUseLocalRobuxBalanceResultAbove or NoUseHasRobloxSubscriptionModuleResult
	local UseFlyoutNavigationItemsModuleResult = UseFlyoutNavigationItemsModule()
	local NextOrder = CreateNextOrderFunction()
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSetDrawerVisibleResult (copy)
		UseSetDrawerVisibleResult(false)
	end, { UseSetDrawerVisibleResult })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: FlyoutAnalyticsModule (upval)
		FlyoutAnalyticsModule.onFlyoutSidePanelClosed(p2)
	end, {})
	local Element = ReactModule.createElement(ReactModule.Fragment, nil, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.XLarge),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.XLarge),
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XLarge)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, UseTokensResult.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = ReactModule.createElement(FlyoutProfileCardModule, {
			layoutOrder = NextOrder(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseHasRobloxSubscriptionModuleResult else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = UseResult
		}),
		RobuxPill = if FFlagEnableFlyoutMenuRobuxCardRefactor or not IsUseLocalRobuxBalanceResultAbove then nil else ReactModule.createElement(RobuxPillModule, {
			layoutOrder = NextOrder(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = UseLocalRobuxBalanceResult,
			closeDrawer = UseResult
		}),
		RobuxCard = if FFlagEnableFlyoutMenuRobuxCardRefactor and IsUseLocalRobuxBalanceResultAbove1 then ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = NextOrder(),
			stroke = {
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
				Thickness = UseTokensResult.Stroke.Standard
			},
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}, {
			RobuxPill = if IsUseLocalRobuxBalanceResultAbove then ReactModule.createElement(RobuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = UseLocalRobuxBalanceResult,
				closeDrawer = UseResult
			}) else nil,
			UpsellDivider = if IsUseLocalRobuxBalanceResultAbove and NoUseHasRobloxSubscriptionModuleResult then ReactModule.createElement(Divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if NoUseHasRobloxSubscriptionModuleResult then ReactModule.createElement(BlackbirdUpsellBannerModule, { layoutOrder = 3, closeDrawer = UseResult }) else nil
		}) else nil,
		MyLibrary = ReactModule.createElement(FlyoutNavigationListModule, {
			layoutOrder = NextOrder(),
			navigationItems = UseFlyoutNavigationItemsModuleResult.myLibraryItems,
			closeDrawer = UseResult,
			buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
		}),
		Divider = ReactModule.createElement(Divider, { LayoutOrder = NextOrder() }),
		AdditionalNavigation = ReactModule.createElement(FlyoutNavigationListModule, {
			layoutOrder = NextOrder(),
			navigationItems = UseFlyoutNavigationItemsModuleResult.additionalNavigationItems,
			closeDrawer = UseResult,
			buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
		}),
		SwitchAccountButton = if p1.onSwitchAccountActivated then ReactModule.createElement(FlyoutSwitchAccountButtonModule, {
			layoutOrder = NextOrder(),
			onSwitchAccountActivated = p1.onSwitchAccountActivated,
			closeDrawer = UseResult
		}) else nil,
		QuickSigninButton = ReactModule.createElement(FlyoutQuickSigninButtonModule, { layoutOrder = NextOrder(), closeDrawer = UseResult }),
		LogOut = p1.renderLogOut(NextOrder()),
		ReportLogs = if p1.openReportLogConfirmation then ReactModule.createElement(FlyoutReportLogsModule, {
			layoutOrder = NextOrder(),
			openReportLogConfirmation = p1.openReportLogConfirmation,
			closeDrawer = UseResult
		}) else nil,
		TermsPrivacyFooter = if FFlagFlyoutTermsPrivacyFooterModule then ReactModule.createElement(TermsPrivacyFooterModule, { layoutOrder = NextOrder(), closeDrawer = UseResult }) else nil
	})
	UseDismissFlyoutOnPartyTopBannerModule()
	
	return ReactModule.createElement(DrawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = XDelta,
		children = Element,
		leftOffset = Left,
		topOffset = NewTop,
		bottomOffset = Bottom,
		backgroundStyle = UseTokensResult.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = UseResult1
	})
end)