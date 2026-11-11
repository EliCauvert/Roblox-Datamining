local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local Logger = require(Parent.Loggers).Logger
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local RenderChallengeFunction = require(Parent.GenericChallenges).Middleware.RenderChallenge
local ChallengeType = require(Parent.GenericChallenges).Types.ChallengeType
local TwoStepVerificationActionType = require(Parent.GenericChallenges).Types.TwoStepVerificationActionType
local AppStorageUtilities = require(Parent.AuthCommon).Utils.AppStorageUtilities
local _ = require(AccountRecovery.Store.State)
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local AccountRecoveryStateReducerModule = require(AccountRecovery.Store.AccountRecoveryStateReducer)
local PhonePrefixListModule = require(AccountRecovery.Thunks.PhonePrefixList)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local AccountRecoveryActionTypeModule = require(AccountRecovery.Enums.AccountRecoveryActionType)
local ModalStateModule = require(AccountRecovery.Enums.ModalState)
local ContinueRecoveryModule = require(AccountRecovery.Thunks.ContinueRecovery)
local ResetPasswordModule = require(AccountRecovery.Thunks.ResetPassword)
local AccountRecoveryErrorCodesModule = require(AccountRecovery.Enums.AccountRecoveryErrorCodes)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local MetricsServiceModule = require(AccountRecovery.Analytics.MetricsService)
local GetFFlagEnable2SVRecoveryModule = require(AccountRecovery.Flags.GetFFlagEnable2SVRecovery)
local EventServiceModule = require(AccountRecovery.Analytics.EventService)
local GetFFlagEnableAutoLoginAfterRecoveryFunction = require(Parent.SharedFlags).GetFFlagEnableAutoLoginAfterRecovery

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

return function(p1)
	-- upvalues: UseNavigationPropsFunction (copy), ModalStateModule (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalytics (copy), UseAppPolicyFunction (copy), ReactModule (copy), AccountRecoveryStateReducerModule (copy), LaunchContext (copy), RenderChallengeFunction (copy), PhonePrefixListModule (copy), HttpService (copy), Logger (copy), MetricsServiceModule (copy), ChallengeType (copy), TwoStepVerificationActionType (copy), GetFFlagEnable2SVRecoveryModule (copy), ContinueRecoveryModule (copy), AccountRecoveryErrorCodesModule (copy), ConstantsModule (copy), ResetPasswordModule (copy), GetFFlagEnableAutoLoginAfterRecoveryFunction (copy), EventServiceModule (copy), AppStorageUtilities (copy), AccountRecoveryActionTypeModule (copy), AccountRecoveryContextModule (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(DeeplinkUuid, p2)
		return {
			continuingRecovery = p2.continuingRecovery,
			recover2sv = p2.recover2sv,
			recoverPassword = p2.recoverPassword == nil or p2.recoverPassword,
			recoverySessionID = p2.continuingRecovery and p2.recoverySessionID or nil,
			identifier = p2.identifier,
			deeplinkUuid = DeeplinkUuid
		}
	end)
	local config = {
		monoDeps = p1.monoDeps,
		continuingRecovery = UseNavigationPropsResult.continuingRecovery or false,
		recoverySessionId = UseNavigationPropsResult.recoverySessionID or "",
		phonePrefixList = {},
		autofillIdentifier = UseNavigationPropsResult.identifier or "",
		recover2sv = UseNavigationPropsResult.recover2sv or false,
		recoverPassword = UseNavigationPropsResult.recoverPassword or false,
		deeplinkUuid = UseNavigationPropsResult.deeplinkUuid or "",
		modalStateAndProps = { props = nil, modalState = ModalStateModule.NONE }
	}
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2
	end)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(AccountRecoveryStateReducerModule, config)
	local LaunchAppFunction = UseReducerResult.monoDeps.LaunchApp
	
	local function LaunchApp()
		-- upvalues: UseDispatchResult (copy), LaunchAppFunction (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval)
		return UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
	end
	
	local function RenderChallenge(p2)
		-- upvalues: RenderChallengeFunction (upval)
		return RenderChallengeFunction(p2)
	end
	
	local function _()
		-- upvalues: UseDispatchResult (copy), PhonePrefixListModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(PhonePrefixListModule(UseRoactServiceResult))
	end
	
	local function HandleTwoStepVerificationError(UserId, ErrorRaw, Callback, p2, RecoverySessionId)
		-- upvalues: HttpService (upval), Logger (upval), MetricsServiceModule (upval), RenderChallenge (copy), ChallengeType (upval), TwoStepVerificationActionType (upval), GetFFlagEnable2SVRecoveryModule (upval)
		local FieldData = ErrorRaw and ErrorRaw.errors and ErrorRaw.errors[1] and ErrorRaw.errors[1].fieldData or nil
		local ChallengeId = nil
		
		if type(FieldData) == "string" then
			local Data = HttpService:JSONDecode(FieldData)
			ChallengeId = Data and Data.challengeId or nil
		else
			ChallengeId = nil
		end
		if ChallengeId == nil then
			Logger:error("Two step verification challenge ID is nil")
			MetricsServiceModule.reportTwoStepVerificationChallengeIDIsNil()
			
			return
		end
		local Callbacks = nil
		Callbacks = {
			OnChallengeCompleted = function(p3)
				-- upvalues: Callback (copy), ChallengeId (copy)
				Callback(ChallengeId, p3.data.verificationToken)
			end,
			OnChallengeInvalidated = function(p3)
				-- upvalues: Callbacks (ref), p2 (copy)
				function Callbacks:OnChallengeCompleted() end
				
				p2.OnChallengeInvalidated(p3)
			end,
			OnChallengeAbandoned = function()
				-- upvalues: Callbacks (ref), p2 (copy)
				function Callbacks:OnChallengeCompleted() end
				
				p2.OnChallengeAbandoned()
			end,
			OnChallengeLoadFailed = function(p3)
				-- upvalues: Callbacks (ref), p2 (copy)
				function Callbacks:OnChallengeCompleted() end
				
				p2.OnChallengeLoadFailed(p3)
			end
		}
		
		return RenderChallenge({
			title = "Authentication.AccountRecovery.LabelTwoStepVerification",
			challengeType = ChallengeType.TwoStepVerification,
			challengeParameters = {
				allowRememberDevice = false,
				actionType = TwoStepVerificationActionType.PasswordReset,
				challengeId = ChallengeId,
				userId = tostring(UserId),
				clientSupports2svRecovery = if GetFFlagEnable2SVRecoveryModule() then true else false,
				recoverySessionId = RecoverySessionId
			},
			callbacks = Callbacks
		})
	end
	
	local _ = function(RecoverySessionId, UserId, Recover2sv, TwoStepVerificationChallengeId, TwoStepVerificationToken)
		-- upvalues: UseDispatchResult (copy), ContinueRecoveryModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(ContinueRecoveryModule(UseRoactServiceResult, {
			recoverySessionId = RecoverySessionId,
			userId = UserId,
			recover2sv = Recover2sv,
			twoStepVerificationChallengeId = TwoStepVerificationChallengeId,
			twoStepVerificationToken = TwoStepVerificationToken
		}))
	end
	
	local function handleContinueRecovery(RecoverySessionId, UserId, Callback1, Callback, Callback2, Recover2sv, TwoStepVerificationChallengeId, TwoStepVerificationToken)
		-- upvalues: UseDispatchResult (copy), ContinueRecoveryModule (upval), UseRoactServiceResult (copy), AccountRecoveryErrorCodesModule (upval), HandleTwoStepVerificationError (copy), handleContinueRecovery (copy), ConstantsModule (upval), Logger (upval), HttpService (upval)
		UseDispatchResult(ContinueRecoveryModule(UseRoactServiceResult, {
			recoverySessionId = RecoverySessionId,
			userId = UserId,
			recover2sv = Recover2sv,
			twoStepVerificationChallengeId = TwoStepVerificationChallengeId,
			twoStepVerificationToken = TwoStepVerificationToken
		})):andThen(function(Result)
			-- upvalues: AccountRecoveryErrorCodesModule (upval), HandleTwoStepVerificationError (upval), UserId (copy), handleContinueRecovery (upval), RecoverySessionId (copy), Callback1 (copy), Callback (copy), Callback2 (copy), Recover2sv (copy), ConstantsModule (upval), Logger (upval), HttpService (upval)
			if not Result.isError then
				Callback1(Result.data)
				
				return
			end
			if Result.errorCode == AccountRecoveryErrorCodesModule.TwoStepVerificationRequired and Result.errorRaw ~= nil then
				HandleTwoStepVerificationError(UserId, Result.errorRaw, function(TwoStepVerificationChallengeId, TwoStepVerificationToken)
					-- upvalues: handleContinueRecovery (upval), RecoverySessionId (upval), UserId (upval), Callback1 (upval), Callback (upval), Callback2 (upval), Recover2sv (upval)
					handleContinueRecovery(RecoverySessionId, UserId, Callback1, Callback, Callback2, Recover2sv, TwoStepVerificationChallengeId, TwoStepVerificationToken)
				end, {
					OnChallengeInvalidated = function(_)
						-- upvalues: Callback (upval), ConstantsModule (upval)
						Callback(ConstantsModule.UnknownErrorKey)
					end,
					OnChallengeAbandoned = function()
						-- upvalues: Callback2 (upval)
						Callback2()
					end,
					OnChallengeLoadFailed = function(_)
						-- upvalues: Callback (upval), ConstantsModule (upval)
						Callback(ConstantsModule.UnknownErrorKey)
					end
				}, RecoverySessionId)
				
				return
			else
				Logger:warning("Error continuing recovery: {}", HttpService:JSONEncode(Result))
				Callback(Result.errorKey or ConstantsModule.UnknownErrorKey)
			end
		end):await()
	end
	
	local _ = function(Ticket, UserId, Password, PasswordRepeated, AccountBlob, TwoStepVerificationChallengeId, TwoStepVerificationToken, NewEmail)
		-- upvalues: UseDispatchResult (copy), ResetPasswordModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(ResetPasswordModule(UseRoactServiceResult, {
			targetType = "RecoverySessionID",
			ticket = Ticket,
			userId = UserId,
			password = Password,
			passwordRepeated = PasswordRepeated,
			accountBlob = AccountBlob,
			twoStepVerificationChallengeId = TwoStepVerificationChallengeId,
			twoStepVerificationToken = TwoStepVerificationToken,
			newEmail = NewEmail
		}))
	end
	
	local function launchAppOrGoBack(p2)
		-- upvalues: GetFFlagEnableAutoLoginAfterRecoveryFunction (upval), EventServiceModule (upval), UseReducerResult (copy), UseDispatchResult (copy), LaunchAppFunction (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseAppPolicyResult (copy), LaunchContext (upval), p1 (copy)
		if p2 and GetFFlagEnableAutoLoginAfterRecoveryFunction() then
			EventServiceModule.sendPasswordResetEvent(UseReducerResult.recoverySessionId, "launchApp")
			local _ = UseDispatchResult(LaunchAppFunction(UseRoactServiceResult, nil, UseRoactServiceResult1, UseAppPolicyResult, LaunchContext.Login))
			
			return
		else
			EventServiceModule.sendPasswordResetEvent(UseReducerResult.recoverySessionId, "closeRecoveryFlow")
			p1.parentNavigation.goBack()
		end
	end
	
	local function handleUpdatePassword(Ticket, UserId, Username, Password, PasswordRepeated, Callback, Callback1, TwoStepVerificationChallengeId, TwoStepVerificationToken, NewEmail)
		-- upvalues: AppStorageUtilities (upval), UseDispatchResult (copy), ResetPasswordModule (upval), UseRoactServiceResult (copy), Logger (upval), HttpService (upval), ConstantsModule (upval), GetFFlagEnable2SVRecoveryModule (upval), UseReducerResult2 (copy), AccountRecoveryActionTypeModule (upval), ModalStateModule (upval)
		UseDispatchResult(ResetPasswordModule(UseRoactServiceResult, {
			targetType = "RecoverySessionID",
			ticket = Ticket,
			userId = UserId,
			password = Password,
			passwordRepeated = PasswordRepeated,
			accountBlob = AppStorageUtilities.getAccountBlob() or "",
			twoStepVerificationChallengeId = TwoStepVerificationChallengeId,
			twoStepVerificationToken = TwoStepVerificationToken,
			newEmail = NewEmail
		})):andThen(function(Result)
			-- upvalues: Logger (upval), HttpService (upval), Callback (copy), ConstantsModule (upval), GetFFlagEnable2SVRecoveryModule (upval), UseReducerResult2 (upval), AccountRecoveryActionTypeModule (upval), ModalStateModule (upval), Callback1 (copy), UserId (copy), Username (copy)
			if Result.isError then
				Logger:warning("Error resetting password: {}", HttpService:JSONEncode(Result))
				Callback(Result.errorKey or ConstantsModule.UnknownErrorKey)
				
				return
			end
			if GetFFlagEnable2SVRecoveryModule() and Result.data.shouldPromptPasskeyAddition then
				UseReducerResult2({
					type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
					data = {
						modalStateAndProps = {
							modalState = ModalStateModule.ADD_NEW_PASSKEY,
							props = {
								onPasswordResetSuccess = function()
									-- upvalues: Callback1 (upval), Result (copy)
									Callback1(Result.data.shouldAutoLoginFromRecovery)
								end,
								shouldUpdateEmail = Result.data.shouldUpdateEmail,
								email = Result.data.shouldUpdateEmail and Result.data.recoveryEmail or "",
								userId = UserId,
								username = Username
							}
						}
					}
				})
				
				return
			end
			if GetFFlagEnable2SVRecoveryModule() and Result.data.shouldPrompt2svRemoval then
				UseReducerResult2({
					type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
					data = {
						modalStateAndProps = {
							modalState = ModalStateModule.SAVE_OR_DELETE_TWO_STEP_METHOD,
							props = {
								onPasswordResetSuccess = function()
									-- upvalues: Callback1 (upval), Result (copy)
									Callback1(Result.data.shouldAutoLoginFromRecovery)
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
				UseReducerResult2({
					type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
					data = {
						modalStateAndProps = {
							modalState = ModalStateModule.UPDATE_EMAIL,
							props = {
								email = Result.data.recoveryEmail,
								onPasswordResetSuccess = function()
									-- upvalues: Callback1 (upval), Result (copy)
									Callback1(Result.data.shouldAutoLoginFromRecovery)
								end
							}
						}
					}
				})
				
				return
			else
				Callback1(Result.data.shouldAutoLoginFromRecovery)
			end
		end):await()
	end
	
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnable2SVRecoveryModule (upval), p1 (copy), UseNavigationPropsResult (copy), UseReducerResult2 (copy), AccountRecoveryActionTypeModule (upval)
		if GetFFlagEnable2SVRecoveryModule() and p1.resetChildNavigationToFirstScreen and UseNavigationPropsResult.continuingRecovery then
			UseReducerResult2({
				type = AccountRecoveryActionTypeModule.RESET_RECOVERY_FLOW,
				data = {
					continuingRecovery = UseNavigationPropsResult.continuingRecovery,
					recover2sv = UseNavigationPropsResult.recover2sv or false,
					recoverPassword = UseNavigationPropsResult.recoverPassword or false,
					recoverySessionId = UseNavigationPropsResult.recoverySessionID or "",
					autofillIdentifier = UseNavigationPropsResult.identifier or "",
					deeplinkUuid = UseNavigationPropsResult.deeplinkUuid or ""
				}
			})
			p1.resetChildNavigationToFirstScreen()
		end
	end, { UseNavigationPropsResult.deeplinkUuid })
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), PhonePrefixListModule (upval), UseRoactServiceResult (copy), Logger (upval), HttpService (upval), UseReducerResult2 (copy), AccountRecoveryActionTypeModule (upval)
		UseDispatchResult(PhonePrefixListModule(UseRoactServiceResult)):andThen(function(Result)
			-- upvalues: Logger (upval), HttpService (upval), UseReducerResult2 (upval), AccountRecoveryActionTypeModule (upval)
			if Result.isError then
				Logger:warning("Error getting phone prefix list: {}", HttpService:JSONEncode(Result))
				
				return
			else
				UseReducerResult2({
					type = AccountRecoveryActionTypeModule.SET_PHONE_PREFIX_LIST,
					data = { phonePrefixList = Result.data }
				})
			end
		end)
	end, {})
	
	return ReactModule.createElement(AccountRecoveryContextModule.Provider, {
		value = {
			state = UseReducerResult,
			dispatch = UseReducerResult2,
			parentNavigation = p1.parentNavigation,
			utils = {
				launchApp = LaunchApp,
				renderChallenge = RenderChallenge,
				handleTwoStepVerificationError = HandleTwoStepVerificationError,
				handleContinueRecovery = handleContinueRecovery,
				handleUpdatePassword = handleUpdatePassword,
				launchAppOrGoBack = launchAppOrGoBack
			}
		}
	}, p1.children)
end