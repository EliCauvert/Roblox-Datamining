local MultiPageSignup = script:FindFirstAncestor("MultiPageSignup")
local Parent = MultiPageSignup.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DebounceModule = require(MultiPageSignup.Utils.debounce)
local UseShowDisclaimerLinksModule = require(MultiPageSignup.Hooks.useShowDisclaimerLinks)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local PillGroup = UIBloxModule.App.Control.PillGroup
local GetFFlagEnableSignupFoundationTextFunction = require(Parent.SharedFlags).GetFFlagEnableSignupFoundationText
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local ActivationFrameworkWrapper = UserActivationFrameworkModule.Components.ActivationFrameworkWrapper
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local FullPageActivationFrameworkContext = UserActivationFrameworkModule.Context.FullPageActivationFrameworkContext
local CallbackStatus = UserActivationFrameworkModule.Enums.CallbackStatus
local AuthSignupModule = require(Parent.AuthSignup)
local UsernameValidator = AuthSignupModule.Thunks.UsernameValidator
local UsernameSuggestor = AuthSignupModule.Thunks.UsernameSuggestor
local UsernameSuggestionScrollView = AuthSignupModule.Components.UsernameSuggestionScrollView
local CleanUsernameForSuggestionsModule = require(MultiPageSignup.Utils.cleanUsernameForSuggestions)
local AuthCommonModule = require(Parent.AuthCommon)
local UsernameValidationContext = AuthCommonModule.Enums.UsernameValidationContext
local UsernameIssue = AuthCommonModule.Enums.UsernameIssue
local IssueCondition = AuthCommonModule.Enums.IssueCondition
local DisclaimerLinks = AuthCommonModule.Components.DisclaimerLinks
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local SharedFlagsModule = require(Parent.SharedFlags)
local UseFoundationUsernameSuggestion = game:DefineFastFlag("UseFoundationUsernameSuggestion", false)
local GetFFlagEnableMultiPageSignupV2UpdatesFunction = SharedFlagsModule.GetFFlagEnableMultiPageSignupV2Updates
local RegisterPreauthPasskeyFunction = AuthCommonModule.Thunks.RegisterPreauthPasskey
local GetCredentialsProtocolAvailabilityModule = require(MultiPageSignup.Utils.getCredentialsProtocolAvailability)
local PromiseModule = require(Parent.Promise)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local FStringLuaMultiPageSignupIxpLayer = SharedFlagsModule.FStringLuaMultiPageSignupIxpLayer
local HideMultipageUsernameAutofillSignupExperiment2 = game:DefineFastFlag("HideMultipageUsernameAutofillSignupExperiment2", false)
local list = {
	UsernameIssue.LengthTooShortOrTooLong, UsernameIssue.ContainsInvalidCharacter,
	UsernameIssue.MultipleUnderscores, UsernameIssue.BoundingUnderscore,
	UsernameIssue.Inappropriate, UsernameIssue.AlreadyInUse,
	UsernameIssue.ContainsPII
}
local config = {
	[UsernameIssue.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.Error.UsernameLengthTooShortOrTooLong",
	[UsernameIssue.ContainsInvalidCharacter] = "Authentication.SignUp.Label.Error.UsernameContainsInvalidCharacter",
	[UsernameIssue.MultipleUnderscores] = "Authentication.SignUp.Label.Error.UsernameContainsMultipleUnderscores",
	[UsernameIssue.BoundingUnderscore] = "Authentication.SignUp.Label.Error.UsernameContainsBoundingUnderscore",
	[UsernameIssue.Inappropriate] = "Authentication.SignUp.Label.Error.UsernameInappropriate",
	[UsernameIssue.AlreadyInUse] = "Authentication.SignUp.Label.Error.UsernameAlreadyInUse",
	[UsernameIssue.ContainsPII] = "Authentication.SignUp.Label.Error.UsernameContainsPII"
}
game:DefineFastInt("DefaultUsernameDebounceMs", 700)

return function(p1)
	-- upvalues: ReactModule (copy), FullPageActivationFrameworkContext (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAppExperimentModule (copy), FStringLuaMultiPageSignupIxpLayer (copy), UsernameValidator (copy), UseShowDisclaimerLinksModule (copy), PayloadKey (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (copy), DebounceModule (copy), list (copy), IssueCondition (copy), UsernameValidationContext (copy), CleanUsernameForSuggestionsModule (copy), UsernameSuggestor (copy), AuthMsgShownFunction (copy), EventStreamConstants (copy), UseLocalizationFunction (copy), config (copy), GetFFlagEnableSignupFoundationTextFunction (copy), Text (copy), StyledTextLabel (copy), UseFoundationUsernameSuggestion (copy), UsernameSuggestionScrollView (copy), AuthButtonClickFunction (copy), PillGroup (copy), RegisterPreauthPasskeyFunction (copy), AuthModalShownFunction (copy), AuthClientErrorFunction (copy), PromiseModule (copy), GetCredentialsProtocolAvailabilityModule (copy), HideMultipageUsernameAutofillSignupExperiment2 (copy), ActivationFrameworkWrapper (copy), CallbackStatus (copy), DisclaimerLinks (copy), TextInput (copy)
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContext)
	local ActivationFrameworkState = UseContextResult.activationFrameworkState
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ FStringLuaMultiPageSignupIxpLayer }, function(p2)
		-- upvalues: FStringLuaMultiPageSignupIxpLayer (upval)
		local v1 = p2[FStringLuaMultiPageSignupIxpLayer] or {}
		
		return {
			shouldMultipageDisableUsernameAutofill = v1.shouldMultipageDisableUsernameAutofill or false,
			shouldCleanUsernameSuggestionInput = v1.shouldCleanUsernameSuggestionInput or false,
			shouldDisableClearingUsernameSuggestions = v1.shouldDisableClearingUsernameSuggestions or false,
			shouldPromptPasskey = v1.shouldPromptPasskey or false
		}
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(game:GetFastInt("DefaultUsernameDebounceMs") / 1000)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UsernameValidator.getDefaultIssues())
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState({})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseShowDisclaimerLinksModuleResult = UseShowDisclaimerLinksModule()
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(false)
	local Payload = ActivationFrameworkState.payloadTable[PayloadKey.SignupBirthdayTimestampUtc]
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current and UseRefResult.current.focus then
			UseRefResult.current.focus()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseStateResult6 (copy), UseRefResult (copy), UseStateResult2_5 (copy)
		if GetFFlagEnableMultiPageSignupV2UpdatesFunction() and UseStateResult6 then
			if UseRefResult.current and UseRefResult.current.focus then
				UseRefResult.current.focus()
			end
			UseStateResult2_5(false)
		end
	end, { UseStateResult6 })
	local UseResult = ReactModule.useCallback(DebounceModule(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, UseStateResult1), { UseStateResult2, UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: list (upval), UseStateResult3 (copy), IssueCondition (upval)
		local v1 = nil
		
		for _, value in ipairs(list) do
			if UseStateResult3[value] == IssueCondition.Problematic then
				v1 = value
				
				return v1
			end
		end
		return v1
	end, { UseStateResult3 })
	
	local function _()
		-- upvalues: UseDispatchResult (copy), UsernameValidator (upval), UseRoactServiceResult (copy), UseStateResult (copy), UseStateResult3 (copy), Payload (copy), UsernameValidationContext (upval)
		return UseDispatchResult(UsernameValidator.validateFunction(UseRoactServiceResult, UseStateResult, UseStateResult3, {
			birthday = Payload,
			context = UsernameValidationContext.Signup
		}))
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseBrowserTrackerExperimentResult (copy), CleanUsernameForSuggestionsModule (upval), UseStateResult (copy), UsernameSuggestor (upval), UseRoactServiceResult (copy), Payload (copy), UsernameValidationContext (upval), UseStateResult2_3 (copy)
		UsernameSuggestor.suggestUsernames(UseRoactServiceResult, if UseBrowserTrackerExperimentResult.shouldCleanUsernameSuggestionInput then CleanUsernameForSuggestionsModule(UseStateResult) else UseStateResult, Payload, UsernameValidationContext.Signup):andThen(function(Result)
			-- upvalues: UseBrowserTrackerExperimentResult (upval), UseStateResult2_3 (upval)
			if UseBrowserTrackerExperimentResult.shouldDisableClearingUsernameSuggestions then
				if #Result.suggestions > 0 then
					UseStateResult2_3(Result.suggestions)
					
					return
				end
			elseif Result.shouldUpdateState then
				UseStateResult2_3(Result.suggestions)
			end
		end)
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), UseStateResult5 (copy), UseStateResult (copy), AuthMsgShownFunction (upval), p1 (copy), ActivationFrameworkState (copy), EventStreamConstants (upval)
		local Text = tostring(UseResult1())
		
		if Text and UseStateResult5 and #UseStateResult > 0 then
			AuthMsgShownFunction(p1.namespace, ActivationFrameworkState.currentState, EventStreamConstants.Field.Username, Text)
		end
	end, { UseStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), UsernameValidator (upval), UseRoactServiceResult (copy), UseStateResult (copy), UseStateResult3 (copy), Payload (copy), UsernameValidationContext (upval), UseStateResult2_2 (copy), UseStateResult2_4 (copy), UseStateResult2_1 (copy)
		UseDispatchResult(UsernameValidator.validateFunction(UseRoactServiceResult, UseStateResult, UseStateResult3, {
			birthday = Payload,
			context = UsernameValidationContext.Signup
		})):andThen(function(Result)
			-- upvalues: UseStateResult2_2 (upval), UseStateResult2_4 (upval), UseStateResult (upval), UseStateResult2_1 (upval)
			UseStateResult2_2(Result.IssueCondition)
			UseStateResult2_4(#UseStateResult > 0)
			
			if Result.InputValid then
				UseStateResult2_1(0.2)
			end
		end)
	end, { UseStateResult })
	local UseResultResult = UseResult1()
	local HasError: boolean = UseResultResult and (UseStateResult5 and #UseStateResult > 0)
	local v2: boolean = HasError and #UseStateResult4 > 0
	local UseLocalizationResult = UseLocalizationFunction({
		username = "Authentication.Login.Label.Username",
		usernameSuggestionHeaderText = "Authentication.SignUp.Label.MaybeTryOneOfThese",
		noRealNamePlaceholderText = "Authentication.SignUp.Message.Username.NoRealNameUse",
		usernameRule1 = "Authentication.SignUp.Description.UsernameRule1",
		usernameRule2 = "Authentication.SignUp.Description.UsernameRule2",
		errorText = UseResultResult and config[UseResultResult]
	})
	
	local function v71(LayoutOrder)
		-- upvalues: GetFFlagEnableSignupFoundationTextFunction (upval), ReactModule (upval), Text (upval), HasError (copy), UseLocalizationResult (copy), UseStyleResult (copy), StyledTextLabel (upval), UseDesignTokensResult (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
		}, {
			if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				TextWrapped = true,
				tag = "text-body-small auto-xy",
				Text = if HasError then UseLocalizationResult.errorText else "",
				textStyle = {
					Color3 = UseStyleResult.Theme.Alert.Color,
					Transparency = UseStyleResult.Theme.Alert.Transparency
				}
			}) else ReactModule.createElement(StyledTextLabel, {
				textWrapped = true,
				text = if HasError then UseLocalizationResult.errorText else "",
				fontStyle = UseStyleResult.Font.BodySmall,
				colorStyle = UseStyleResult.Theme.Alert,
				automaticSize = Enum.AutomaticSize.XY
			})
		})
	end
	
	local function v72(LayoutOrder)
		-- upvalues: UseFoundationUsernameSuggestion (upval), ReactModule (upval), UsernameSuggestionScrollView (upval), UseStateResult (copy), UseStateResult4 (copy), UseContextResult (copy), UseStateResult2 (copy), UseStateResult2_3 (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval), PillGroup (upval)
		return if UseFoundationUsernameSuggestion then ReactModule.createElement(UsernameSuggestionScrollView, {
			inputUsername = UseStateResult,
			suggestionUsernames = UseStateResult4,
			eventContext = tostring(UseContextResult.activationFrameworkState.namespace),
			onUsernameSelected = function(p2)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_3 (upval), AuthButtonClickFunction (upval), UseContextResult (upval), EventStreamConstants (upval)
				UseStateResult2(p2)
				UseStateResult2_3({})
				AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.UsernameSuggestion, p2)
			end,
			layoutOrder = LayoutOrder
		}) else ReactModule.createElement(PillGroup, {
			layoutOrder = 8,
			leftPadding = 0,
			pills = UseStateResult4,
			onSelectionChanged = function(Entry)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_3 (upval), AuthButtonClickFunction (upval), UseContextResult (upval), EventStreamConstants (upval)
				if #Entry == 1 then
					if #Entry[1] == 0 then return end
					local Entry1 = Entry[1]
					UseStateResult2(Entry1)
					UseStateResult2_3({})
					AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.UsernameSuggestion, Entry1)
				end
			end
		})
	end
	
	local function v73()
		-- upvalues: UseBrowserTrackerExperimentResult (copy), UseStateResult2_6 (copy), UseStateResult8 (copy), RegisterPreauthPasskeyFunction (upval), UseRoactServiceResult (copy), UseStateResult (copy), AuthModalShownFunction (upval), EventStreamConstants (upval), PayloadKey (upval), AuthClientErrorFunction (upval), PromiseModule (upval)
		if not UseBrowserTrackerExperimentResult.shouldPromptPasskey then
			return PromiseModule.reject()
		end
		UseStateResult2_6(true)
		
		if UseStateResult8 then
			local _, v3 = RegisterPreauthPasskeyFunction(UseRoactServiceResult, UseStateResult):andThen(function(Result)
				-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), PayloadKey (upval)
				if Result then
					AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, EventStreamConstants.State.Success)
					
					return {
						[PayloadKey.SignupPasskeySessionId] = Result.sessionId,
						[PayloadKey.SignupPasskeyResult] = Result.result
					}
				else
					AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, EventStreamConstants.State.Unknown)
					
					return nil
				end
			end, function(p2)
				-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), AuthClientErrorFunction (upval)
				if p2.name then
					AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, p2.name)
					
					if type(p2.body) == "string" then
						AuthClientErrorFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, p2.body, p2.source)
						
						return
					end
				else
					AuthModalShownFunction(EventStreamConstants.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, EventStreamConstants.State.Unknown)
				end
			end):await()
			
			return PromiseModule.resolve(v3)
		else
			return PromiseModule.reject()
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: ActivationFrameworkState (copy), UseBrowserTrackerExperimentResult (copy), GetCredentialsProtocolAvailabilityModule (upval), p1 (copy), UseContextResult (copy), UseStateResult2_7 (copy)
		if ActivationFrameworkState.payloadTable and UseBrowserTrackerExperimentResult.shouldPromptPasskey then
			local CredentialsProtocolAvailabilityModule, _, _ = GetCredentialsProtocolAvailabilityModule(ActivationFrameworkState.payloadTable, p1.namespace, UseContextResult.dispatch)
			UseStateResult2_7(CredentialsProtocolAvailabilityModule)
			
			return
		end
	end, {
		ActivationFrameworkState.payloadTable,
		UseBrowserTrackerExperimentResult.shouldPromptPasskey
	})
	local ShouldMultipageDisableUsernameAutofill = HideMultipageUsernameAutofillSignupExperiment2 and UseBrowserTrackerExperimentResult.shouldMultipageDisableUsernameAutofill
	
	return ReactModule.createElement(ActivationFrameworkWrapper, {
		titleTextKey = "Authentication.SignUp.Header.UsernamePage4",
		bodyTextKey = "Authentication.SignUp.Description.UsernameHelpV2",
		headingTextKey = "Authentication.SignUp.Action.CreateAccount",
		namespace = p1.namespace,
		primaryButton = {
			buttonTextKey = "Authentication.SignUp.Action.NextWord",
			shouldShowButton = true,
			isButtonEnabled = #UseStateResult > 0 and (UseStateResult5 and (not HasError and not UseStateResult7)),
			onButtonClicked = function()
				-- upvalues: PayloadKey (upval), UseStateResult (copy), v73 (copy), UseStateResult2_6 (copy), CallbackStatus (upval)
				local PayloadAddendum = { [PayloadKey.SignupUsername] = UseStateResult }
				local v3, v4 = v73():andThen(function(Result)
					return Result
				end):await()
				UseStateResult2_6(false)
				
				if v3 and v4 then
					for i, value in pairs(v4) do
						PayloadAddendum[i] = value
					end
					PayloadAddendum[PayloadKey.SignupPassword] = ""
				end
				return {
					payloadAddendum = PayloadAddendum,
					status = CallbackStatus.Success
				}
			end
		},
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
			UsernameInputLabel = if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-body-small auto-xy",
				Text = UseLocalizationResult.username
			}) else ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				text = UseLocalizationResult.username,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextDefault,
				automaticSize = Enum.AutomaticSize.XY
			}),
			IdentifierLabelSpacing = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
			}),
			UsernameTextInput = ReactModule.createElement(TextInput, {
				LayoutOrder = 3,
				label = "",
				textInputType = if ShouldMultipageDisableUsernameAutofill then nil else Enum.TextInputType.Username,
				width = UDim.new(1, 0),
				text = UseStateResult,
				placeholder = UseLocalizationResult.noRealNamePlaceholderText,
				onChanged = function(p2)
					-- upvalues: UseResult (copy)
					UseResult(p2)
				end,
				hasError = HasError,
				iconTrailing = if HasError then {
					name = "icons/navigation/close",
					onActivated = function()
						-- upvalues: AuthButtonClickFunction (upval), UseContextResult (copy), EventStreamConstants (upval), UseStateResult2 (copy), UseStateResult2_3 (copy), UseStateResult2_1 (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseStateResult2_5 (copy)
						AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.ClearUsernameField, UseContextResult.activationFrameworkState.currentState)
						UseStateResult2("")
						UseStateResult2_3({})
						UseStateResult2_1(game:GetFastInt("DefaultUsernameDebounceMs") / 1000)
						
						if GetFFlagEnableMultiPageSignupV2UpdatesFunction() then
							UseStateResult2_5(true)
						end
					end
				} else nil,
				textBoxRef = UseRefResult
			}),
			TextSpacing = ReactModule.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
			}),
			AdditionalText = v71(5),
			SuggestionsLabelSpacing = v2 and ReactModule.createElement("Frame", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
			}),
			SuggestionsLabel = v2 and (if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				LayoutOrder = 7,
				tag = "text-body-small auto-xy",
				Text = UseLocalizationResult.usernameSuggestionHeaderText
			}) else ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 7,
				text = UseLocalizationResult.usernameSuggestionHeaderText,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextDefault,
				automaticSize = Enum.AutomaticSize.XY
			})),
			UsernameSuggestion = v2 and v72(8)
		})
	})
end