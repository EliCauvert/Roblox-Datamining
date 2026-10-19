local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
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
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local RobuxPillModule = require(script.Parent.RobuxPill)
local FlyoutNavigationListModule = require(script.Parent.FlyoutNavigationList)
local FlyoutQuickSigninButtonModule = require(script.Parent.FlyoutQuickSigninButton)
local FlyoutReportLogsModule = require(script.Parent.FlyoutReportLogs)
local FlyoutSwitchAccountButtonModule = require(script.Parent.FlyoutSwitchAccountButton)
local FlyoutProfileCardModule = require(script.Parent.FlyoutProfileCard)
local UseDismissFlyoutOnPartyTopBannerModule = require(script.Parent.Parent.Hooks.useDismissFlyoutOnPartyTopBanner)
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local FFlagFlyoutTradesEntryExposureLoggingModule = require(script.Parent.Parent.Flags.FFlagFlyoutTradesEntryExposureLogging)
local FFlagFlyoutTradesEntryImpressionLoggingModule = require(script.Parent.Parent.Flags.FFlagFlyoutTradesEntryImpressionLogging)
local FFlagFlyoutSidePanelUseSharedProfileCardModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelUseSharedProfileCard)
local ProfileCard = if FFlagFlyoutSidePanelUseSharedProfileCardModule then require(Parent.ProfileCard).ProfileCard else nil
local UseFlyoutTradesEntryExposureLoggingModule = require(script.Parent.Parent.Hooks.useFlyoutTradesEntryExposureLogging)
local UseCTAChangeMorePageFlyoutButtonTextExposureLoggingModule = require(script.Parent.Parent.Hooks.useCTAChangeMorePageFlyoutButtonTextExposureLogging)
local UseFlyoutTradesEntryImpressionLoggingModule = require(script.Parent.Parent.Hooks.useFlyoutTradesEntryImpressionLogging)
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local TermsPrivacyFooterModule = require(script.Parent.TermsPrivacyFooter)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagEnableBlackbirdOnFlyoutMenu = SharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local EnableBlackbirdUpsellOnFlyoutMenu = game:DefineFastFlag("EnableBlackbirdUpsellOnFlyoutMenu", false)
local FFlagEnableFlyoutMenuRobuxCardRefactor = SharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagEnablePlusReferralFlyoutEntry = SharedFlagsModule.FFlagEnablePlusReferralFlyoutEntry
local FFlagEnablePlusReferralRecipientFlyoutEntry = SharedFlagsModule.FFlagEnablePlusReferralRecipientFlyoutEntry
local FFlagEnableFlyoutOnNavRail = SharedFlagsModule.FFlagEnableFlyoutOnNavRail
local FFlagFixOverlayTopInsetForDeviceSafeInsets = SharedFlagsModule.FFlagFixOverlayTopInsetForDeviceSafeInsets
local ShouldUseDeviceSafeInsets = require(Parent.Display).shouldUseDeviceSafeInsets
local FFlagFlyoutSidePanelUseProfileFrameThumbnail = SharedFlagsModule.FFlagFlyoutSidePanelUseProfileFrameThumbnail
local FlyoutScaleMenuWidth = game:DefineFastFlag("FlyoutScaleMenuWidth", false)
local FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled = SharedFlagsModule.FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled
local UseHasRobloxSubscriptionModule = if FFlagEnableBlackbirdCheck then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil
local UsePlusReferralFlyoutBannerBlindnessModule = if FFlagEnablePlusReferralFlyoutEntry or FFlagEnablePlusReferralRecipientFlyoutEntry then require(script.Parent.Parent.Hooks.usePlusReferralFlyoutBannerBlindness) else nil
local PlusReferralRecipientFlyoutBannerMaxImpressions = game:DefineFastInt("PlusReferralRecipientFlyoutBannerMaxImpressions", 10)
local PlusReferralBannerModule = if FFlagEnablePlusReferralFlyoutEntry then require(script.Parent.PlusReferralBanner) else nil
local PlusReferralRecipientBannerModule = if FFlagEnablePlusReferralRecipientFlyoutEntry then require(script.Parent.PlusReferralRecipientBanner) else nil
local BlackbirdUpsellBannerModule = if FFlagEnableBlackbird and FFlagEnableBlackbirdOnFlyoutMenu and EnableBlackbirdUpsellOnFlyoutMenu then require(script.Parent.BlackbirdUpsellBanner) else nil

local function selectStatusBarHeight(p1) --[[ Line: 120 ]]
	return p1.TopBar.statusBarHeight or 0
end

local function selectGlobalGuiInset(p1) --[[ Line: 124 ]]
	return p1.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
end

local function _(p1, p2): number --[[ Line: 128 | Named "getFlyoutMenuWidth" ]]
	-- upvalues: ConstantsModule (copy)
	return (math.min(ConstantsModule.FLYOUT_SIDE_PANEL_WIDTH * p2, p1 - ConstantsModule.FLYOUT_SIDE_PADDING * p2))
end

return ReactModule.memo(function(p1, _) --[[ Line: 133 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalRobuxBalanceFunction (copy), UseSelectorFunction (copy), selectStatusBarHeight (copy), selectGlobalGuiInset (copy), FFlagFixOverlayTopInsetForDeviceSafeInsets (copy), UseDeviceInsetsFunction (copy), ShouldUseDeviceSafeInsets (copy), FFlagEnableFlyoutOnNavRail (copy), UseScreenSizeFunction (copy), FlyoutScaleMenuWidth (copy), ConstantsModule (copy), UseAppPolicyFunction (copy), FFlagEnableBlackbirdCheck (copy), UseHasRobloxSubscriptionModule (copy), FFlagEnablePlusReferralRecipientFlyoutEntry (copy), UsePlusReferralFlyoutBannerBlindnessModule (copy), PlusReferralRecipientFlyoutBannerMaxImpressions (copy), FFlagEnableBlackbird (copy), BlackbirdUpsellBannerModule (copy), FFlagEnablePlusReferralFlyoutEntry (copy), UseFlyoutNavigationItemsModule (copy), CreateNextOrderFunction (copy), UseSetDrawerVisibleFunction (copy), FFlagFlyoutSidePanelUseSharedProfileCardModule (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), FFlagFlyoutTradesEntryExposureLoggingModule (copy), UseFlyoutTradesEntryExposureLoggingModule (copy), FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled (copy), UseCTAChangeMorePageFlyoutButtonTextExposureLoggingModule (copy), FFlagFlyoutTradesEntryImpressionLoggingModule (copy), UseFlyoutTradesEntryImpressionLoggingModule (copy), ReactModule (copy), FlyoutAnalyticsModule (copy), ProfileCard (copy), FFlagFlyoutSidePanelUseProfileFrameThumbnail (copy), FlyoutProfileCardModule (copy), FFlagEnableFlyoutMenuRobuxCardRefactor (copy), RobuxPillModule (copy), FoundationModule (copy), Divider (copy), PlusReferralBannerModule (copy), PlusReferralRecipientBannerModule (copy), FlyoutNavigationListModule (copy), FlyoutSwitchAccountButtonModule (copy), FlyoutQuickSigninButtonModule (copy), FlyoutReportLogsModule (copy), TermsPrivacyFooterModule (copy), UseDismissFlyoutOnPartyTopBannerModule (copy), DrawerContainer (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalRobuxBalanceResult: number = UseLocalRobuxBalanceFunction()
	local UseSelectorResult = UseSelectorFunction(selectStatusBarHeight)
	local UseSelectorResult1 = UseSelectorFunction(selectGlobalGuiInset)
	local DeviceSafeInsets = nil
	
	if FFlagFixOverlayTopInsetForDeviceSafeInsets then
		local UseDeviceInsetsResult = UseDeviceInsetsFunction()
		DeviceSafeInsets = if ShouldUseDeviceSafeInsets then UseDeviceInsetsResult else nil
	end
	local NewTop = UseSelectorResult1.top + UseSelectorResult
	local Bottom = if DeviceSafeInsets then 0 else UseSelectorResult1.bottom
	local Left = if FFlagEnableFlyoutOnNavRail then nil else UseSelectorResult1.left
	local UseScreenSizeResult = UseScreenSizeFunction()
	local Smallest = nil
	
	if FlyoutScaleMenuWidth then
		local Scale = UseTokensResult.Config.UI.Scale
		Smallest = math.min(ConstantsModule.FLYOUT_SIDE_PANEL_WIDTH * Scale, UseScreenSizeResult.X - ConstantsModule.FLYOUT_SIDE_PADDING * Scale)
	else
		Smallest = if UseScreenSizeResult.X - ConstantsModule.FLYOUT_SIDE_PADDING < ConstantsModule.FLYOUT_SIDE_PANEL_WIDTH then UseScreenSizeResult.X - ConstantsModule.FLYOUT_SIDE_PADDING else ConstantsModule.FLYOUT_SIDE_PANEL_WIDTH
	end
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 157 ]]
		return p2.getDisableBlackbirdEntrypoints() or false
	end)
	local UseHasRobloxSubscriptionModuleResult = if FFlagEnableBlackbirdCheck then UseHasRobloxSubscriptionModule() else false
	local v1 = false
	local IsLoading = false
	local ReferrerId = nil
	
	if FFlagEnablePlusReferralRecipientFlyoutEntry then
		local PendingReferral = p1.pendingReferral
		local RecipientEligibility = p1.recipientEligibility
		local HasPending = if PendingReferral then PendingReferral.hasPending else false
		ReferrerId = if PendingReferral then PendingReferral.referrerId else nil
		local Eligible = if RecipientEligibility then RecipientEligibility.eligible else false
		local RobloxPlusUpsellImpressionCount4 = UsePlusReferralFlyoutBannerBlindnessModule(not UseHasRobloxSubscriptionModuleResult and (HasPending and Eligible), "RobloxPlusUpsellImpressionCount4", PlusReferralRecipientFlyoutBannerMaxImpressions)
		v1 = not UseAppPolicyResult and (FFlagEnableBlackbird and (not UseHasRobloxSubscriptionModuleResult and (HasPending and (Eligible and RobloxPlusUpsellImpressionCount4))))
		local IsLoading1 = if RecipientEligibility then RecipientEligibility.isLoading else false
		IsLoading = if PendingReferral then PendingReferral.isLoading or HasPending and IsLoading1 else false
	end
	local NoIsLoading: boolean = not UseAppPolicyResult and (BlackbirdUpsellBannerModule ~= nil and (not UseHasRobloxSubscriptionModuleResult and (not v1 and not IsLoading)))
	local v2 = false
	
	if FFlagEnablePlusReferralFlyoutEntry then
		local SenderEligibility = p1.senderEligibility
		local Eligible = if SenderEligibility then SenderEligibility.eligible else false
		local RobloxPlusUpsellImpressionCount2 = UsePlusReferralFlyoutBannerBlindnessModule(UseHasRobloxSubscriptionModuleResult and Eligible, "RobloxPlusUpsellImpressionCount2")
		v2 = UseHasRobloxSubscriptionModuleResult and (Eligible and RobloxPlusUpsellImpressionCount2)
	end
	local IsUseLocalRobuxBalanceResultAbove: boolean = UseLocalRobuxBalanceResult and UseLocalRobuxBalanceResult >= 0
	local IsUseLocalRobuxBalanceResultAbove1: boolean = IsUseLocalRobuxBalanceResultAbove or (NoIsLoading or (v2 or v1))
	local UseFlyoutNavigationItemsModuleResult = UseFlyoutNavigationItemsModule()
	local NextOrder = CreateNextOrderFunction()
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseRoactServiceResult = if FFlagFlyoutSidePanelUseSharedProfileCardModule then UseRoactServiceFunction(AppEventIngestService) else nil
	
	if FFlagFlyoutTradesEntryExposureLoggingModule then
		UseFlyoutTradesEntryExposureLoggingModule()
	end
	if FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled then
		UseCTAChangeMorePageFlyoutButtonTextExposureLoggingModule()
	end
	if FFlagFlyoutTradesEntryImpressionLoggingModule then
		UseFlyoutTradesEntryImpressionLoggingModule(UseFlyoutNavigationItemsModuleResult.myLibraryItems)
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 224 ]]
		-- upvalues: UseSetDrawerVisibleResult (copy)
		UseSetDrawerVisibleResult(false)
	end, { UseSetDrawerVisibleResult })
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 227 ]]
		-- upvalues: FlyoutAnalyticsModule (upval)
		FlyoutAnalyticsModule.onFlyoutSidePanelClosed(p2)
	end, {})
	local UseResult2 = if FFlagFlyoutSidePanelUseSharedProfileCardModule then ReactModule.useCallback(function() --[[ Line: 232 ]]
		-- upvalues: UseResult (copy), p1 (copy), FlyoutAnalyticsModule (upval), UseRoactServiceResult (ref)
		UseResult()
		
		if p1.onProfileActivated then
			p1.onProfileActivated()
			FlyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(UseRoactServiceResult, "Profile", p1.localUserModel and p1.localUserModel.id or "")
		end
	end, {
		UseResult,
		UseRoactServiceResult,
		p1.localUserModel,
		p1.onProfileActivated
	}) else nil
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
		ProfileCard = if FFlagFlyoutSidePanelUseSharedProfileCardModule then ReactModule.createElement(ProfileCard, {
			layoutOrder = NextOrder(),
			localUserModel = p1.localUserModel,
			isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseHasRobloxSubscriptionModuleResult else nil,
			onProfileActivated = UseResult2,
			useProfileFrameThumbnail = FFlagFlyoutSidePanelUseProfileFrameThumbnail
		}) else ReactModule.createElement(FlyoutProfileCardModule, {
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
			UpsellDivider = if IsUseLocalRobuxBalanceResultAbove and NoIsLoading then ReactModule.createElement(Divider, { LayoutOrder = 2 }) else nil,
			BlackbirdUpsellBanner = if NoIsLoading then ReactModule.createElement(BlackbirdUpsellBannerModule, { layoutOrder = 3, closeDrawer = UseResult }) else nil,
			PlusReferralDivider = if v2 and (IsUseLocalRobuxBalanceResultAbove or NoIsLoading) then ReactModule.createElement(Divider, { LayoutOrder = 4 }) else nil,
			PlusReferralBanner = if v2 then ReactModule.createElement(PlusReferralBannerModule, { layoutOrder = 5, closeDrawer = UseResult }) else nil,
			PlusReferralRecipientDivider = if v1 and (IsUseLocalRobuxBalanceResultAbove or NoIsLoading or v2) then ReactModule.createElement(Divider, { LayoutOrder = 6 }) else nil,
			PlusReferralRecipientBanner = if v1 then ReactModule.createElement(PlusReferralRecipientBannerModule, {
				layoutOrder = 7,
				closeDrawer = UseResult,
				referrerId = ReferrerId,
				onOpenReferralSheet = p1.onOpenReferralSheet
			}) else nil
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
		TermsPrivacyFooter = ReactModule.createElement(TermsPrivacyFooterModule, { layoutOrder = NextOrder(), closeDrawer = UseResult })
	})
	UseDismissFlyoutOnPartyTopBannerModule()
	
	return ReactModule.createElement(DrawerContainer, {
		displayOrder = p1.displayOrder,
		menuWidth = Smallest,
		children = Element,
		leftOffset = Left,
		topOffset = NewTop,
		bottomOffset = Bottom,
		deviceSafeInsets = DeviceSafeInsets,
		backgroundStyle = UseTokensResult.Color.Surface.Surface_0,
		onDrawerClosedAnalytics = UseResult1
	})
end)