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
local fFlagEnablePlusReferralRecipientFlyoutEntry = sharedFlagsModule.FFlagEnablePlusReferralRecipientFlyoutEntry
local fFlagEnableFlyoutOnNavRail = sharedFlagsModule.FFlagEnableFlyoutOnNavRail
local fFlagFlyoutSidePanelUseProfileFrameThumbnail = sharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail
local flyoutScaleMenuWidth = game:DefineFastFlag("FlyoutScaleMenuWidth", false)
local fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled = sharedFlagsModule.FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled
local var2 = if fFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local var3 = if fFlagEnablePlusReferralFlyoutEntry or fFlagEnablePlusReferralRecipientFlyoutEntry then require(script.Parent.Parent.Hooks.usePlusReferralFlyoutBannerBlindness) else nil
local plusReferralRecipientFlyoutBannerMaxImpressions = game:DefineFastInt("PlusReferralRecipientFlyoutBannerMaxImpressions", 10)
local var4 = if fFlagEnablePlusReferralFlyoutEntry then require(script.Parent.PlusReferralBanner) else nil
local var5 = if fFlagEnablePlusReferralRecipientFlyoutEntry then require(script.Parent.PlusReferralRecipientBanner) else nil
local var6 = if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu and enableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

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
	-- upvalues: useTokens (ref), useLocalRobuxBalance (ref), useSelector (ref), selectStatusBarHeight (ref), selectGlobalGuiInset (ref), fFlagEnableFlyoutOnNavRail (ref), useScreenSize (ref), flyoutScaleMenuWidth (ref), constantsModule (ref), useAppPolicy (ref), fFlagEnableBlackbirdCheck (ref), var2 (ref), fFlagEnablePlusReferralRecipientFlyoutEntry (ref), var3 (ref), plusReferralRecipientFlyoutBannerMaxImpressions (ref), fFlagEnableBlackbird (ref), var6 (ref), fFlagEnablePlusReferralFlyoutEntry (ref), useFlyoutNavigationItemsModule (ref), createNextOrder (ref), useSetDrawerVisible (ref), fFlagFlyoutSidePanelUseSharedProfileCardModule (ref), useRoactService (ref), appEventIngestService (ref), fFlagFlyoutTradesEntryExposureLoggingModule (ref), useFlyoutTradesEntryExposureLoggingModule (ref), fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled (ref), useCTAChangeMorePageFlyoutButtonTextExposureLoggingModule (ref), fFlagFlyoutTradesEntryImpressionLoggingModule (ref), useFlyoutTradesEntryImpressionLoggingModule (ref), reactModule (ref), flyoutAnalyticsModule (ref), var1 (ref), fFlagFlyoutSidePanelUseProfileFrameThumbnail (ref), flyoutProfileCardModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), robuxPillModule (ref), foundationModule (ref), divider (ref), var4 (ref), var5 (ref), flyoutNavigationListModule (ref), flyoutSwitchAccountButtonModule (ref), flyoutQuickSigninButtonModule (ref), flyoutReportLogsModule (ref), termsPrivacyFooterModule (ref), useDismissFlyoutOnPartyTopBannerModule (ref), drawerContainer (ref)
	local var7
	local var8 = useTokens()
	local var9 = useLocalRobuxBalance()
	local var10 = useSelector(selectGlobalGuiInset)
	local var11 = var10.top + useSelector(selectStatusBarHeight)
	local bottom = var10.bottom
	local var12 = if fFlagEnableFlyoutOnNavRail then nil else var10.left
	local var13 = useScreenSize()
	local _ = nil
	
	if flyoutScaleMenuWidth then
		local scale = var8.Config.UI.Scale
		var7 = math.min(constantsModule.FLYOUT_SIDE_PANEL_WIDTH * scale, var13.X - constantsModule.FLYOUT_SIDE_PADDING * scale)
	else
		var7 = if var13.X - constantsModule.FLYOUT_SIDE_PADDING < constantsModule.FLYOUT_SIDE_PANEL_WIDTH then var13.X - constantsModule.FLYOUT_SIDE_PADDING else constantsModule.FLYOUT_SIDE_PANEL_WIDTH
	end
	local var14 = useAppPolicy(function(p2)
		return p2.getDisableBlackbirdEntrypoints() or false
	end)
	local var15 = if fFlagEnableBlackbirdCheck then var2() else false
	local var16 = false
	local var17 = false
	local var18 = nil
	
	if fFlagEnablePlusReferralRecipientFlyoutEntry then
		local pendingReferral = p1.pendingReferral
		local recipientEligibility = p1.recipientEligibility
		local var19 = if pendingReferral then pendingReferral.hasPending else false
		var18 = if pendingReferral then pendingReferral.referrerId else nil
		local var20 = if recipientEligibility then recipientEligibility.eligible else false
		var16 = not var14 and (fFlagEnableBlackbird and (not var15 and (var19 and (var20 and var3(not var15 and (var19 and var20), "RobloxPlusUpsellImpressionCount4", plusReferralRecipientFlyoutBannerMaxImpressions)))))
		var17 = if pendingReferral then pendingReferral.isLoading or var19 and (if recipientEligibility then recipientEligibility.isLoading else false) else false
	end
	local var21 = not var14 and (var6 ~= nil and (not var15 and (not var16 and not var17)))
	local var22 = false
	
	if fFlagEnablePlusReferralFlyoutEntry then
		local senderEligibility = p1.senderEligibility
		local var23 = if senderEligibility then senderEligibility.eligible else false
		var22 = var15 and (var23 and var3(var15 and var23, "RobloxPlusUpsellImpressionCount2"))
	end
	local var24 = var9 and var9 >= 0
	local var25 = var24 or (var21 or (var22 or var16))
	local var26 = useFlyoutNavigationItemsModule()
	local var27 = createNextOrder()
	local var28 = useSetDrawerVisible()
	local var29 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then useRoactService(appEventIngestService) else nil
	
	if fFlagFlyoutTradesEntryExposureLoggingModule then
		useFlyoutTradesEntryExposureLoggingModule()
	end
	if fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled then
		useCTAChangeMorePageFlyoutButtonTextExposureLoggingModule()
	end
	if fFlagFlyoutTradesEntryImpressionLoggingModule then
		useFlyoutTradesEntryImpressionLoggingModule(var26.myLibraryItems)
	end
	local var30
	local var31 = reactModule.useCallback(function()
		-- upvalues: var28 (ref)
		var28(false)
	end, { var28 })
	local var32 = reactModule.useCallback(function(p2)
		-- upvalues: flyoutAnalyticsModule (copy)
		flyoutAnalyticsModule.onFlyoutSidePanelClosed(p2)
	end, {})
	local var33 = if fFlagFlyoutSidePanelUseSharedProfileCardModule then reactModule.useCallback(function()
		-- upvalues: var31 (ref), p1 (ref), flyoutAnalyticsModule (copy), var29 (write)
		var31()
		
		if p1.onProfileActivated then
			p1.onProfileActivated()
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var29, "Profile", if p1.localUserModel then p1.localUserModel.id else "")
		end
	end, { var31, var29, p1.localUserModel, p1.onProfileActivated }) else nil
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var34 = nil
	local t = {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var8.Padding.XLarge),
			PaddingBottom = UDim.new(0, var8.Padding.XLarge),
			PaddingLeft = UDim.new(0, var8.Padding.XLarge),
			PaddingRight = UDim.new(0, var8.Padding.XLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var8.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		ProfileCard = if fFlagFlyoutSidePanelUseSharedProfileCardModule then reactModule.createElement(var1, {
			layoutOrder = var27(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var15 else nil,
			onProfileActivated = var33,
			useProfileFrameThumbnail = fFlagFlyoutSidePanelUseProfileFrameThumbnail
		}) else reactModule.createElement(flyoutProfileCardModule, {
			layoutOrder = var27(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var15 else nil,
			onProfileActivated = p1.onProfileActivated,
			closeDrawer = var31
		}),
		RobuxPill = if fFlagEnableFlyoutMenuRobuxCardRefactor or not var24 then nil else reactModule.createElement(robuxPillModule, {
			layoutOrder = var27(),
			openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
			robuxBalance = var9,
			closeDrawer = var31
		})
	}
	
	if fFlagEnableFlyoutMenuRobuxCardRefactor and var25 then
		var30 = reactModule.createElement
		var30 = var30(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = var27(),
			stroke = {
				Color = var8.Color.Stroke.Default.Color3,
				Transparency = var8.Color.Stroke.Default.Transparency,
				Thickness = var8.Stroke.Standard
			},
			cornerRadius = UDim.new(0, var8.Radius.Medium)
		}, {
			RobuxPill = if var24 then reactModule.createElement(robuxPillModule, {
				layoutOrder = 1,
				openPurchaseRobuxPage = p1.openPurchaseRobuxPage,
				robuxBalance = var9,
				closeDrawer = var31
			}) else nil,
			UpsellDivider = if var24 and var21 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if var21 then reactModule.createElement(var6, { layoutOrder = 3, closeDrawer = var31 }) else nil,
			PlusReferralDivider = if var22 and (var24 or var21) then reactModule.createElement(divider, { LayoutOrder = 4 }) else nil,
			PlusReferralBanner = if var22 then reactModule.createElement(var4, { layoutOrder = 5, closeDrawer = var31 }) else nil,
			PlusReferralRecipientDivider = if var16 and (var24 or var21 or var22) then reactModule.createElement(divider, { LayoutOrder = 6 }) else nil,
			PlusReferralRecipientBanner = if var16 then reactModule.createElement(var5, {
				layoutOrder = 7,
				closeDrawer = var31,
				referrerId = var18,
				onOpenReferralSheet = p1.onOpenReferralSheet
			}) else nil
		})
	else
		var30 = nil
	end
	t.RobuxCard = var30
	t.MyLibrary = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var27(),
		navigationItems = var26.myLibraryItems,
		closeDrawer = var31,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.Divider = reactModule.createElement(divider, { LayoutOrder = var27() })
	t.AdditionalNavigation = reactModule.createElement(flyoutNavigationListModule, {
		layoutOrder = var27(),
		navigationItems = var26.additionalNavigationItems,
		closeDrawer = var31,
		buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
	})
	t.SwitchAccountButton = if p1.onSwitchAccountActivated then reactModule.createElement(flyoutSwitchAccountButtonModule, {
		layoutOrder = var27(),
		onSwitchAccountActivated = p1.onSwitchAccountActivated,
		closeDrawer = var31
	}) else nil
	t.QuickSigninButton = reactModule.createElement(flyoutQuickSigninButtonModule, { layoutOrder = var27(), closeDrawer = var31 })
	t.LogOut = p1.renderLogOut(var27())
	t.ReportLogs = if p1.openReportLogConfirmation then reactModule.createElement(flyoutReportLogsModule, {
		layoutOrder = var27(),
		openReportLogConfirmation = p1.openReportLogConfirmation,
		closeDrawer = var31
	}) else nil
	t.TermsPrivacyFooter = reactModule.createElement(termsPrivacyFooterModule, { layoutOrder = var27(), closeDrawer = var31 })
	createElement = createElement(fragment, var34, t)
	useDismissFlyoutOnPartyTopBannerModule()
	
	return reactModule.createElement(drawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = var7,
		children = createElement,
		leftOffset = var12,
		topOffset = var11,
		bottomOffset = bottom,
		backgroundStyle = var8.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = var32
	})
end)