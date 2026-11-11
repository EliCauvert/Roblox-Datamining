local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local InputSize = FoundationModule.Enums.InputSize
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Logger = require(Parent.Loggers).Logger
local AuthCommonModule = require(Parent.AuthCommon)
local AuthSignupModule = require(Parent.AuthSignup)
local GetUserByIdFunction = AuthCommonModule.Thunks.GetUserById
local AuthTextInputValidator = AuthSignupModule.Components.AuthTextInputValidator
local InputValidity = AuthCommonModule.Enums.InputValidity
local PasswordValidator = AuthSignupModule.Thunks.PasswordValidator
local PasswordIssue = AuthCommonModule.Enums.PasswordIssue
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local ChallengeType = require(Parent.GenericChallenges).Types.ChallengeType
local TwoStepVerificationActionType = require(Parent.GenericChallenges).Types.TwoStepVerificationActionType
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local UserHeaderModule = require(AccountRecovery.Components.UserHeader)
local ConfirmPasswordValidatorModule = require(AccountRecovery.Thunks.ConfirmPasswordValidator)
local EmailValidatorModule = require(AccountRecovery.Thunks.EmailValidator)
local ModalStateModule = require(AccountRecovery.Enums.ModalState)
local GetModalModule = require(AccountRecovery.Components.getModal)
local AccountRecoveryActionTypeModule = require(AccountRecovery.Enums.AccountRecoveryActionType)
local ResetPasswordModule = require(AccountRecovery.Thunks.ResetPassword)
local SetEmailModule = require(AccountRecovery.Thunks.SetEmail)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ResetPasswordErrorCodesModule = require(AccountRecovery.Enums.ResetPasswordErrorCodes)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local EventServiceModule = require(AccountRecovery.Analytics.EventService)
local EventConstantsModule = require(AccountRecovery.Analytics.EventConstants)
local GetFFlagEnable2SVRecoveryModule = require(AccountRecovery.Flags.GetFFlagEnable2SVRecovery)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableAutoLoginAfterRecoveryFunction = SharedFlagsModule.GetFFlagEnableAutoLoginAfterRecovery
local GetFFlagEnableSavePasswordAfterRecoveryFunction = SharedFlagsModule.GetFFlagEnableSavePasswordAfterRecovery
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Constants = CredentialsProtocolModule.Constants
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout

local function _(p1)
	-- upvalues: HttpService (copy)
	local FieldData = p1 and p1.errors and p1.errors[1] and p1.errors[1].fieldData or nil
	
	if type(FieldData) == "string" then
		local Data = HttpService:JSONDecode(FieldData)
		
		return Data and Data.challengeId or nil
	else
		return nil
	end
end

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
local ValidatorIssueMessageList1 = {
	[require(AccountRecovery.Enums.ConfirmPasswordIssue).PasswordsNotMatch] = "Authentication.AccountRecovery.MessagePasswordsDoNotMatch"
}
local ValidatorIssueMessageList2 = {
	[require(AccountRecovery.Enums.EmailIssue).InvalidEmail] = "Authentication.AccountRecovery.Message.Error.InvalidEmail"
}

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), InputValidity (copy), UseClearFocusOnUnmountFunction (copy), GetUserByIdFunction (copy), Logger (copy), GetFFlagEnableAutoLoginAfterRecoveryFunction (copy), EventServiceModule (copy), GetFFlagEnableSavePasswordAfterRecoveryFunction (copy), EventConstantsModule (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), HttpService (copy), Constants (copy), SetEmailModule (copy), ResetPasswordModule (copy), ChallengeType (copy), TwoStepVerificationActionType (copy), ConstantsModule (copy), AppStorageUtilities (copy), ResetPasswordErrorCodesModule (copy), GetFFlagEnable2SVRecoveryModule (copy), AccountRecoveryActionTypeModule (copy), ModalStateModule (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), ScrollView (copy), Visibility (copy), UserHeaderModule (copy), Text (copy), StyledTextLabel (copy), AuthTextInputValidator (copy), PasswordValidator (copy), ValidatorIssuePriorityList (copy), ValidatorIssueMessageList (copy), InputSize (copy), ConfirmPasswordValidatorModule (copy), ValidatorIssueMessageList1 (copy), EmailValidatorModule (copy), ValidatorIssueMessageList2 (copy), Button (copy), ButtonVariant (copy), GetModalModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.IosPasswordSavingLayer }, function(p2)
		-- upvalues: AppBtidLayers (upval)
		return (p2[AppBtidLayers.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(InputValidity.Unvalidated)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(InputValidity.Unvalidated)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState("")
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(InputValidity.Unvalidated)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(false)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(false)
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState("")
	local UseStateResult12, UseStateResult2_11 = ReactModule.useState(Vector2.new(0, 0))
	local UserIDParam = p1.navigation.getParam("userID")
	local ShouldAddContactMethodParam = p1.navigation.getParam("shouldAddContactMethod")
	UseClearFocusOnUnmountFunction()
	ReactModule.useEffect(function()
		-- upvalues: GetUserByIdFunction (upval), UseRoactServiceResult (copy), UserIDParam (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), Logger (upval)
		GetUserByIdFunction(UseRoactServiceResult, `{UserIDParam}`):andThen(function(Result)
			-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
			UseStateResult2_1(Result.name)
			UseStateResult2(Result.displayName)
		end):catch(function(Err)
			-- upvalues: Logger (upval)
			Logger:warning("Error getting user info: {}", Err)
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_8 (copy), UseStateResult10 (copy), UseStateResult4 (copy), InputValidity (upval), UseStateResult6 (copy), ShouldAddContactMethodParam (copy), UseStateResult8 (copy)
		UseStateResult2_8(not UseStateResult10 and (UseStateResult4 == InputValidity.Valid and UseStateResult6 == InputValidity.Valid and (not ShouldAddContactMethodParam or UseStateResult8 == InputValidity.Valid)))
	end, {
		UseStateResult10,
		UseStateResult4,
		UseStateResult6,
		UseStateResult8
	})
	
	local function OnTextChanged(p2, p3)
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseStateResult2_2(p2)
		UseStateResult2_3(p3)
	end
	
	local function OnTextChanged1(p2, p3)
		-- upvalues: UseStateResult2_4 (copy), UseStateResult2_5 (copy)
		UseStateResult2_4(p2)
		UseStateResult2_5(p3)
	end
	
	local function OnTextChanged2(p2, p3)
		-- upvalues: UseStateResult2_6 (copy), UseStateResult2_7 (copy)
		UseStateResult2_6(p2)
		UseStateResult2_7(p3)
	end
	
	local function v90(p2)
		-- upvalues: GetFFlagEnableAutoLoginAfterRecoveryFunction (upval), EventServiceModule (upval), UseContextResult (copy)
		if p2 and GetFFlagEnableAutoLoginAfterRecoveryFunction() then
			EventServiceModule.sendPasswordResetEvent(UseContextResult.state.recoverySessionId, "launchApp")
			UseContextResult.utils.launchApp()
			
			return
		else
			EventServiceModule.sendPasswordResetEvent(UseContextResult.state.recoverySessionId, "closeRecoveryFlow")
			UseContextResult.parentNavigation.goBack()
		end
	end
	
	local function v91(ShouldAutoLoginFromRecovery)
		-- upvalues: UseContextResult (copy), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), UseBrowserTrackerExperimentResult (copy), EventServiceModule (upval), EventConstantsModule (upval), v90 (copy), UseStateResult1 (copy), UseStateResult3 (copy), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), HttpService (upval), Logger (upval), Constants (upval)
		local RecoverySessionId = UseContextResult.state.recoverySessionId
		
		if GetFFlagEnableSavePasswordAfterRecoveryFunction() or UseBrowserTrackerExperimentResult then
			if UseStateResult1 then
				if UseStateResult3 then
					Default:isAvailable(Default.CredentialsTypes.all, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
						-- upvalues: EventServiceModule (upval), RecoverySessionId (copy), EventConstantsModule (upval), v90 (upval), ShouldAutoLoginFromRecovery (copy), UseStateResult1 (upval), UseStateResult3 (upval), HttpService (upval), Logger (upval), Default (upval), Constants (upval)
						if Result.password and Result.password.isAvailable then
							local Json = HttpService:JSONEncode({ username = UseStateResult1, password = UseStateResult3 })
							Logger:info("[ResetPasswordScreen] Calling registerCredentials for user: {}", UseStateResult1)
							
							if EventServiceModule and EventServiceModule.sendPasswordUpdateAttemptedEvent ~= nil then
								EventServiceModule.sendPasswordUpdateAttemptedEvent(RecoverySessionId, UseStateResult1)
							end
							Default:registerCredentials(Default.CredentialsTypes.password, Json, Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(Result)
								-- upvalues: HttpService (upval), Logger (upval), EventServiceModule (upval), RecoverySessionId (upval), UseStateResult1 (upval), v90 (upval), ShouldAutoLoginFromRecovery (upval)
								local Data = if Result then HttpService:JSONDecode(Result) else {}
								
								if Data and Data.errorCode == nil then
									Logger:info("Successfully registered password after recovery")
									
									if EventServiceModule and EventServiceModule.sendPasswordUpdateSuccessEvent ~= nil then
										EventServiceModule.sendPasswordUpdateSuccessEvent(RecoverySessionId, UseStateResult1)
									end
								else
									Logger:warning("Error registering password after recovery: {}", Data.errorMsg or "unknown")
									
									if EventServiceModule and EventServiceModule.sendPasswordUpdateFailureEvent ~= nil then
										EventServiceModule.sendPasswordUpdateFailureEvent(RecoverySessionId, UseStateResult1, Data.errorMsg)
									end
								end
								v90(ShouldAutoLoginFromRecovery)
							end, function(p2)
								-- upvalues: Logger (upval), EventServiceModule (upval), RecoverySessionId (upval), UseStateResult1 (upval), v90 (upval), ShouldAutoLoginFromRecovery (upval)
								Logger:warning("Error registering password after recovery: {}", p2)
								
								if EventServiceModule and EventServiceModule.sendPasswordUpdateFailureEvent ~= nil then
									EventServiceModule.sendPasswordUpdateFailureEvent(RecoverySessionId, UseStateResult1, (tostring(p2)))
								end
								v90(ShouldAutoLoginFromRecovery)
							end)
							
							return
						else
							if EventServiceModule and EventServiceModule.sendPasswordUpdateSkippedEvent ~= nil then
								EventServiceModule.sendPasswordUpdateSkippedEvent(RecoverySessionId, EventConstantsModule.passwordUpdateSkipReason.protocolNotAvailable)
							end
							v90(ShouldAutoLoginFromRecovery)
						end
					end):catch(function(Err)
						-- upvalues: Logger (upval), EventServiceModule (upval), RecoverySessionId (copy), EventConstantsModule (upval), v90 (upval), ShouldAutoLoginFromRecovery (copy)
						Logger:warning("[ResetPasswordScreen] Error checking CredentialsProtocol availability: {}", Err)
						
						if EventServiceModule and EventServiceModule.sendPasswordUpdateSkippedEvent ~= nil then
							EventServiceModule.sendPasswordUpdateSkippedEvent(RecoverySessionId, EventConstantsModule.passwordUpdateSkipReason.availabilityCheckFailed)
						end
						v90(ShouldAutoLoginFromRecovery)
					end)
					
					return
				end
				if EventServiceModule and EventServiceModule.sendPasswordUpdateSkippedEvent ~= nil then
					EventServiceModule.sendPasswordUpdateSkippedEvent(RecoverySessionId, EventConstantsModule.passwordUpdateSkipReason.missingPassword)
				end
				v90(ShouldAutoLoginFromRecovery)
				
				return
			else
				if EventServiceModule and EventServiceModule.sendPasswordUpdateSkippedEvent ~= nil then
					EventServiceModule.sendPasswordUpdateSkippedEvent(RecoverySessionId, EventConstantsModule.passwordUpdateSkipReason.missingUsername)
				end
				v90(ShouldAutoLoginFromRecovery)
				
				return
			end
		else
			if EventServiceModule and EventServiceModule.sendPasswordUpdateSkippedEvent ~= nil then
				EventServiceModule.sendPasswordUpdateSkippedEvent(RecoverySessionId, EventConstantsModule.passwordUpdateSkipReason.featureDisabled)
			end
			v90(ShouldAutoLoginFromRecovery)
		end
	end
	
	local function _(RecoverySessionId)
		-- upvalues: UseDispatchResult (copy), SetEmailModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(SetEmailModule(UseRoactServiceResult, { recoverySessionId = RecoverySessionId }))
	end
	
	local _ = function(Ticket, TwoStepVerificationChallengeId, TwoStepVerificationToken, AccountBlob)
		-- upvalues: UseDispatchResult (copy), ResetPasswordModule (upval), UseRoactServiceResult (copy), UserIDParam (copy), UseStateResult3 (copy), UseStateResult5 (copy), UseStateResult7 (copy)
		return UseDispatchResult(ResetPasswordModule(UseRoactServiceResult, {
			targetType = "RecoverySessionID",
			ticket = Ticket,
			userId = UserIDParam,
			password = UseStateResult3,
			passwordRepeated = UseStateResult5,
			twoStepVerificationChallengeId = TwoStepVerificationChallengeId,
			twoStepVerificationToken = TwoStepVerificationToken,
			accountBlob = AccountBlob,
			newEmail = UseStateResult7
		}))
	end
	
	local function v94(ErrorRaw, Callback)
		-- upvalues: HttpService (upval), UseContextResult (copy), ChallengeType (upval), TwoStepVerificationActionType (upval), UserIDParam (copy), UseStateResult2_9 (copy), UseStateResult2_10 (copy), ConstantsModule (upval)
		local FieldData = ErrorRaw and ErrorRaw.errors and ErrorRaw.errors[1] and ErrorRaw.errors[1].fieldData or nil
		local ChallengeId = nil
		
		if type(FieldData) == "string" then
			local Data = HttpService:JSONDecode(FieldData)
			ChallengeId = Data and Data.challengeId or nil
		else
			ChallengeId = nil
		end
		if ChallengeId ~= nil then
			UseContextResult.utils.renderChallenge({
				title = "Authentication.AccountRecovery.LabelTwoStepVerification",
				challengeType = ChallengeType.TwoStepVerification,
				challengeParameters = {
					allowRememberDevice = false,
					actionType = TwoStepVerificationActionType.PasswordReset,
					challengeId = ChallengeId,
					userId = UserIDParam
				},
				callbacks = {
					OnChallengeCompleted = function(p2)
						-- upvalues: Callback (copy), ChallengeId (copy)
						Callback(ChallengeId, p2.data.verificationToken)
					end,
					OnChallengeInvalidated = function(_)
						-- upvalues: UseStateResult2_9 (upval), UseStateResult2_10 (upval), ConstantsModule (upval)
						UseStateResult2_9(false)
						UseStateResult2_10(ConstantsModule.UnknownErrorKey)
					end,
					OnChallengeAbandoned = function(_)
						-- upvalues: UseStateResult2_9 (upval)
						UseStateResult2_9(false)
					end,
					OnChallengeLoadFailed = function(_)
						-- upvalues: UseStateResult2_9 (upval), UseStateResult2_10 (upval), ConstantsModule (upval)
						UseStateResult2_9(false)
						UseStateResult2_10(ConstantsModule.UnknownErrorKey)
					end
				}
			})
			
			return
		end
	end
	
	local function handleUpdatePassword(TwoStepVerificationChallengeId, TwoStepVerificationToken)
		-- upvalues: UseStateResult2_9 (copy), AppStorageUtilities (upval), UseContextResult (copy), UseDispatchResult (copy), ResetPasswordModule (upval), UseRoactServiceResult (copy), UserIDParam (copy), UseStateResult3 (copy), UseStateResult5 (copy), UseStateResult7 (copy), ResetPasswordErrorCodesModule (upval), v94 (copy), handleUpdatePassword (copy), Logger (upval), HttpService (upval), UseStateResult2_10 (copy), ConstantsModule (upval), GetFFlagEnable2SVRecoveryModule (upval), AccountRecoveryActionTypeModule (upval), ModalStateModule (upval), v91 (copy), UseStateResult1 (copy), SetEmailModule (upval)
		UseStateResult2_9(true)
		UseDispatchResult(ResetPasswordModule(UseRoactServiceResult, {
			targetType = "RecoverySessionID",
			ticket = UseContextResult.state.recoverySessionId,
			userId = UserIDParam,
			password = UseStateResult3,
			passwordRepeated = UseStateResult5,
			twoStepVerificationChallengeId = TwoStepVerificationChallengeId,
			twoStepVerificationToken = TwoStepVerificationToken,
			accountBlob = AppStorageUtilities.getAccountBlob() or "",
			newEmail = UseStateResult7
		})):andThen(function(Result)
			-- upvalues: ResetPasswordErrorCodesModule (upval), v94 (upval), handleUpdatePassword (upval), Logger (upval), HttpService (upval), UseStateResult2_10 (upval), ConstantsModule (upval), UseStateResult2_9 (upval), GetFFlagEnable2SVRecoveryModule (upval), UseContextResult (upval), AccountRecoveryActionTypeModule (upval), ModalStateModule (upval), v91 (upval), UserIDParam (upval), UseStateResult1 (upval), UseDispatchResult (upval), SetEmailModule (upval), UseRoactServiceResult (upval)
			if Result.isError then
				if Result.errorCode == ResetPasswordErrorCodesModule.TwoStepVerificationRequired and Result.errorRaw ~= nil then
					v94(Result.errorRaw, handleUpdatePassword)
					
					return
				else
					Logger:warning("Error sending code: {}", HttpService:JSONEncode(Result))
					UseStateResult2_10(Result.errorKey or ConstantsModule.UnknownErrorKey)
					UseStateResult2_9(false)
					
					return
				end
			elseif GetFFlagEnable2SVRecoveryModule() and Result.data.shouldPromptPasskeyAddition then
				UseContextResult.dispatch({
					type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
					data = {
						modalStateAndProps = {
							modalState = ModalStateModule.ADD_NEW_PASSKEY,
							props = {
								onPasswordResetSuccess = function()
									-- upvalues: v91 (upval), Result (copy)
									v91(Result.data.shouldAutoLoginFromRecovery)
								end,
								shouldUpdateEmail = Result.data.shouldUpdateEmail,
								email = Result.data.shouldUpdateEmail and Result.data.recoveryEmail or "",
								userId = UserIDParam,
								username = UseStateResult1
							}
						}
					}
				})
				
				return
			else
				if GetFFlagEnable2SVRecoveryModule() and Result.data.shouldPrompt2svRemoval then
					UseContextResult.dispatch({
						type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
						data = {
							modalStateAndProps = {
								modalState = ModalStateModule.SAVE_OR_DELETE_TWO_STEP_METHOD,
								props = {
									onPasswordResetSuccess = function()
										-- upvalues: v91 (upval), Result (copy)
										v91(Result.data.shouldAutoLoginFromRecovery)
									end,
									shouldUpdateEmail = Result.data.shouldUpdateEmail,
									email = Result.data.shouldUpdateEmail and Result.data.recoveryEmail or ""
								}
							}
						}
					})
					
					return
				end
				if Result.data.shouldUpdateEmail then
					UseContextResult.dispatch({
						type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
						data = {
							modalStateAndProps = {
								modalState = ModalStateModule.UPDATE_EMAIL,
								props = {
									email = Result.data.recoveryEmail,
									onPasswordResetSuccess = function()
										-- upvalues: v91 (upval), Result (copy)
										v91(Result.data.shouldAutoLoginFromRecovery)
									end
								}
							}
						}
					})
					
					return
				else
					UseDispatchResult(SetEmailModule(UseRoactServiceResult, {
						recoverySessionId = UseContextResult.state.recoverySessionId
					})):andThen(function()
						-- upvalues: v91 (upval), Result (copy)
						v91(Result.data.shouldAutoLoginFromRecovery)
					end)
				end
			end
		end):await()
	end
	
	local function v96(Frame: Frame)
		-- upvalues: UseStateResult12 (copy), UseStateResult2_11 (copy)
		if UseStateResult12 ~= Frame.AbsoluteSize then
			UseStateResult2_11(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		resetPasswordHeadingText = "Authentication.AccountRecovery.Heading.ResetPassword",
		createNewPasswordText = "Authentication.AccountRecovery.Description.CreateNewPassword",
		createNewPasswordAddEmailText = "Authentication.AccountRecovery.Description.CreateNewPasswordAddEmail",
		newPasswordLabelText = "Authentication.AccountRecovery.Label.NewPasswordV2",
		confirmPasswordLabelText = "Authentication.AccountRecovery.Label.ConfirmNewPasswordV2",
		updatePasswordButtonText = "Authentication.AccountRecovery.Action.UpdatePassword",
		addEmailLabelText = "Authentication.AccountRecovery.Label.AddEmail",
		requestErrorText = if UseStateResult11 == "" then nil else UseStateResult11
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_500)
			}),
			PreScrollContent = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				[ReactModule.Change.AbsoluteSize] = v96
			}, {
				Header = ReactModule.createElement(RecoveryHeaderModule, {
					LayoutOrder = 1,
					currentComponent = "resetPassword",
					onBackActivated = function()
						-- upvalues: p1 (copy)
						p1.navigation.goBack()
					end,
					backButtonDisabled = UseStateResult10,
					recoveryHeadingText = UseLocalizationResult.resetPasswordHeadingText,
					recoverySessionId = UseContextResult.state.recoverySessionId
				})
			}),
			ContentScrollView = ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = Visibility.Auto
				},
				Size = UDim2.new(1, 0, 1, -UseStateResult12.Y)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
					PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
				}),
				UserHeader = ReactModule.createElement(UserHeaderModule, {
					LayoutOrder = 1,
					userId = UserIDParam,
					displayName = UseStateResult,
					username = UseStateResult1
				}),
				BodyText = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					TextWrapped = true,
					Text = ShouldAddContactMethodParam and UseLocalizationResult.createNewPasswordAddEmailText or UseLocalizationResult.createNewPasswordText,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					textStyle = UseTokensResult.Color.Content.Default,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					padding = {
						top = UDim.new(0, UseTokensResult.Size.Size_300),
						bottom = UDim.new(0, UseTokensResult.Size.Size_300)
					}
				}),
				NewPasswordLabel = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 3,
					text = UseLocalizationResult.newPasswordLabelText,
					fontStyle = UseTokensResult.Typography.TitleMedium,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					automaticSize = Enum.AutomaticSize.XY
				}),
				NewPasswordFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					NewPasswordPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, UseTokensResult.Size.Size_50),
						PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_300)
					}),
					NewPasswordField = ReactModule.createElement(AuthTextInputValidator, {
						layoutOrder = 1,
						customPadding = 0,
						hideIconButton = true,
						useFoundationTextForIssue = true,
						textInputType = Enum.TextInputType.Password,
						disabled = UseStateResult10,
						validator = PasswordValidator,
						validatorAdditionalProps = { username = UseStateResult1 },
						validatorIssuePriorityList = ValidatorIssuePriorityList,
						validatorIssueMessageList = ValidatorIssueMessageList,
						onTextChanged = OnTextChanged,
						issueHeight = UseTokensResult.Size.Size_500,
						foundationIssueTextPadding = UseTokensResult.Size.Size_200,
						size = InputSize.Medium
					})
				}),
				ConfirmPasswordLabel = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 5,
					text = UseLocalizationResult.confirmPasswordLabelText,
					fontStyle = UseTokensResult.Typography.TitleMedium,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					automaticSize = Enum.AutomaticSize.XY
				}),
				ConfirmPasswordFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					ConfirmPasswordPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, UseTokensResult.Size.Size_50),
						PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_300)
					}),
					ConfirmPasswordField = ReactModule.createElement(AuthTextInputValidator, {
						layoutOrder = 2,
						customPadding = 0,
						hideIconButton = true,
						useFoundationTextForIssue = true,
						textInputType = Enum.TextInputType.Password,
						disabled = UseStateResult10,
						validator = ConfirmPasswordValidatorModule,
						validatorAdditionalProps = { password = UseStateResult3 },
						validationDependencies = { UseStateResult3 },
						validatorIssueMessageList = ValidatorIssueMessageList1,
						onTextChanged = OnTextChanged1,
						issueHeight = UseTokensResult.Size.Size_500,
						foundationIssueTextPadding = UseTokensResult.Size.Size_200,
						size = InputSize.Medium
					})
				}),
				AddEmailLabel = ShouldAddContactMethodParam and ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 7,
					text = UseLocalizationResult.addEmailLabelText,
					fontStyle = UseTokensResult.Typography.TitleMedium,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					automaticSize = Enum.AutomaticSize.XY
				}),
				AddEmailFrame = ShouldAddContactMethodParam and ReactModule.createElement("Frame", {
					LayoutOrder = 8,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					AddEmailPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, UseTokensResult.Size.Size_50),
						PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_300)
					}),
					AddEmailField = ShouldAddContactMethodParam and ReactModule.createElement(AuthTextInputValidator, {
						layoutOrder = 3,
						customPadding = 0,
						hideIconButton = true,
						useFoundationTextForIssue = true,
						textInputType = Enum.TextInputType.Email,
						disabled = UseStateResult10,
						validator = EmailValidatorModule,
						validatorIssueMessageList = ValidatorIssueMessageList2,
						onTextChanged = OnTextChanged2,
						issueHeight = UseTokensResult.Size.Size_500,
						foundationIssueTextPadding = UseTokensResult.Size.Size_200,
						size = InputSize.Medium
					})
				}),
				UpdatePasswordButton = ReactModule.createElement(Button, {
					LayoutOrder = 9,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					text = UseLocalizationResult.updatePasswordButtonText,
					width = UDim.new(1, 0),
					onActivated = function()
						-- upvalues: handleUpdatePassword (copy)
						handleUpdatePassword()
					end,
					isDisabled = not UseStateResult9
				}),
				RequestErrorTextLabel = ReactModule.createElement(Text, {
					LayoutOrder = 11,
					Text = UseLocalizationResult.requestErrorText or "",
					fontStyle = UseTokensResult.Typography.CaptionSmall,
					textStyle = UseTokensResult.Color.System.Alert,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					padding = { top = UDim.new(0, UseTokensResult.Size.Size_200) }
				}),
				Modal = GetModalModule(UseContextResult.state.modalStateAndProps)
			})
		})
	})
end