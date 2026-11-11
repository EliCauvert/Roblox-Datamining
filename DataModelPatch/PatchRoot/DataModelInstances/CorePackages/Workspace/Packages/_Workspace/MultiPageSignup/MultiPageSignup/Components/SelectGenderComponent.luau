local MultiPageSignup = script:FindFirstAncestor("MultiPageSignup")
local Parent = MultiPageSignup.Parent
local AppStorageService = game:GetService("AppStorageService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local AuthSignupModule = require(Parent.AuthSignup)
local SignUpFunction = AuthSignupModule.Thunks.SignUp
local SignUpV2ErrorCodes = AuthSignupModule.Enums.SignUpV2ErrorCodes
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppGuiService = RoactServiceTagsModule.AppGuiService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseShowDisclaimerLinksModule = require(MultiPageSignup.Hooks.useShowDisclaimerLinks)
local FetchSignupUserAgreementsFunction = require(Parent.UserAgreements).FetchSignupUserAgreements
local OpenAccountSwitchingErrorOverlayFunction = require(Parent.AccountSwitcher).OpenAccountSwitchingErrorOverlay
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local ToastType = require(Parent.ToastRodux).Enums.ToastType
local AuthCommonModule = require(Parent.AuthCommon)
local DisclaimerLinks = AuthCommonModule.Components.DisclaimerLinks
local LogoutAllLoggedInUsersFunction = AuthCommonModule.Thunks.LogoutAllLoggedInUsers
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local User = AuthCommonModule.Thunks.User
local AuthLocalStorageKeys = AuthCommonModule.Enums.AuthLocalStorageKeys
local AccountSwitcherConstants = AuthCommonModule.Common.AccountSwitcherConstants
local FetchAndStoreUserAppLaunchInfoFunction = AuthCommonModule.Thunks.FetchAndStoreUserAppLaunchInfo
local LogoutReasonNames = AuthCommonModule.Enums.LogoutReasonNames
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local FullPageActivationFrameworkContext = UserActivationFrameworkModule.Context.FullPageActivationFrameworkContext
local ActivationFrameworkWrapper = UserActivationFrameworkModule.Components.ActivationFrameworkWrapper
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local CallbackStatus = UserActivationFrameworkModule.Enums.CallbackStatus
local UseAttemptNextNavigationFunction = UserActivationFrameworkModule.Hooks.useAttemptNextNavigation
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Button = UIBloxModule.App.Button.Button
local PasskeyErrorAlertModule = require(MultiPageSignup.Components.PasskeyErrorAlert)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local MultiPageSignupConstantsModule = require(MultiPageSignup.Analytics.MultiPageSignupConstants)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableMultiPageSignupV2UpdatesFunction = SharedFlagsModule.GetFFlagEnableMultiPageSignupV2Updates
local FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage = SharedFlagsModule.FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage
local FFlagAddReasonToEveryLogout = SharedFlagsModule.FFlagAddReasonToEveryLogout
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherFoundationDesign
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherRedesignIXP
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseDesignTokensFunction (copy), ReactModule (copy), FullPageActivationFrameworkContext (copy), UseShowDisclaimerLinksModule (copy), UseAttemptNextNavigationFunction (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy), UseDispatchFunction (copy), RoactAnalytics (copy), AppGuiService (copy), UseAppPolicyFunction (copy), PromiseModule (copy), LogoutAllLoggedInUsersFunction (copy), CloseCentralOverlayFunction (copy), AppStorageUtilities (copy), User (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), FFlagAddReasonToEveryLogout (copy), GuiService (copy), LogoutReasonNames (copy), AuthMsgShownFunction (copy), EventStreamConstants (copy), OpenAccountSwitchingErrorOverlayFunction (copy), PayloadKey (copy), SignUpFunction (copy), UseLocalizationFunction (copy), ButtonType (copy), CallbackStatus (copy), ActivationFrameworkWrapper (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (copy), FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage (copy), HttpService (copy), FetchSignupUserAgreementsFunction (copy), CryoModule (copy), FetchAndStoreUserAppLaunchInfoFunction (copy), AuthClientErrorFunction (copy), SignUpV2ErrorCodes (copy), AccountSwitcherConstants (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), DisclaimerLinks (copy), Button (copy), AuthButtonClickFunction (copy), MultiPageSignupConstantsModule (copy), PasskeyErrorAlertModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContext)
	local ActivationFrameworkState = UseContextResult.activationFrameworkState
	local Unknown, Unknown2 = ReactModule.useState("Unknown")
	local UseShowDisclaimerLinksModuleResult = UseShowDisclaimerLinksModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAttemptNextNavigationResult = UseAttemptNextNavigationFunction(p1.navigation)
	local MonoDeps = UseContextResult.monoDeps
	local Inverted = not GetFFlagEnableAccountSwitcherRedesignIXPFunction() or RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AccountSwitcherLayer }, function(p2): boolean
		-- upvalues: AppBtidLayers (upval)
		return (p2[AppBtidLayers.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true
	end)
	local Inverted1 = GetFFlagEnableAccountSwitcherFoundationDesignFunction() and Inverted
	local ResetAppStateFunction = MonoDeps.ResetAppState
	local LogoutFunction = MonoDeps.Logout
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppGuiService)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2
	end)
	
	local function _()
		-- upvalues: UseDispatchResult (copy), ResetAppStateFunction (copy), PromiseModule (upval)
		UseDispatchResult(ResetAppStateFunction())
		
		return PromiseModule.resolve()
	end
	
	local _ = function(p2, p3)
		-- upvalues: LogoutAllLoggedInUsersFunction (upval)
		return LogoutAllLoggedInUsersFunction(p2, p3)
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: UseDispatchResult (copy), LogoutFunction (copy)
		return UseDispatchResult(LogoutFunction(p2, p3, p4))
	end
	
	local function v60()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		return UseDispatchResult(CloseCentralOverlayFunction())
	end
	
	local function v61()
		-- upvalues: AppStorageUtilities (upval), User (upval), UseRoactServiceResult (copy), LogoutAllLoggedInUsersFunction (upval), UseDispatchResult (copy), ResetAppStateFunction (copy), PromiseModule (upval), AppStorageService (upval), AuthLocalStorageKeys (upval), FFlagAddReasonToEveryLogout (upval), GuiService (upval), LogoutReasonNames (upval), LogoutFunction (copy), CloseCentralOverlayFunction (upval)
		local IsNotUserIdMatch = User.fromLocalStorage().userId ~= -1
		LogoutAllLoggedInUsersFunction(UseRoactServiceResult, (AppStorageUtilities.getAccountBlob())):await()
		
		if IsNotUserIdMatch == true then
			UseDispatchResult(ResetAppStateFunction())
			local _ = PromiseModule.resolve()
			AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, "")
			AppStorageService:Flush()
			
			if FFlagAddReasonToEveryLogout then
				local _ = UseDispatchResult(LogoutFunction(UseRoactServiceResult, GuiService, LogoutReasonNames.MultiStepSignupAccountSwitchNotAllowed))
			else
				local _ = UseDispatchResult(LogoutFunction(UseRoactServiceResult, GuiService, nil))
			end
		end
		local _ = UseDispatchResult(CloseCentralOverlayFunction())
	end
	
	local _ = function(p2, p3, p4, p5, p6, p7, p8, p9)
		-- upvalues: AuthMsgShownFunction (upval), p1 (copy), ActivationFrameworkState (copy), EventStreamConstants (upval), UseDispatchResult (copy), OpenAccountSwitchingErrorOverlayFunction (upval)
		AuthMsgShownFunction(p1.namespace, ActivationFrameworkState.currentState, EventStreamConstants.Field.AccountSwitchingErrorModalShown, p8)
		
		return UseDispatchResult(OpenAccountSwitchingErrorOverlayFunction(p2, p3, p4, p5, p6, p7, p8, p9))
	end
	
	local _ = function(p2)
		-- upvalues: ActivationFrameworkState (copy), PayloadKey (upval), SignUpFunction (upval), UseRoactServiceResult (copy), UseRoactServiceResult2 (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy)
		return SignUpFunction(UseRoactServiceResult, nil, UseRoactServiceResult2, UseRoactServiceResult1, UseAppPolicyResult, p2, ActivationFrameworkState.payloadTable[PayloadKey.CredentialsProtocolPasswordRegistrationAvailable] == "true")
	end
	
	local v1 = (tonumber(ActivationFrameworkState.payloadTable[PayloadKey.SignupAge]) or 100) < 13
	local UseLocalizationResult = UseLocalizationFunction({
		genderMale = "Authentication.SignUp.Label.GenderMale",
		genderFemale = "Authentication.SignUp.Label.GenderFemale",
		genderBoy = "Authentication.SignUp.Labely.Boy",
		genderGirl = "Authentication.SignUp.Label.Girl"
	})
	local v2 = (function()
		-- upvalues: ReactModule (upval), ButtonType (upval), Unknown2 (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(ButtonType.Secondary)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(ButtonType.Secondary)
		local UseStateResult3, UseStateResult2_2 = ReactModule.useState(ButtonType.Secondary)
		
		local function changeButtonState(FemaleButtonState, Callback: (any) -> ())
			-- upvalues: UseStateResult2 (copy), ButtonType (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy), Unknown2 (upval)
			UseStateResult2(ButtonType.Secondary)
			UseStateResult2_1(ButtonType.Secondary)
			UseStateResult2_2(ButtonType.Secondary)
			
			if FemaleButtonState == ButtonType.Secondary then
				Callback(ButtonType.PrimarySystem)
				
				return
			else
				Callback(ButtonType.Secondary)
				Unknown2("Unknown")
			end
		end
		
		return {
			maleButtonState = UseStateResult,
			femaleButtonState = UseStateResult1,
			preferNotToSayButtonState = UseStateResult3,
			changeMaleButtonState = function()
				-- upvalues: Unknown2 (upval), changeButtonState (copy), UseStateResult (copy), UseStateResult2 (copy)
				Unknown2("Male")
				changeButtonState(UseStateResult, UseStateResult2)
			end,
			changeFemaleButtonState = function()
				-- upvalues: Unknown2 (upval), changeButtonState (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
				Unknown2("Female")
				changeButtonState(UseStateResult1, UseStateResult2_1)
			end,
			changePreferNotToSayButtonState = function()
				-- upvalues: Unknown2 (upval), changeButtonState (copy), UseStateResult3 (copy), UseStateResult2_2 (copy)
				Unknown2("Unknown")
				changeButtonState(UseStateResult3, UseStateResult2_2)
			end
		}
	end)()
	local config = {
		buttonTextKey = "",
		shouldShowButton = false,
		isButtonEnabled = false,
		onButtonClicked = function()
			-- upvalues: CallbackStatus (upval)
			return {
				payloadAddendum = nil,
				status = CallbackStatus.NeedsReset
			}
		end
	}
	
	return ReactModule.createElement(ActivationFrameworkWrapper, {
		titleTextKey = "Authentication.SignUp.Header.GenderPage6",
		bodyTextKey = "Authentication.SignUp.Description.GenderHelp2",
		headingTextKey = "Authentication.SignUp.Action.CreateAccount",
		shouldExpandMiddleContent = true,
		namespace = p1.namespace,
		primaryButton = {
			shouldShowButton = true,
			isButtonEnabled = true,
			buttonTextKey = if GetFFlagEnableMultiPageSignupV2UpdatesFunction() then "CommonUI.Controls.Action.Done" else "Authentication.SignUp.Action.CreateAccount",
			onButtonClicked = function()
				-- upvalues: ActivationFrameworkState (copy), PayloadKey (upval), FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage (upval), HttpService (upval), FetchSignupUserAgreementsFunction (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), CryoModule (upval), Unknown (copy), SignUpFunction (upval), UseRoactServiceResult2 (copy), UseAppPolicyResult (copy), AppStorageUtilities (upval), User (upval), FetchAndStoreUserAppLaunchInfoFunction (upval), AuthClientErrorFunction (upval), p1 (copy), EventStreamConstants (upval), CallbackStatus (upval), SignUpV2ErrorCodes (upval), UseStateResult2 (copy), Inverted1 (copy), v61 (copy), v60 (copy), AccountSwitcherConstants (upval), AuthMsgShownFunction (upval), UseDispatchResult (copy), OpenAccountSwitchingErrorOverlayFunction (upval), SetCurrentToastMessageFunction (upval), ToastType (upval), UseDesignTokensResult (copy)
				local Payload = ActivationFrameworkState.payloadTable[PayloadKey.SignupAgreedUserAgreements]
				local AgreementIds = nil
				
				if FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage and Payload and #Payload > 0 then
					AgreementIds = HttpService:JSONDecode(Payload)
				else
					local _, v3 = FetchSignupUserAgreementsFunction(UseRoactServiceResult, UseRoactServiceResult1):andThen(function(Result)
						-- upvalues: CryoModule (upval)
						return CryoModule.List.map(Result, function(p2)
							return p2.id
						end)
					end):await()
					AgreementIds = v3
				end
				local v4, v5 = SignUpFunction(UseRoactServiceResult, nil, UseRoactServiceResult2, UseRoactServiceResult1, UseAppPolicyResult, {
					username = ActivationFrameworkState.payloadTable[PayloadKey.SignupUsername],
					birthday = ActivationFrameworkState.payloadTable[PayloadKey.SignupBirthdayTimestampUtc],
					password = ActivationFrameworkState.payloadTable[PayloadKey.SignupPassword],
					gender = Unknown,
					agreementIds = AgreementIds,
					passkeySessionId = ActivationFrameworkState.payloadTable[PayloadKey.SignupPasskeySessionId],
					passkeyRegistrationResponse = ActivationFrameworkState.payloadTable[PayloadKey.SignupPasskeyResult]
				}, ActivationFrameworkState.payloadTable[PayloadKey.CredentialsProtocolPasswordRegistrationAvailable] == "true"):andThen(function(Result)
					-- upvalues: AppStorageUtilities (upval), User (upval), FetchAndStoreUserAppLaunchInfoFunction (upval), UseRoactServiceResult (upval), AuthClientErrorFunction (upval), p1 (upval), EventStreamConstants (upval), CallbackStatus (upval), PayloadKey (upval), Unknown (upval)
					AppStorageUtilities.setAccountBlob(Result.responseBody.accountBlob)
					AppStorageUtilities.setDiscoveryClientFallbackCache("")
					AppStorageUtilities.flush()
					User.clearLocalStorage()
					
					if FetchAndStoreUserAppLaunchInfoFunction(UseRoactServiceResult) then
						return {
							payloadAddendum = { [PayloadKey.SignupGender] = Unknown },
							status = CallbackStatus.Success
						}
					else
						AuthClientErrorFunction(p1.namespace, EventStreamConstants.State.FetchUserInfoError)
						
						return { status = CallbackStatus.PageError }
					end
				end, function(EmptyAccountSwitchBlobRequired)
					-- upvalues: SignUpV2ErrorCodes (upval), UseStateResult2 (upval), CallbackStatus (upval), Inverted1 (upval), v61 (upval), v60 (upval), AccountSwitcherConstants (upval), ActivationFrameworkState (upval), PayloadKey (upval), AuthMsgShownFunction (upval), p1 (upval), EventStreamConstants (upval), UseDispatchResult (upval), OpenAccountSwitchingErrorOverlayFunction (upval), AuthClientErrorFunction (upval), SetCurrentToastMessageFunction (upval), ToastType (upval), UseDesignTokensResult (upval)
					if EmptyAccountSwitchBlobRequired == SignUpV2ErrorCodes.PasskeyRegistrationFailed then
						UseStateResult2(true)
						
						return { status = CallbackStatus.PageError }
					elseif EmptyAccountSwitchBlobRequired == SignUpV2ErrorCodes.EmptyAccountSwitchBlobRequired or EmptyAccountSwitchBlobRequired == SignUpV2ErrorCodes.ParentEmptyAccountSwitchBlobRequired then
						local AuthenticationAccountSwitchHeaderSignOutOtherAccounts: string = if Inverted1 then "Authentication.AccountSwitch.Header.SignOutOtherAccounts" else "Authentication.AccountSwitch.Header.LogoutAllAccounts"
						local AuthenticationAccountSwitchDescriptionContinueSignOutOthers: string = if Inverted1 then "Authentication.AccountSwitch.Description.ContinueSignOutOthers" elseif EmptyAccountSwitchBlobRequired == SignUpV2ErrorCodes.EmptyAccountSwitchBlobRequired then "Authentication.AccountSwitch.Description.LogoutConfirmation" else "Authentication.AccountSwitch.Description.ParentLogoutConfirmation"
						local AuthenticationAccountSwitchActionContinue: string = if Inverted1 then "Authentication.AccountSwitch.Action.Continue" else "Authentication.AccountSwitch.Action.LogoutAllAccounts"
						local AccountSwitcherLoginEmptyBlobRequiredError = if EmptyAccountSwitchBlobRequired == SignUpV2ErrorCodes.EmptyAccountSwitchBlobRequired then AccountSwitcherConstants.AccountSwitcherLoginEmptyBlobRequiredError else AccountSwitcherConstants.AccountSwitcherParentLoginEmptyBlobRequiredError
						local Payload = ActivationFrameworkState.payloadTable[PayloadKey.SignupUsername]
						AuthMsgShownFunction(p1.namespace, ActivationFrameworkState.currentState, EventStreamConstants.Field.AccountSwitchingErrorModalShown, AccountSwitcherLoginEmptyBlobRequiredError)
						local _ = UseDispatchResult(OpenAccountSwitchingErrorOverlayFunction(AuthenticationAccountSwitchHeaderSignOutOtherAccounts, AuthenticationAccountSwitchDescriptionContinueSignOutOthers, AuthenticationAccountSwitchActionContinue, "Authentication.CrossDevice.Action.CancelLogin", v61, v60, AccountSwitcherLoginEmptyBlobRequiredError, Payload))
						
						return { status = CallbackStatus.PageError }
					else
						AuthClientErrorFunction(p1.namespace, EventStreamConstants.State.GenericSignupError .. "," .. tostring(EmptyAccountSwitchBlobRequired))
						UseDispatchResult(SetCurrentToastMessageFunction({
							slideIn = true,
							toastType = ToastType.NetworkingError,
							toastMessage = if EmptyAccountSwitchBlobRequired == SignUpV2ErrorCodes.UnavailableInRegion then "Authentication.SignUp.Description.RobloxNotAvailableInRegion" else "Authentication.Login.Response.SomethingWentWrong",
							toastIconColorStyle = {
								Transparency = 0,
								Color = UseDesignTokensResult.Color.System.Alert.Color3
							}
						}))
						
						return { status = CallbackStatus.PageError }
					end
				end):await()
				
				return if v4 and v5 then v5 else { status = CallbackStatus.PageError }
			end
		},
		navigation = p1.navigation,
		subFooterContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				FillDirection = Enum.FillDirection.Vertical
			}),
			DisclaimerLinks = if UseShowDisclaimerLinksModuleResult then ReactModule.createElement(DisclaimerLinks, {
				ctx = p1.namespace,
				state = ActivationFrameworkState.currentState
			}) else nil
		})
	}, {
		Content = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_400)
			}),
			MaleButton = ReactModule.createElement(Button, {
				layoutOrder = 2,
				buttonType = v2.maleButtonState,
				size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1200),
				text = if GetFFlagEnableMultiPageSignupV2UpdatesFunction() and v1 then UseLocalizationResult.genderBoy else UseLocalizationResult.genderMale,
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), MultiPageSignupConstantsModule (upval), v2 (copy)
					AuthButtonClickFunction(MultiPageSignupConstantsModule.ctx.multiPageSignup, MultiPageSignupConstantsModule.btn.male, MultiPageSignupConstantsModule.state.selectGenderComponent)
					v2.changeMaleButtonState()
				end
			}),
			FemaleButton = ReactModule.createElement(Button, {
				layoutOrder = 3,
				buttonType = v2.femaleButtonState,
				size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1200),
				text = if GetFFlagEnableMultiPageSignupV2UpdatesFunction() and v1 then UseLocalizationResult.genderGirl else UseLocalizationResult.genderFemale,
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), MultiPageSignupConstantsModule (upval), v2 (copy)
					AuthButtonClickFunction(MultiPageSignupConstantsModule.ctx.multiPageSignup, MultiPageSignupConstantsModule.btn.female, MultiPageSignupConstantsModule.state.selectGenderComponent)
					v2.changeFemaleButtonState()
				end
			})
		}),
		ErrorToastContainer = UseStateResult and ReactModule.createElement(PasskeyErrorAlertModule, {
			onActivated = function()
				-- upvalues: UseStateResult2 (copy), UseAttemptNextNavigationResult (copy), config (copy)
				UseStateResult2(false)
				UseAttemptNextNavigationResult(config)
			end
		})
	})
end