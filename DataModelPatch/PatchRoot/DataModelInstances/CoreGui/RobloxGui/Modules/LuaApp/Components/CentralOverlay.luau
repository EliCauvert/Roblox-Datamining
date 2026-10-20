local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CryoModule = require(CorePackages.Packages.Cryo)
local ImmutableModule = require(Modules.Common.Immutable)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local ColorsModule = require(Modules.LuaApp.Themes.Colors)
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceRegistry = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local UseRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local UseDeRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local VRCentralOverlayModule = require(Modules.LuaApp.Components.CrossPlatformCompatibility.VRCentralOverlay)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local GetVirtualResolutionScaleFunction = ResponsiveModule.getVirtualResolutionScale
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local GetFFlagEnableOtpEmailLoginModule = require(Modules.LuaApp.Flags.GetFFlagEnableOtpEmailLogin)
local GetFFlagEnableVNGNewAppAvailableModalModule = require(Modules.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign
local FFlagEnableKoreaKISAComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagUseUpdatedVNGAgreementsWorkflowFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow
local FFlagLuaAppHomeVngAppUpsell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell
local GetFFlagEnableReminderOfNormsABTestFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest
local GetFFlagApplyResolutionScaleFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagApplyResolutionScale
local GetFFlagEnableInAppBugReportingFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting
local FFlagEnableAbuseReportRevampFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow
local FFlagEnableMagicLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMagicLogin
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXWearTimeSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXWearTimeSupport
local FFlagEnableUnifiedProductPurchaseFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableSystemTrayModals = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSystemTrayModals
local FFlagRemoveCentralOverlayScrimForUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRemoveCentralOverlayScrimForUnifiedPurchaseModal
local FFlagLuaAppPlayButtonUpsellLinking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking
local FFlagSduiEventDetailsSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiEventDetailsSupport
local GetFFlagLuaAppFixStudioNotchSupportModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local LuaAppFixCentralOverlayDeviceSafe = game:DefineFastFlag("LuaAppFixCentralOverlayDeviceSafe", false)
local RemoveCentralOverlayBackgroundSafeArea = game:DefineFastFlag("RemoveCentralOverlayBackgroundSafeArea", false)
local config = {
	[OverlayTypeModule.PlacesList] = true,
	[OverlayTypeModule.PeopleList] = true,
	[OverlayTypeModule.ExperienceGuidelinesExplained] = true,
	[OverlayTypeModule.PurchaseGame] = true,
	[OverlayTypeModule.PurchaseGameRobuxShortfall] = true,
	[OverlayTypeModule.LeaveRobloxAlert] = true,
	[OverlayTypeModule.ReportLogsOverlay] = true,
	[OverlayTypeModule.ConfirmSignOut] = true,
	[OverlayTypeModule.UpdateRequiredPrompt] = true,
	[OverlayTypeModule.AgreeToPhoneNumberVerification] = true,
	[OverlayTypeModule.DevSubMore] = true,
	[OverlayTypeModule.DevSubConfirmCancel] = true,
	[OverlayTypeModule.TencentNoticePopup] = true,
	[OverlayTypeModule.SignUpBirthdayPickerOverlay] = true,
	[OverlayTypeModule.LoginPasswordResetPrompt] = true,
	[OverlayTypeModule.LoginEmailVerificationPrompt] = true,
	[OverlayTypeModule.EmailVerificationUpsellOverlay] = true,
	[OverlayTypeModule.PhoneVerificationUpsellOverlay] = true,
	[OverlayTypeModule.PhoneVerificationUpsellOverlayWrapper] = true,
	[OverlayTypeModule.VoicePhoneVerificationUpsellOverlayWrapper] = true,
	[OverlayTypeModule.CrossDeviceCodePrompt] = true,
	[OverlayTypeModule.CrossDeviceLoginConfirmation] = true,
	[OverlayTypeModule.VerifiedEnableVoice] = true,
	[OverlayTypeModule.UserAgreementsUpdatedPopup] = true,
	[OverlayTypeModule.VNGUserAgreementsPopup] = true,
	[OverlayTypeModule.VerifyPhoneNumber] = true,
	[OverlayTypeModule.AccountSecurityPromptOverlay] = true,
	[OverlayTypeModule.CameraPermissionPrompt] = true,
	[OverlayTypeModule.AccountAuthenticationFailureOverlay] = true,
	[OverlayTypeModule.UserAgreementsPrompt] = true,
	[OverlayTypeModule.UserAgreementsSecondPrompt] = true,
	[OverlayTypeModule.SimpleTextAlertPrompt] = true,
	[OverlayTypeModule.FindFriendsModal] = true,
	[OverlayTypeModule.ContactsList] = true,
	[OverlayTypeModule.PurchasePass] = true,
	[OverlayTypeModule.PurchasePassInsufficientRobux] = true,
	[OverlayTypeModule.PurchaseDeveloperProduct] = true,
	[OverlayTypeModule.PurchaseDeveloperProductInsufficientRobux] = true,
	[OverlayTypeModule.PurchaseDeveloperProductPendingProductsLimitExceeded] = true,
	[OverlayTypeModule.PurchaseDeveloperProductSuccess] = true,
	[OverlayTypeModule.IapExperienceAnimator] = true,
	[OverlayTypeModule.DiscoverabilityUpsell] = true,
	[OverlayTypeModule.SurveyPrompt] = true,
	[OverlayTypeModule.GamepadDisconnected] = true,
	[OverlayTypeModule.AccountSelector] = if require(Modules.LuaApp.Flags.GetFFlagEnableLoginAccountSelector)() then true else nil,
	[OverlayTypeModule.AccountSwitcher] = if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then true else nil,
	[OverlayTypeModule.EmailOtp] = if GetFFlagEnableOtpEmailLoginModule() then true else nil,
	[OverlayTypeModule.NewAppAvailableModal] = if GetFFlagEnableVNGNewAppAvailableModalModule() then true else nil,
	[OverlayTypeModule.AccountSwitchingErrorOverlay] = if FFlagEnableLuaAccountSwitchModule then true else nil,
	[OverlayTypeModule.CloseOnlyInteractiveAlert] = true,
	[OverlayTypeModule.ConfirmationDialog] = true,
	[OverlayTypeModule.UpsellModal] = not FFlagLuaAppPlayButtonUpsellLinking or nil,
	[OverlayTypeModule.PlayButtonUpsellDialog] = if FFlagLuaAppPlayButtonUpsellLinking then true else nil,
	[OverlayTypeModule.SduiOverlay] = not require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiExperienceDetailsSupport and not FFlagSduiEventDetailsSupport and nil,
	[OverlayTypeModule.SquadPrompt] = if GetFFlagIsSquadEnabledFunction() then true else nil,
	[OverlayTypeModule.VngContactInfoFormWebviewPopup] = true,
	[OverlayTypeModule.VngComplianceLoadingPopup] = if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then true else nil,
	[OverlayTypeModule.KISAPopUpAgreements] = if FFlagEnableKoreaKISAComplianceModule then true else nil,
	[OverlayTypeModule.ItemsReceivedAlert] = true,
	[OverlayTypeModule.VngAppUpsell] = if FFlagLuaAppHomeVngAppUpsell then true else nil,
	[OverlayTypeModule.GamePlayerFeedbackForm] = if GetFFlagEdpPlayerFeedbackEnabledFunction() then true else nil,
	[OverlayTypeModule.ReminderOfNormsPopup] = if GetFFlagEnableReminderOfNormsABTestFunction() then true else nil,
	[OverlayTypeModule.BugReporter] = if GetFFlagEnableInAppBugReportingFunction() then true else nil,
	[OverlayTypeModule.SettingsPermissionInteractiveAlert] = true,
	[OverlayTypeModule.DynamicAbuseReport] = if FFlagEnableAbuseReportRevampFlow then true else nil,
	[OverlayTypeModule.AccountReactivationPrompt] = true,
	[OverlayTypeModule.MagicLoginApprovePopup] = if FFlagEnableMagicLogin then true else nil,
	[OverlayTypeModule.MagicLoginRequestPopup] = if FFlagEnableMagicLogin then true else nil,
	[OverlayTypeModule.DeviceSelectorPeekView] = if FFlagEnableMagicLogin then true else nil,
	[OverlayTypeModule.AccountLinkingAlert] = true,
	[OverlayTypeModule.WearTimeInfoModal] = if FFlagAXWearTimeSupport then true else nil,
	[OverlayTypeModule.EconomicRestrictionPrompt] = true,
	[OverlayTypeModule.AccountLockModal] = true,
	[OverlayTypeModule.UnifiedProductPurchaseModal] = if FFlagEnableUnifiedProductPurchaseFlow then true else nil,
	[OverlayTypeModule.NotificationsModal] = if FFlagEnableSystemTrayModals then true else nil,
	[OverlayTypeModule.SystemTrayModal] = if FFlagEnableSystemTrayModals then true else nil,
	[OverlayTypeModule.UnifiedProductPurchaseModal] = if FFlagEnableUnifiedProductPurchaseFlow then not FFlagRemoveCentralOverlayScrimForUnifiedPurchaseModal else nil
}
local OverlayComponent = require(Modules.LuaApp.Components.CentralOverlayUtils).OverlayComponent
local CentralOverlay = RoactModule.PureComponent:extend("CentralOverlay")
CentralOverlay.defaultProps = { hideCentralOverlay = false }

function CentralOverlay.init(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), RoactModule (copy)
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.createFocusController()
	p1.defaultChildRef = RoactModule.createRef()
end

function CentralOverlay.render(p1)
	-- upvalues: GetFFlagApplyResolutionScaleFunction (copy), GetVirtualResolutionScaleFunction (copy), WithStyleFunction (copy), GetSafeAreaSizeFunction (copy), ColorsModule (copy), CryoModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), CloseCentralOverlayModule (copy), ReactModule (copy), RemoveCentralOverlayBackgroundSafeArea (copy), LuaAppFixCentralOverlayDeviceSafe (copy), ImmutableModule (copy), RoactModule (copy), CoreGui (copy), ScreenGuiWithBlurControlModule (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy)
	local VirtualResolutionScale = if GetFFlagApplyResolutionScaleFunction() then GetVirtualResolutionScaleFunction() else 1
	local DisplayOrder = p1.props.displayOrder
	local OverlayComponent = p1.props.overlayComponent
	local Arguments = p1.props.arguments
	local _Vector2 = if GetFFlagApplyResolutionScaleFunction() then Vector2.new(p1.props.screenSize.X * VirtualResolutionScale, p1.props.screenSize.Y * VirtualResolutionScale) else p1.props.screenSize
	local GlobalGuiInset = p1.props.globalGuiInset
	local ShouldCreateBackgroundWrapper = p1.props.shouldCreateBackgroundWrapper
	
	return if _Vector2.X <= 0 or _Vector2.Y <= 0 then nil else WithStyleFunction(function(p2)
		-- upvalues: GetSafeAreaSizeFunction (upval), _Vector2 (copy), GlobalGuiInset (copy), ColorsModule (upval), p1 (copy), Arguments (ref), CryoModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), CloseCentralOverlayModule (upval), ShouldCreateBackgroundWrapper (copy), ReactModule (upval), RemoveCentralOverlayBackgroundSafeArea (upval), LuaAppFixCentralOverlayDeviceSafe (upval), OverlayComponent (copy), ImmutableModule (upval), RoactModule (upval), CoreGui (upval), ScreenGuiWithBlurControlModule (upval), GetFFlagLuaAppFixStudioNotchSupportModule (upval), DisplayOrder (copy)
		local SafeAreaSize = GetSafeAreaSizeFunction(_Vector2, GlobalGuiInset)
		local Black = ColorsModule.Black
		local Transparency = 0.3
		
		if p2 then
			if p1.props.includeStatusBar then
				SafeAreaSize = UDim2.new(0, SafeAreaSize.X.Offset, 0, SafeAreaSize.Y.Offset)
			end
			Black = p2.Theme.Overlay.Color
			Transparency = p2.Theme.Overlay.Transparency
		end
		Arguments = CryoModule.Dictionary.join(Arguments, {
			defaultChildRef = p1.defaultChildRef,
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
			closeCentralOverlayThunk = CloseCentralOverlayModule
		})
		local Frame = ShouldCreateBackgroundWrapper and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Selectable = false,
			Active = true,
			Position = if RemoveCentralOverlayBackgroundSafeArea then nil else UDim2.fromOffset(if LuaAppFixCentralOverlayDeviceSafe then 0 else -GlobalGuiInset.left, -GlobalGuiInset.top),
			Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y),
			BackgroundColor3 = Black,
			BackgroundTransparency = Transparency
		}, {
			SafeAreaFrame = if RemoveCentralOverlayBackgroundSafeArea then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Selectable = false,
				Position = UDim2.fromOffset(if LuaAppFixCentralOverlayDeviceSafe then 0 else GlobalGuiInset.left, GlobalGuiInset.top),
				Size = SafeAreaSize
			}, {
				Prompt = if OverlayComponent then ReactModule.createElement(OverlayComponent, ImmutableModule.JoinDictionaries(Arguments, { containerWidth = SafeAreaSize.X.Offset })) else nil
			}),
			Prompt = if RemoveCentralOverlayBackgroundSafeArea and OverlayComponent then ReactModule.createElement(OverlayComponent, ImmutableModule.JoinDictionaries(Arguments, { containerWidth = SafeAreaSize.X.Offset })) else nil
		}) or (if OverlayComponent then ReactModule.createElement(OverlayComponent, Arguments) else nil)
		
		return ReactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			PortalUIForOverlay = OverlayComponent and ReactModule.createElement(ScreenGuiWithBlurControlModule, {
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				ScreenInsets = if GetFFlagLuaAppFixStudioNotchSupportModule() then Enum.ScreenInsets.None else nil,
				DisplayOrder = DisplayOrder
			}, {
				WrappingFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Selectable = false,
					SelectionGroup = true,
					Size = UDim2.fromScale(1, 1),
					ref = p1.props.forwardRef,
					SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
					SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
					SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
					SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				}, { OverlayComponent = Frame })
			})
		})
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	-- upvalues: OverlayComponent (copy), config (copy)
	local OverlayType = p1.CentralOverlay.OverlayType
	
	return {
		overlayComponent = OverlayComponent[OverlayType],
		shouldCreateBackgroundWrapper = config[OverlayType],
		arguments = p1.CentralOverlay.Arguments,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(CentralOverlay)

local function v42(p1)
	-- upvalues: UseIsSpatialFunction (copy), ReactModule (copy), VRCentralOverlayModule (copy), v1 (ref)
	return if UseIsSpatialFunction() then ReactModule.createElement(VRCentralOverlayModule, p1) else ReactModule.createElement(v1, p1)
end

local config1 = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: UseSelectorFunction (copy), OverlayComponent (copy), ReactModule (copy), UseRegisterFocusNavigableSurfaceFunction (copy), UseDeRegisterFocusNavigableSurfaceFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseDispatchFunction (copy), OverlayTypeModule (copy), InputHandlersModule (copy), CloseCentralOverlayModule (copy), ReactFocusNavigationModule (copy), config1 (copy), FocusNavigationEventNameEnum (copy), v42 (copy), CryoModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: OverlayComponent (upval)
		return OverlayComponent[p2.CentralOverlay.OverlayType] ~= nil
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRegisterFocusNavigableSurfaceResult = UseRegisterFocusNavigableSurfaceFunction()
	local UseDeRegisterFocusNavigableSurfaceResult = UseDeRegisterFocusNavigableSurfaceFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseSelectorResult (copy), UseRegisterFocusNavigableSurfaceResult (copy), FocusNavigableSurfaceIdentifierEnum (upval), UseDeRegisterFocusNavigableSurfaceResult (copy)
		if UseStateResult and UseSelectorResult then
			UseRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
			
			return
		else
			UseDeRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
		end
	end, {
		UseStateResult,
		UseSelectorResult,
		UseRegisterFocusNavigableSurfaceResult,
		UseDeRegisterFocusNavigableSurfaceResult
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.CentralOverlay.OverlayType
	end)
	local config = {
		[OverlayTypeModule.AccountReactivationPrompt] = true,
		[OverlayTypeModule.AccountLockModal] = true
	}
	
	return ReactModule.createElement(v42, CryoModule.Dictionary.join(p1, {
		forwardRef = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, ReactModule.useMemo(function()
			-- upvalues: config (copy), UseSelectorResult1 (copy), InputHandlersModule (upval), UseDispatchResult (copy), CloseCentralOverlayModule (upval)
			return if config[UseSelectorResult1] then nil else InputHandlersModule.onRelease(function(p2)
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval)
				UseDispatchResult(CloseCentralOverlayModule())
				p2:cancel()
			end)
		end, { UseDispatchResult, UseSelectorResult1 }), nil, (ReactFocusNavigationModule.useEventMap(config1, UseStateResult2)))
	}))
end