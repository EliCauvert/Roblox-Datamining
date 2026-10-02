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
local fFlagFlyoutTradesEntryImpressionLoggingModule = require(script.Parent.Parent.Flags.FFlagFlyoutTradesEntryImpressionLogging)
local fFlagFlyoutSidePanelUseSharedProfileCardModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelUseSharedProfileCard)
local var1 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then require(parent.ProfileCard).ProfileCard else nil
local useFlyoutTradesEntryExposureLoggingModule = require(script.Parent.Parent.Hooks.useFlyoutTradesEntryExposureLogging)
local useCTAChangeMorePageFlyoutButtonTextExposureLoggingModule = require(script.Parent.Parent.Hooks.useCTAChangeMorePageFlyoutButtonTextExposureLogging)
local useFlyoutTradesEntryImpressionLoggingModule = require(script.Parent.Parent.Hooks.useFlyoutTradesEntryImpressionLogging)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local termsPrivacyFooterModule = require(script.Parent.TermsPrivacyFooter)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbird = sharedFlagsModule.FFlagEnableBlackbird
local fFlagEnableBlackbirdOnFlyoutMenu = sharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local enableBlackbirdUpsellOnFlyoutMenu = game:DefineFastFlag("EnableBlackbirdUpsellOnFlyoutMenu", false)
local fFlagEnableFlyoutMenuRobuxCardRefactor = sharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagEnablePlusReferralFlyoutEntry = sharedFlagsModule.FFlagEnablePlusReferralFlyoutEntry
local fFlagEnableFlyoutOnNavRail = sharedFlagsModule.FFlagEnableFlyoutOnNavRail
local fFlagFlyoutSidePanelUseProfileFrameThumbnail = sharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail
local flyoutScaleMenuWidth = game:DefineFastFlag("FlyoutScaleMenuWidth", false)
local fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled = sharedFlagsModule.FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled
local var2 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var3 = if fFlagEnablePlusReferralFlyoutEntry then require(script.Parent.Parent.Hooks.usePlusReferralFlyoutBannerBlindness) else nil
local var4 = if fFlagEnablePlusReferralFlyoutEntry then require(script.Parent.PlusReferralBanner) else nil
local var5 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p1)
	return p1.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(value)
	return value.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	return math.min(constantsModule.FLYOUT_SIDE_PANEL_WIDTH * p2, p1 - constantsModule.FLYOUT_SIDE_PADDING * p2)
end

return reactModule.memo(function(p1, _)
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), flyoutScaleMenuWidth (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var2 (ref), var5 (ref), fFlagEnablePlusReferralFlyoutEntry (ref), var3 (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), fFlagFlyoutSidePanelUseSharedProfileCardModule (ref), useRoactService (ref), appEventIngestService (ref), fFlagFlyoutTradesEntryExposureLoggingModule (ref), useFlyoutTradesEntryExposureLoggingModule (ref), fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled (ref), useCTAChangeMorePageFlyoutButtonTextExposureLoggingModule (ref), fFlagFlyoutTradesEntryImpressionLoggingModule (ref), useFlyoutTradesEntryImpressionLoggingModule (ref), reactModule (ref), flyoutAnalyticsModule (ref), var1 (ref), fFlagFlyoutSidePanelUseProfileFrameThumbnail (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), var4 (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var6
	local var7 = useTokens()
	local var8 = useLocalRobuxBalance()
	local var9 = useSelector(selectGlobalGuiInset)
	local var10 = var9.top + useSelector(selectStatusBarHeight)
	local bottom = var9.bottom
	local var11 = if fFlagEnableFlyoutOnNavRail then nil else var9.left
	local var12 = useScreenSize()
	local _ = nil
	
	if flyoutScaleMenuWidth then
		local scale = var7.Config.UI.Scale
		var6 = math.min(constantsModule.FLYOUT_SIDE_PANEL_WIDTH * scale, var12.X - constantsModule.FLYOUT_SIDE_PADDING * scale)
	else
		var6 = if var12.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var12.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	end
	local var13 = if fFlagEnableBlackbirdCheck then var2() else false
	local var14 = not useAppPolicy(function(p2)
		return p2.getDisableBlackbirdEntrypoints() or false
	end) and (var5 ~= nil and not var13)
	local var15 = if fFlagEnablePlusReferralFlyoutEntry then var3(var13, "RobloxPlusUpsellImpressionCount2") else false
	local var16 = var8 and var8 >= 0
	local var17 = var16 or (var14 or var15)
	local var18 = useFlyoutNavigationItemsModule()
	local var19 = createNextOrder()
	local var20 = useSetDrawerVisible()
	local var21 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then useRoactService(appEventIngestService) else nil
	
	if fFlagFlyoutTradesEntryExposureLoggingModule then
		useFlyoutTradesEntryExposureLoggingModule()
	end
	if fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled then
		useCTAChangeMorePageFlyoutButtonTextExposureLoggingModule()
	end
	if fFlagFlyoutTradesEntryImpressionLoggingModule then
		useFlyoutTradesEntryImpressionLoggingModule(var18.myLibraryItems)
	end
	local var22
	local var23 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20(false)
	end, { var20 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p2)
	end, {})
	local var25 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then reactModule.useCallback(function()
		-- upvalues: var23 (ref), p1 (ref), flyoutAnalyticsModule (copy), var21 (write)
		var23()
		
		if p1.onProfileActivated then
			p1.onProfileActivated()
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var21, "Profile", if p1.localUserModel then p1.localUserModel.id else "")
		end
	end, { var23, var21, p1.localUserModel, p1.onProfileActivated }) else nil
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var26 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var7.Padding.XLarge),
			PaddingBottom = UDim.new(0, var7.Padding.XLarge),
			PaddingLeft = UDim.new(0, var7.Padding.XLarge),
			PaddingRight = UDim.new(0, var7.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var7.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = if fFlagFlyoutSidePanelUseSharedProfileCardModule then reactModule.createElement(var1, {
			layoutOrder = var19(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var13 else nil,
			onProfileActivated = var25,
			useProfileFrameThumbnail = fFlagFlyoutSidePanelUseProfileFrameThumbnail
		}) else reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var19(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var13 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var23
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var16 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var19(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var8,
			closeDrawer = var23
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var17 then
		var22 = reactModule.createElement
		var22 = var22(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var19(),
			stroke = {
				Color = var7.Color.Stroke.Default.Color3,
				Transparency = var7.Color.Stroke.Default.Transparency,
				Thickness = var7.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var7.Radius.Medium)
		}, {
			RobuxPill = if var16 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var8,
				closeDrawer = var23
			}) else nil,
			UpsellDivider = if var16 and var14 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var14 then reactModule.createElement(var5, { layoutOrder = 3, closeDrawer = var23 }) else nil,
			PlusReferralDivider = if var15 and (var16 or var14) then reactModule.createElement(divider, { LayoutOrder = 4 }) else nil,
			PlusReferralBanner = if var15 then reactModule.createElement(var4, { layoutOrder = 5, closeDrawer = var23 }) else nil
		})
	else
		var22 = nil
	end
	t.RobuxCard = var22
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var19(),
		navigationItems = var18.myLibraryItems,
		closeDrawer = var23,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var19() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var19(),
		navigationItems = var18.additionalNavigationItems,
		closeDrawer = var23,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var19(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var23
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var19(), closeDrawer = var23 })
	t.LogOut = p1.renderLogOut(var19())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var19(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var23
	}) else nil
	t.TermsPrivacyFooter = reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var19(), closeDrawer = var23 })
	createElement = createElement(fragment, var26, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var6,
		children = createElement,
		leftOffset = var11,
		topOffset = var10,
		bottomOffset = bottom,
		backgroundStyle = var7.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var24
	})
end)