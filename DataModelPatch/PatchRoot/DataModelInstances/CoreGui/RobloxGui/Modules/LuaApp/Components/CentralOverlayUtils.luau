local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local _ = require(CorePackages.Packages.React)
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local GetFFlagEnableConfirmSignOutV2Module = require(Modules.LuaApp.Flags.GetFFlagEnableConfirmSignOutV2)
local GetFFlagEnableLoginAccountSelectorModule = require(Modules.LuaApp.Flags.GetFFlagEnableLoginAccountSelector)
local GetFFlagEnableOtpEmailLoginModule = require(Modules.LuaApp.Flags.GetFFlagEnableOtpEmailLogin)
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local GetFFlagLuaAppAccountSecurityPromptEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled)
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableVNGNewAppAvailableModalModule = require(Modules.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign
local FFlagEnableKoreaKISAComplianceModule = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
local GetFFlagUseUpdatedVNGAgreementsWorkflowFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow
local FFlagLuaAppHomeVngAppUpsell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local GetFFlagEnableReminderOfNormsABTestFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest
local GetFFlagEnableInAppBugReportingFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting
local FFlagEnableAbuseReportRevampFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow
local FFlagEnableMagicLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMagicLogin
local FFlagAXWearTimeSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXWearTimeSupport
local FFlagLuaAppsServerTriggeredModals = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsServerTriggeredModals
local FFlagEnableUnifiedProductPurchaseFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableSignUpExitModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSignUpExitModal
local FFlagEnableSystemTrayModals = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSystemTrayModals
local FFlagLuaAppEnableWhyThisAdModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppPlayButtonUpsellLinking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking
local FFlagEnableSduiV2HomepagePrompts = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local FFlagPromptsHandlerEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPromptsHandlerEnabled
local FFlagSduiExperienceDetailsSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagLuaAppTextFeedbackFormModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppTextFeedbackFormModal

return {
	OverlayComponent = {
		[OverlayTypeModule.VerifyPhoneNumber] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.VerifyPhoneNumber)
		end),
		[OverlayTypeModule.VerifiedEnableVoice] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Verification.IdentityVerification.VerifiedEnableVoiceModal)
		end),
		[OverlayTypeModule.UserAgreementsUpdatedPopup] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.UserAgreement.UserAgreementsUpdatedPopup)
		end),
		[OverlayTypeModule.VNGUserAgreementsPopup] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.UserAgreement.VNGUserAgreementsPopup)
		end),
		[OverlayTypeModule.UserAgreementsSecondPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.Luobu.Components.Authentication.UserAgreementsSecondPrompt)
		end),
		[OverlayTypeModule.UserAgreementsPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.Luobu.Components.Authentication.UserAgreementsPrompt)
		end),
		[OverlayTypeModule.TencentNoticePopup] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.Luobu.Components.TencentNoticePopup.TencentNoticePopup)
		end),
		[OverlayTypeModule.SimpleTextAlertPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.Luobu.Components.Authentication.SimpleTextAlertPrompt)
		end),
		[OverlayTypeModule.SignUpBirthdayPickerOverlay] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.SignUpBirthdayPickerOverlay)
		end),
		[OverlayTypeModule.PurchaseGameRobuxShortfall] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.GameDetails.PurchaseGameRobuxShortfallPrompt)
		end),
		[OverlayTypeModule.PurchaseGame] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.GameDetails.PurchaseGamePrompt)
		end),
		[OverlayTypeModule.PlacesList] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Home.PlacesListContextualMenu)
		end),
		[OverlayTypeModule.PeopleList] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Home.PeopleListContextualMenuFn)
		end),
		[OverlayTypeModule.LoginPasswordResetPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.PasswordResetPrompt)
		end),
		[OverlayTypeModule.LoginEmailVerificationPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.LoginEmailVerificationPrompt)
		end),
		[OverlayTypeModule.UpdateRequiredPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.UpdateRequiredPrompt)
		end),
		[OverlayTypeModule.LeaveRobloxAlert] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.GameDetails.LeaveRobloxAlert)
		end),
		[OverlayTypeModule.ReportLogsOverlay] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.More.ReportLogsOverlay)
		end),
		[OverlayTypeModule.GameDetailsPlayWithFriends] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsContextualMenu)
		end),
		[OverlayTypeModule.GameDetailMore] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.GameDetails.GameDetailMoreContextualMenu)
		end),
		[OverlayTypeModule.GameDetailsSquad] = if GetFFlagIsSquadEnabledFunction() then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.GameDetails.GameDetailsSquadContextualMenu)
		end) else nil,
		[OverlayTypeModule.ExperienceGuidelinesExplained] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesExplained)
		end),
		[OverlayTypeModule.FindFriendsModal] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.ContactImporter.api).FindFriendsModal
		end),
		[OverlayTypeModule.EmailVerificationUpsellOverlay] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.VerificationUpsell.EmailVerificationUpsellOverlay)
		end),
		[OverlayTypeModule.PhoneVerificationUpsellOverlay] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.PhoneUpsell).PhoneVerificationUpsellOverlay
		end),
		[OverlayTypeModule.PhoneVerificationUpsellOverlayWrapper] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.PhoneUpsell).PhoneVerificationUpsellOverlayWrapper
		end),
		[OverlayTypeModule.VoicePhoneVerificationUpsellOverlayWrapper] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.PhoneUpsell).VoicePhoneVerificationUpsellOverlayWrapper
		end),
		[OverlayTypeModule.DevSubMore] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DevSubMoreMenu)
		end),
		[OverlayTypeModule.DevSubConfirmCancel] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DevSubConfirmCancelPrompt)
		end),
		[OverlayTypeModule.CrossDeviceLoginConfirmation] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginConfirmationPrompt)
		end),
		[OverlayTypeModule.CrossDeviceCodePrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt)
		end),
		[OverlayTypeModule.ContactsList] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.ContactImporter.api).ContactsList
		end),
		[OverlayTypeModule.ConfirmSignOut] = CreateLazyComponentFunction(function()
			-- upvalues: GetFFlagEnableConfirmSignOutV2Module (copy), Modules (copy)
			return if GetFFlagEnableConfirmSignOutV2Module() then require(Modules.LuaApp.Components.Authentication.ConfirmSignOutV2) else require(Modules.LuaApp.Components.Authentication.ConfirmSignOut)
		end),
		[OverlayTypeModule.CameraPermissionPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.CameraPermissionPrompt)
		end),
		[OverlayTypeModule.AgreeToPhoneNumberVerification] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.AgreeToPhoneNumberVerification)
		end),
		[OverlayTypeModule.AccountAuthenticationFailureOverlay] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.AccountAuthenticationFailureOverlay)
		end),
		[OverlayTypeModule.PurchasePass] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Passes.PurchasePassPrompt)
		end),
		[OverlayTypeModule.PurchasePassInsufficientRobux] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Passes.PurchasePassInsufficientRobuxPrompt)
		end),
		[OverlayTypeModule.PurchaseDeveloperProduct] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductPrompt)
		end),
		[OverlayTypeModule.PurchaseDeveloperProductInsufficientRobux] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductInsufficientRobuxPrompt)
		end),
		[OverlayTypeModule.PurchaseDeveloperProductPendingProductsLimitExceeded] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductPendingProductsLimitExceededPrompt)
		end),
		[OverlayTypeModule.PurchaseDeveloperProductSuccess] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DeveloperProduct.PurchaseDeveloperProductSuccessPrompt)
		end),
		[OverlayTypeModule.AccountSecurityPromptOverlay] = if GetFFlagLuaAppAccountSecurityPromptEnabledModule() then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.AccountSecurity.PromptOverlay)
		end) else nil,
		[OverlayTypeModule.DiscoverabilityUpsell] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.DiscoverabilityModal.api).DiscoverabilityOverlay
		end),
		[OverlayTypeModule.SurveyPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.OnPlatformSurveys.SurveyPrompt)
		end),
		[OverlayTypeModule.PlayerContextualMenu] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.PlayerContextualMenu).Component
		end),
		[OverlayTypeModule.GamepadDisconnected] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectedModal
		end),
		[OverlayTypeModule.IapExperienceAnimator] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.IAPExperience).Animator
		end),
		[OverlayTypeModule.AccountSelector] = if GetFFlagEnableLoginAccountSelectorModule() then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AccountSelector).AccountSelectorOverlay
		end) else nil,
		[OverlayTypeModule.AccountSwitcher] = if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AccountSelector).AccountSwitchingSelectAccount
		end) else nil,
		[OverlayTypeModule.EmailOtp] = if GetFFlagEnableOtpEmailLoginModule() then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.OtpLogin).EmailOtpOverlay
		end) else nil,
		[OverlayTypeModule.VngContactInfoFormWebviewPopup] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Vng.VngContactInfoFormWebviewPopup)
		end),
		[OverlayTypeModule.NewAppAvailableModal] = if GetFFlagEnableVNGNewAppAvailableModalModule() then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Authentication.NewAppAvailableInteractiveAlert)
		end) else nil,
		[OverlayTypeModule.AccountSwitchingErrorOverlay] = if FFlagEnableLuaAccountSwitchModule then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AccountSwitching).AccountSwitchingErrorOverlay
		end) else nil,
		[OverlayTypeModule.CloseOnlyInteractiveAlert] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AppBlox).CloseOnlyInteractiveAlert
		end),
		[OverlayTypeModule.ConfirmationDialog] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AppBlox).ConfirmationDialog
		end),
		[OverlayTypeModule.UpsellModal] = if FFlagLuaAppPlayButtonUpsellLinking then nil else CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AppBlox).UpsellModal
		end),
		[OverlayTypeModule.PlayButtonUpsellDialog] = if FFlagLuaAppPlayButtonUpsellLinking then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonUpsellDialog
		end) else nil,
		[OverlayTypeModule.SquadPrompt] = if GetFFlagIsSquadEnabledFunction() then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.SquadsCore.Components).SquadPrompt
		end) else nil,
		[OverlayTypeModule.VngComplianceLoadingPopup] = if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Vng.VngComplianceLoadingPopup)
		end) else nil,
		[OverlayTypeModule.KISAPopUpAgreements] = if FFlagEnableKoreaKISAComplianceModule then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AuthCompliance).KISAPopUpAgreements
		end) else nil,
		[OverlayTypeModule.ItemsReceivedAlert] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.ItemsReceivedAlert).ItemsReceivedAlert
		end),
		[OverlayTypeModule.VngAppUpsell] = if FFlagLuaAppHomeVngAppUpsell then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.Personalization.Home.VngAppUpsell.VngAppUpsellOverlay)
		end) else nil,
		[OverlayTypeModule.SearchPageOverlay] = if FFlagSearchOmniAutocompletePage then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.Personalization.Search.SearchPageOverlay)
		end) else nil,
		[OverlayTypeModule.GamePlayerFeedbackForm] = if GetFFlagEdpPlayerFeedbackEnabledFunction() then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.PlayerFeedback).GamePlayerFeedbackFormModal
		end) else nil,
		[OverlayTypeModule.ReminderOfNormsPopup] = if GetFFlagEnableReminderOfNormsABTestFunction() then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Moderation.ReminderOfNormsPopup)
		end) else nil,
		[OverlayTypeModule.GameFilterMenuDropdown] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.GameFilters).FilterMenuDropdown
		end),
		[OverlayTypeModule.SettingsPermissionInteractiveAlert] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.SocialCommon).Components.SettingsPermissionInteractiveAlert
		end),
		[OverlayTypeModule.BugReporter] = if GetFFlagEnableInAppBugReportingFunction() then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.BugReporting).BugReporterModalContainer
		end) else nil,
		[OverlayTypeModule.InAppIntervention] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.InAppIntervention).InAppInterventionContainer
		end),
		[OverlayTypeModule.DynamicAbuseReport] = if FFlagEnableAbuseReportRevampFlow then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.GenericAbuseReporting.DynamicReportContainer)
		end) else nil,
		[OverlayTypeModule.AccountReactivationPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.NotApprovedPage).AccountReactivationPrompt
		end),
		[OverlayTypeModule.MagicLoginApprovePopup] = if FFlagEnableMagicLogin then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.LoginV2.Components).MagicLoginApprovePopup
		end) else nil,
		[OverlayTypeModule.MagicLoginRequestPopup] = if FFlagEnableMagicLogin then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.LoginV2.Components).MagicLoginRequestPopup
		end) else nil,
		[OverlayTypeModule.DeviceSelectorPeekView] = if FFlagEnableMagicLogin then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.LoginV2.Components).DeviceSelectorPeekView
		end) else nil,
		[OverlayTypeModule.AccountLinkingAlert] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AuthCommon).Components.AccountLinkingAlert
		end),
		[OverlayTypeModule.CheckboxFeedbackFormModal] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AppBlox).CheckboxFeedbackFormModal
		end),
		[OverlayTypeModule.TextFeedbackFormModal] = if FFlagLuaAppTextFeedbackFormModal then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AppBlox).TextFeedbackFormModal
		end) else nil,
		[OverlayTypeModule.ProvideFeedbackToast] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AppBlox).ProvideFeedbackToast
		end),
		[OverlayTypeModule.WearTimeInfoModal] = if FFlagAXWearTimeSupport then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AvatarExperienceTimedOptions).WearTimeInfoModal
		end) else nil,
		[OverlayTypeModule.EconomicRestrictionPrompt] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.Fraud.EconomicRestrictionPrompt)
		end),
		[OverlayTypeModule.UnifiedProductPurchaseModal] = if FFlagEnableUnifiedProductPurchaseFlow then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.PurchasePrompt).UnifiedPurchasePromptContainer
		end) else nil,
		[OverlayTypeModule.AccountLockModal] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AccountLockModal).AccountLockModal
		end),
		[OverlayTypeModule.SduiModal] = if FFlagLuaAppsServerTriggeredModals then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.ServerTriggeredModals).SduiModal
		end) else nil,
		[OverlayTypeModule.SduiPromptModal] = if FFlagEnableSduiV2HomepagePrompts or FFlagPromptsHandlerEnabled then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.ServerTriggeredModals).PromptsContainer
		end) else nil,
		[OverlayTypeModule.SduiOverlay] = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.SduiSharedUtilities).SduiOverlayEntryPoint
		end) else nil,
		[OverlayTypeModule.SignUpExitModal] = if FFlagEnableSignUpExitModal then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.AuthSignup).Components.SignUpExitModal
		end) else nil,
		[OverlayTypeModule.SocialUpsellOverlay] = CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.SocialUpsell).InAppSocialUpsellOverlayWrapper
		end),
		[OverlayTypeModule.NotificationsModal] = if FFlagEnableSystemTrayModals then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.NotificationsModal)
		end) else nil,
		[OverlayTypeModule.SystemTrayModal] = if FFlagEnableSystemTrayModals then CreateLazyComponentFunction(function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.SystemTrayModal)
		end) else nil,
		[OverlayTypeModule.WhyThisAdModal] = if FFlagLuaAppEnableWhyThisAdModal then CreateLazyComponentFunction(function()
			-- upvalues: CorePackages (copy)
			return require(CorePackages.Workspace.Packages.SponsoredTiles).WhyThisAdModal
		end) else nil
	}
}