local MultiPageSignup = script:FindFirstAncestor("MultiPageSignup")
local Parent = MultiPageSignup.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local AuthCommonModule = require(Parent.AuthCommon)
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local InputValidity = AuthCommonModule.Enums.InputValidity
local DisclaimerLinks = AuthCommonModule.Components.DisclaimerLinks
local GetFFlagEnableSignupFoundationTextFunction = require(Parent.SharedFlags).GetFFlagEnableSignupFoundationText
local Text = require(Parent.Foundation).Text
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local UseShowDisclaimerLinksModule = require(MultiPageSignup.Hooks.useShowDisclaimerLinks)
local AuthSignupModule = require(Parent.AuthSignup)
local AuthTextInputValidator = AuthSignupModule.Components.AuthTextInputValidator
local PasswordValidator = AuthSignupModule.Thunks.PasswordValidator
local PasswordIssue = AuthCommonModule.Enums.PasswordIssue
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local FullPageActivationFrameworkContext = UserActivationFrameworkModule.Context.FullPageActivationFrameworkContext
local ActivationFrameworkWrapper = UserActivationFrameworkModule.Components.ActivationFrameworkWrapper
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local CallbackStatus = UserActivationFrameworkModule.Enums.CallbackStatus
local FStringLuaMultiPageSignupIxpLayer = require(Parent.SharedFlags).FStringLuaMultiPageSignupIxpLayer
local RegisterPreauthPasskeyFunction = AuthCommonModule.Thunks.RegisterPreauthPasskey
local GetCredentialsProtocolAvailabilityModule = require(MultiPageSignup.Utils.getCredentialsProtocolAvailability)
local ValidatorIssuePriorityList = {
	PasswordIssue.Length,
	PasswordIssue.UsernameMatch,
	PasswordIssue.Simple
}
local GetFFlagPasswordErrorSimpleFunction = require(Parent.SharedFlags).GetFFlagPasswordErrorSimple
local ValidatorIssueMessageList = {
	[PasswordIssue.Length] = if require(Parent.SharedFlags).GetFFlagPasswordErrorLength() then "Authentication.SignUp.Label.PasswordErrorLengthNew" else "Authentication.SignUp.Label.NewPasswordError1",
	[PasswordIssue.UsernameMatch] = "Authentication.SignUp.Label.NewPasswordError2",
	[PasswordIssue.Simple] = if GetFFlagPasswordErrorSimpleFunction() then "Authentication.SignUp.Label.PasswordErrorSimple" else "Authentication.SignUp.Label.NewPasswordError3"
}

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), FullPageActivationFrameworkContext (copy), InputValidity (copy), UseDesignTokensFunction (copy), UseStyleFunction (copy), UseShowDisclaimerLinksModule (copy), RoactAppExperimentModule (copy), FStringLuaMultiPageSignupIxpLayer (copy), PayloadKey (copy), AppStorageUtilities (copy), GetCredentialsProtocolAvailabilityModule (copy), UseLocalizationFunction (copy), ActivationFrameworkWrapper (copy), CallbackStatus (copy), RegisterPreauthPasskeyFunction (copy), AuthModalShownFunction (copy), EventStreamConstants (copy), AuthClientErrorFunction (copy), DisclaimerLinks (copy), GetFFlagEnableSignupFoundationTextFunction (copy), Text (copy), StyledTextLabel (copy), AuthTextInputValidator (copy), PasswordValidator (copy), ValidatorIssuePriorityList (copy), ValidatorIssueMessageList (copy), AuthFormInteractionFunction (copy), AuthMsgShownFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContext)
	local ActivationFrameworkState = UseContextResult.activationFrameworkState
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(InputValidity.Unvalidated)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local UseShowDisclaimerLinksModuleResult = UseShowDisclaimerLinksModule()
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState("")
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ FStringLuaMultiPageSignupIxpLayer }, function(p2)
		-- upvalues: FStringLuaMultiPageSignupIxpLayer (upval)
		local v1 = p2[FStringLuaMultiPageSignupIxpLayer] or {}
		
		return {
			shouldShowPasskeyOnMultiPageSignup = v1.shouldShowPasskeyOnMultiPageSignup or false,
			shouldAwaitPasswordRegistrationOnMultiPageSignup = v1.shouldAwaitPasswordRegistrationOnMultiPageSignup or false,
			shouldShowCreateAccountHeaderOnMultiPageSignup = v1.shouldShowCreateAccountHeaderOnMultiPageSignup or false,
			shouldPromptPasskey = v1.shouldPromptPasskey or false
		}
	end)
	ReactModule.useEffect(function()
		-- upvalues: ActivationFrameworkState (copy), PayloadKey (upval), UseStateResult2_6 (copy), AppStorageUtilities (upval)
		if ActivationFrameworkState.payloadTable and ActivationFrameworkState.payloadTable[PayloadKey.SignupUsername] then
			UseStateResult2_6(ActivationFrameworkState.payloadTable[PayloadKey.SignupUsername])
			
			return
		else
			UseStateResult2_6(AppStorageUtilities.getIncompleteSignupUsername())
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current and UseRefResult.current.focus then
			UseRefResult.current.focus()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult4 (copy), InputValidity (upval)
		UseStateResult2(UseStateResult4 == InputValidity.Valid)
	end, { UseStateResult4 })
	ReactModule.useEffect(function()
		-- upvalues: ActivationFrameworkState (copy), GetCredentialsProtocolAvailabilityModule (upval), p1 (copy), UseContextResult (copy), UseStateResult2_5 (copy), UseStateResult2_4 (copy)
		if ActivationFrameworkState.payloadTable then
			local CredentialsProtocolAvailabilityModule, CredentialsProtocolAvailabilityModule2, _ = GetCredentialsProtocolAvailabilityModule(ActivationFrameworkState.payloadTable, p1.namespace, UseContextResult.dispatch)
			UseStateResult2_5(CredentialsProtocolAvailabilityModule)
			UseStateResult2_4(CredentialsProtocolAvailabilityModule2)
			
			return
		end
	end, {})
	
	local function OnTextChanged(p2, p3)
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseStateResult2_2(p2)
		UseStateResult2_3(p3)
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		passwordLabel = "Authentication.Login.Label.Password",
		passwordPlaceholder = "Authentication.SignUp.Label.Use8CharPassword"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseBrowserTrackerExperimentResult (copy), UseStateResult6 (copy)
		return UseBrowserTrackerExperimentResult.shouldShowPasskeyOnMultiPageSignup and UseStateResult6
	end, {
		UseBrowserTrackerExperimentResult.shouldShowPasskeyOnMultiPageSignup,
		UseStateResult6
	})
	
	return ReactModule.createElement(ActivationFrameworkWrapper, {
		bodyTextKey = "Authentication.SignUp.Description.ThisKeepYourAccountSecure",
		headingTextKey = "Authentication.SignUp.Action.CreateAccount",
		namespace = p1.namespace,
		titleTextKey = {
			if UseResult() then "Authentication.SignUp.Header.CreatePasswordOrPasskey" else "Authentication.SignUp.Header.CreatePassword",
			username = "@" .. UseStateResult7
		},
		primaryButton = {
			buttonTextKey = "Authentication.SignUp.Action.NextWord",
			shouldShowButton = true,
			isButtonEnabled = UseStateResult,
			onButtonClicked = function()
				-- upvalues: PayloadKey (upval), UseStateResult3 (copy), UseStateResult5 (copy), CallbackStatus (upval)
				return {
					payloadAddendum = {
						[PayloadKey.SignupPassword] = UseStateResult3,
						[PayloadKey.CredentialsProtocolPasswordRegistrationAvailable] = tostring(UseStateResult5),
						[PayloadKey.SignupPasskeySessionId] = "",
						[PayloadKey.SignupPasskeyResult] = ""
					},
					status = CallbackStatus.Success
				}
			end
		},
		secondaryButton = {
			buttonTextKey = "Authentication.SignUp.Action.CreateAPasskey",
			icon = "icons/menu/passkey",
			shouldShowButton = UseResult(),
			isButtonEnabled = UseStateResult6 and UseStateResult1,
			onButtonClicked = function()
				-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), RegisterPreauthPasskeyFunction (upval), UseRoactServiceResult (copy), UseStateResult7 (copy), AuthModalShownFunction (upval), EventStreamConstants (upval), PayloadKey (upval), CallbackStatus (upval), AuthClientErrorFunction (upval), UseStateResult4 (copy), InputValidity (upval)
				UseStateResult2(false)
				UseStateResult2_1(false)
				local _, v1 = RegisterPreauthPasskeyFunction(UseRoactServiceResult, UseStateResult7):andThen(function(Result)
					-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), PayloadKey (upval), CallbackStatus (upval)
					if Result then
						AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, EventStreamConstants.State.Success)
						
						return {
							payloadAddendum = {
								[PayloadKey.SignupPasskeySessionId] = Result.sessionId,
								[PayloadKey.SignupPasskeyResult] = Result.result,
								[PayloadKey.SignupPassword] = ""
							},
							status = CallbackStatus.Success
						}
					else
						AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, EventStreamConstants.State.Unknown)
						
						return { payloadAddendum = nil, status = CallbackStatus.PageError }
					end
				end, function(p2)
					-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), AuthClientErrorFunction (upval), CallbackStatus (upval)
					if p2.name then
						AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, p2.name)
						
						if type(p2.body) == "string" then
							AuthClientErrorFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, p2.body, p2.source)
						end
					else
						AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, EventStreamConstants.State.Unknown)
					end
					return { payloadAddendum = nil, status = CallbackStatus.PageError }
				end):await()
				UseStateResult2(UseStateResult4 == InputValidity.Valid)
				UseStateResult2_1(true)
				
				return v1
			end
		},
		shouldShowButtonDivider = UseResult(),
		navigation = p1.navigation,
		subFooterContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			Size = UDim2.new(1, 0, 1, 0)
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
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
			}),
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_50)
			}),
			PasswordInputLabel = if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-body-small auto-xy",
				Text = UseLocalizationResult.passwordLabel
			}) else ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				text = UseLocalizationResult.passwordLabel,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextDefault,
				automaticSize = Enum.AutomaticSize.XY
			}),
			PasswordLabelSpacing = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
			}),
			PasswordField = ReactModule.createElement(AuthTextInputValidator, {
				layoutOrder = 3,
				textInputType = Enum.TextInputType.Password,
				placeholder = UseLocalizationResult.passwordPlaceholder,
				validator = PasswordValidator,
				validatorAdditionalProps = { username = UseStateResult7 },
				validatorIssuePriorityList = ValidatorIssuePriorityList,
				validatorIssueMessageList = ValidatorIssueMessageList,
				onTextChanged = OnTextChanged,
				onTextFocusedGained = function()
					-- upvalues: AuthFormInteractionFunction (upval), UseContextResult (copy), EventStreamConstants (upval)
					AuthFormInteractionFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Field.Password, UseContextResult.activationFrameworkState.currentState, nil, true)
				end,
				onErrorShown = function(p2)
					-- upvalues: AuthMsgShownFunction (upval), p1 (copy), ActivationFrameworkState (copy), EventStreamConstants (upval)
					AuthMsgShownFunction(p1.namespace, ActivationFrameworkState.currentState, EventStreamConstants.Field.Password, p2)
				end,
				textBoxRef = UseRefResult
			})
		})
	})
end