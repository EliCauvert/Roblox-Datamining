local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(Modules.LuaApp.Promise)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UserModule = require(script.Parent.User)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local SignUpRequestsModule = require(Modules.LuaApp.Http.Requests.SignUpRequests)
local SignUpV2ErrorCodesModule = require(Modules.LuaApp.Enum.SignUpV2ErrorCodes)
local VerifiedSignupErrorCodesModule = require(Modules.LuaApp.Enum.VerifiedSignupErrorCodes)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local AppSignupCounterNamesModule = require(Modules.LuaApp.Analytics.Events.AppSignupCounterNames)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local GetDxBlobModule = require(Modules.LuaApp.Thunks.Captcha.GetDxBlob)
local GetCaptchaDataModule = require(Modules.LuaApp.Thunks.Captcha.GetCaptchaData)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local CredentialsProtocolModule = require(CorePackages.Workspace.Packages.CredentialsProtocol)
local Constants = CredentialsProtocolModule.Constants
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local FFlagLuaEnableDidSwitchAccountModule = require(Modules.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount)
local GetFFlagConditionallyFireAuthenticatedCredentialsModule = require(Modules.LuaApp.Flags.GetFFlagConditionallyFireAuthenticatedCredentials)
local GetFFlagFixAuthlessPasskeyPopupAccountCreationModule = require(Modules.LuaApp.Flags.GetFFlagFixAuthlessPasskeyPopupAccountCreation)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlagsModule.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local FFlagDisableMemStorageServicePasswordEvent = SharedFlagsModule.FFlagDisableMemStorageServicePasswordEvent
local GetFFlagEnableSavePasswordAfterRecoveryFunction = SharedFlagsModule.GetFFlagEnableSavePasswordAfterRecovery
local RegisterPasskeyModule = require(Modules.LuaApp.Thunks.Authentication.RegisterPasskey)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local ConstantsModule = require(Modules.LuaApp.Constants)
local AuthAnalyticsModule = require(CorePackages.Workspace.Packages.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local IosAuthServiceHealthCounters = AuthAnalyticsModule.RobloxTelemetry.IosAuthServiceHealthCounters
local AccountSwitcherConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants
local IosAuthServiceSignupPasswordSaveModule = require(Modules.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave)
local config = {
	[StatusCodes.TOO_MANY_REQUESTS] = "throttled",
	[StatusCodes.INTERNAL_SERVER_ERROR] = "serverError",
	[StatusCodes.BAD_REQUEST] = "badRequest",
	[StatusCodes.NOT_FOUND] = "notFound"
}

local function coarseSignupErrorBucket(Code, p1, p2)
	-- upvalues: config (copy)
	if Code ~= nil then
		if Code == p2.Captcha then
			return "captcha"
		elseif Code == p2.TooManyAttempts then
			return "throttled"
		elseif Code == p2.InvalidBirthdate then
			return "birthdayInvalid"
		elseif Code == p2.InvalidUsername then
			return "usernameInvalid"
		elseif Code == p2.UsernameAlreadyTaken then
			return "usernameTaken"
		elseif Code == p2.InvalidPassword or Code == p2.UsernameAndPasswordTheSame or Code == p2.PasswordTooSimple then
			return "passwordInvalid"
		elseif Code == p2.InvalidEmail then
			return "emailInvalid"
		elseif Code == p2.UnavailableInRegion then
			return "unavailableInRegion"
		end
	end
	return typeof(p1) == "table" and p1.HttpError == Enum.HttpError.OK and config[p1.StatusCode] or "unknown"
end

local InterfaceResult = TModule.interface({
	birthday = TModule.string,
	username = TModule.string,
	password = TModule.string,
	gender = TModule.string,
	locale = TModule.optional(TModule.string),
	email = TModule.optional(TModule.string),
	verifiedSignupVoucher = TModule.optional(TModule.string)
})

local function signUpRequest(p1, p2, p3, p4)
	-- upvalues: GetAppFeaturePoliciesFunction (copy), SignUpRequestsModule (copy)
	return if GetAppFeaturePoliciesFunction().getUseSingleSignOn() then SignUpRequestsModule.singleSignOnSignup(p1, p2) elseif p4 then SignUpRequestsModule.verifiedSignup(p1, p2, p3) else SignUpRequestsModule.signUpV2(p1, p2, p3)
end

return function(p1, p2, GuiService1, CaptchaCallback, p3, p4, p5, p6, p7, p8, p9, p10, p11, Enabled)
	-- upvalues: InterfaceResult (copy), FFlagEnableLuaAccountSwitchModule (copy), UserModule (copy), ResetAppStateModule (copy), AppStorageUtilitiesModule (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), ConstantsModule (copy), GetFFlagFixAuthlessPasskeyPopupAccountCreationModule (copy), FFlagLuaEnableDidSwitchAccountModule (copy), GuiService (copy), NotificationTypeModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), LaunchAppModule (copy), LaunchContextModule (copy), signUpRequest (copy), ReportEphemeralCounterModule (copy), AppSignupCounterNamesModule (copy), IosAuthServiceHealthCounters (copy), EventStreamConstantsModule (copy), EventStreamConstants (copy), GetFFlagConditionallyFireAuthenticatedCredentialsModule (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeysModule (copy), HttpService (copy), RegisterPasskeyModule (copy), PromiseModule (copy), IosAuthServiceSignupPasswordSaveModule (copy), Default (copy), Constants (copy), Logger (copy), GetFFlagEnableSavePasswordAfterRecoveryFunction (copy), VerifiedSignupErrorCodesModule (copy), SignUpV2ErrorCodesModule (copy), coarseSignupErrorBucket (copy), StatusCodes (copy), GetDxBlobModule (copy), GetCaptchaDataModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p12)
		-- upvalues: InterfaceResult (upval), p6 (copy), FFlagEnableLuaAccountSwitchModule (upval), UserModule (upval), ResetAppStateModule (upval), AppStorageUtilitiesModule (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), ConstantsModule (upval), GetFFlagFixAuthlessPasskeyPopupAccountCreationModule (upval), FFlagLuaEnableDidSwitchAccountModule (upval), GuiService (upval), NotificationTypeModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), LaunchAppModule (upval), p1 (copy), p2 (copy), p4 (copy), p5 (copy), LaunchContextModule (upval), signUpRequest (upval), p3 (copy), p7 (copy), p8 (copy), GuiService1 (copy), ReportEphemeralCounterModule (upval), AppSignupCounterNamesModule (upval), IosAuthServiceHealthCounters (upval), Enabled (copy), p11 (copy), EventStreamConstantsModule (upval), EventStreamConstants (upval), p10 (copy), GetFFlagConditionallyFireAuthenticatedCredentialsModule (upval), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), HttpService (upval), p9 (copy), RegisterPasskeyModule (upval), PromiseModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), Default (upval), Constants (upval), Logger (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), VerifiedSignupErrorCodesModule (upval), SignUpV2ErrorCodesModule (upval), coarseSignupErrorBucket (upval), StatusCodes (upval), GetDxBlobModule (upval), GetCaptchaDataModule (upval), CaptchaCallback (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), SetNetworkingErrorToastModule (upval)
		assert(InterfaceResult(p6))
		
		local function proceedPostSignup(p13, p14)
			-- upvalues: FFlagEnableLuaAccountSwitchModule (upval), UserModule (upval), p12 (copy), ResetAppStateModule (upval), AppStorageUtilitiesModule (upval), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (upval), AccountSwitcherConstants (upval), ConstantsModule (upval), GetFFlagFixAuthlessPasskeyPopupAccountCreationModule (upval), FFlagLuaEnableDidSwitchAccountModule (upval), GuiService (upval), NotificationTypeModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), LaunchAppModule (upval), p1 (upval), p2 (upval), p4 (upval), p5 (upval), LaunchContextModule (upval)
			if FFlagEnableLuaAccountSwitchModule == true then
				local FromLocalStorageResult = UserModule.fromLocalStorage()
				
				if FromLocalStorageResult and FromLocalStorageResult.userId ~= -1 then
					p12:dispatch(ResetAppStateModule())
					AppStorageUtilitiesModule.setAccountSwitchStatus(if FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then AccountSwitcherConstants.AccountSwitcherSwitchedFromSignupStatus else ConstantsModule.Auth.AccountSwitcherSwitchedStatus)
					
					if not GetFFlagFixAuthlessPasskeyPopupAccountCreationModule() then
						AppStorageUtilitiesModule.setAccountBlob(p13.responseBody.accountBlob)
					end
					AppStorageUtilitiesModule.flush()
					
					if FFlagLuaEnableDidSwitchAccountModule then
						GuiService:BroadcastNotification("", NotificationTypeModule.DID_SWITCH_ACCOUNT)
						
						return
					else
						GuiService:BroadcastNotification("", NotificationTypeModule.DID_LOG_OUT)
						
						return
					end
				else
					if not GetFFlagFixAuthlessPasskeyPopupAccountCreationModule() then
						AppStorageUtilitiesModule.setAccountBlob(p13.responseBody.accountBlob)
					end
					AppStorageUtilitiesModule.flush()
					
					if p14 then
						p12:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
						
						return
					else
						p12:dispatch(LaunchAppModule(p1, p2, p4, p5, LaunchContextModule.SignUp))
						
						return
					end
				end
			elseif p14 then
				p12:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.AddAuthMethodPage } }))
				
				return
			else
				p12:dispatch(LaunchAppModule(p1, p2, p4, p5, LaunchContextModule.SignUp))
			end
		end
		
		return signUpRequest(p1, p6, p3, p7):andThen(function(Result)
			-- upvalues: GetFFlagFixAuthlessPasskeyPopupAccountCreationModule (upval), p8 (upval), AppStorageUtilitiesModule (upval), p6 (upval), FFlagEnableLuaAccountSwitchModule (upval), GuiService1 (upval), NotificationTypeModule (upval), ReportEphemeralCounterModule (upval), AppSignupCounterNamesModule (upval), IosAuthServiceHealthCounters (upval), Enabled (upval), p11 (upval), EventStreamConstantsModule (upval), EventStreamConstants (upval), p10 (upval), GetFFlagConditionallyFireAuthenticatedCredentialsModule (upval), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), MemStorageKeysModule (upval), HttpService (upval), p9 (upval), RegisterPasskeyModule (upval), p1 (upval), proceedPostSignup (copy), PromiseModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), Default (upval), Constants (upval), Logger (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval)
			if GetFFlagFixAuthlessPasskeyPopupAccountCreationModule() then
				if p8 then
					AppStorageUtilitiesModule.setSignupActionRequired("auth")
					AppStorageUtilitiesModule.setPasskeySignupUsername(p6.username)
				end
				if FFlagEnableLuaAccountSwitchModule == true then
					AppStorageUtilitiesModule.setAccountBlob(Result.responseBody.accountBlob)
				end
				AppStorageUtilitiesModule.flush()
			end
			GuiService1:BroadcastNotification("", NotificationTypeModule.DID_SIGN_UP)
			ReportEphemeralCounterModule(AppSignupCounterNamesModule.Success, 1)
			IosAuthServiceHealthCounters.reportSignupSuccess({
				credentialType = "password",
				iosAuthServiceEnabled = Enabled == true
			})
			p11.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstants.Field.SignupSuccess)
			local IsLengthAbove: boolean = p6.username and (p6.password and string.len(p6.password) > 0)
			local Enabled1 = p10 and (p6.password and Enabled)
			
			if (not GetFFlagConditionallyFireAuthenticatedCredentialsModule() or IsLengthAbove) and (not FFlagDisableMemStorageServicePasswordEvent and not Enabled1) then
				MemStorageService:Fire(MemStorageKeysModule.AuthenticatedCredentials, HttpService:JSONEncode({
					authType = "signup",
					cvalue = p6.username,
					password = p6.password
				}))
			end
			local function continuePostSignup()
				-- upvalues: p8 (upval), GetFFlagFixAuthlessPasskeyPopupAccountCreationModule (upval), AppStorageUtilitiesModule (upval), p6 (upval), p9 (upval), RegisterPasskeyModule (upval), p1 (upval), p11 (upval), EventStreamConstantsModule (upval), proceedPostSignup (upval), Result (copy), PromiseModule (upval)
				if p8 then
					if not GetFFlagFixAuthlessPasskeyPopupAccountCreationModule() then
						AppStorageUtilitiesModule.setSignupActionRequired("auth")
						AppStorageUtilitiesModule.setPasskeySignupUsername(p6.username)
					end
					if p9 then
						return RegisterPasskeyModule(p1):andThen(function(_)
							-- upvalues: AppStorageUtilitiesModule (upval), p11 (upval), EventStreamConstantsModule (upval), proceedPostSignup (upval), Result (upval), PromiseModule (upval)
							AppStorageUtilitiesModule.setSignupActionRequired("")
							p11.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasskeyCreated, "success")
							AppStorageUtilitiesModule.flush()
							proceedPostSignup(Result, false)
							
							return PromiseModule.resolve()
						end, function(p13)
							-- upvalues: p11 (upval), EventStreamConstantsModule (upval), AppStorageUtilitiesModule (upval), proceedPostSignup (upval), Result (upval), PromiseModule (upval)
							if p13.name then
								p11.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasskeyCreated, p13.name)
								
								if type(p13.body) == "string" then
									p11.reportAuthClientError(EventStreamConstantsModule.Context.SignupPasskeyCreated, p13.body, p13.source)
								end
							else
								p11.reportAuthModalShown(EventStreamConstantsModule.Context.SignupPasskeyCreated, "unknown")
							end
							AppStorageUtilitiesModule.flush()
							proceedPostSignup(Result, true)
							
							return PromiseModule.resolve()
						end)
					end
				end
				AppStorageUtilitiesModule.flush()
				proceedPostSignup(Result, p8)
				
				return PromiseModule.resolve()
			end
			
			if p10 and p6.password then
				local Json = HttpService:JSONEncode({ username = p6.username, password = p6.password })
				
				local function v59()
					-- upvalues: Enabled (upval), p11 (upval), EventStreamConstantsModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), p6 (upval), Default (upval), Json (copy), Constants (upval), HttpService (upval), Logger (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), continuePostSignup (copy)
					if Enabled then
						p11.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServiceSignup, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordAttempted)
						IosAuthServiceSignupPasswordSaveModule.reportAttempted(p6.username)
					end
					return Default:registerCredentials(Default.CredentialsTypes.password, Json, Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(Result)
						-- upvalues: HttpService (upval), Logger (upval), p11 (upval), EventStreamConstantsModule (upval), Enabled (upval), IosAuthServiceSignupPasswordSaveModule (upval), p6 (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), continuePostSignup (upval)
						local Data = if Result then HttpService:JSONDecode(Result) else {}
						
						if Data and Data.errorCode == nil then
							Logger:info("Successfully registered password.")
							p11.reportAuthButtonClick(EventStreamConstantsModule.Context.CMPasswordSignup, EventStreamConstantsModule.Button.SavePassword)
							
							if Enabled then
								p11.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServiceSignup, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordSuccess)
								IosAuthServiceSignupPasswordSaveModule.reportSuccess(p6.username)
							end
							IosAuthServiceHealthCounters.reportPasswordSaveSuccess({
								credentialType = "password",
								iosAuthServiceEnabled = Enabled == true
							})
						else
							Logger:warning("Error registering password: ", Data.errorMsg)
							
							if Enabled then
								p11.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServiceSignup, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordFailure, Data.errorMsg or "unknown")
								IosAuthServiceSignupPasswordSaveModule.reportFailure(p6.username, Data.errorMsg or "unknown")
							end
							IosAuthServiceHealthCounters.reportPasswordSaveFailure({
								credentialType = "password",
								errorCode = if Data and Data.errorCode ~= nil then tostring(Data.errorCode) else "unknown",
								iosAuthServiceEnabled = Enabled == true
							})
						end
						return if GetFFlagEnableSavePasswordAfterRecoveryFunction() and Enabled then continuePostSignup() else nil
					end, function(p13)
						-- upvalues: Logger (upval), Enabled (upval), p11 (upval), EventStreamConstantsModule (upval), IosAuthServiceSignupPasswordSaveModule (upval), p6 (upval), IosAuthServiceHealthCounters (upval), GetFFlagEnableSavePasswordAfterRecoveryFunction (upval), continuePostSignup (upval)
						Logger:warning("Error registering password: ", p13)
						
						if Enabled then
							p11.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServiceSignup, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordFailure, (tostring(p13)))
							IosAuthServiceSignupPasswordSaveModule.reportFailure(p6.username, (tostring(p13)))
						end
						IosAuthServiceHealthCounters.reportPasswordSaveFailure({
							credentialType = "password",
							errorCode = "transportError",
							iosAuthServiceEnabled = Enabled == true
						})
						
						return if GetFFlagEnableSavePasswordAfterRecoveryFunction() and Enabled then continuePostSignup() else nil
					end)
				end
				
				if GetFFlagEnableSavePasswordAfterRecoveryFunction() and Enabled then
					return v59()
				end
				v59()
			elseif Enabled then
				if p10 then
					if not p6.password then
						p11.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServiceSignup, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordSkipped, EventStreamConstantsModule.State.IosAuthServiceMissingCredentials)
						IosAuthServiceSignupPasswordSaveModule.reportSkipped(EventStreamConstantsModule.State.IosAuthServiceMissingCredentials)
					end
				else
					p11.reportAuthButtonClick(EventStreamConstantsModule.Context.IosAuthServiceSignup, EventStreamConstantsModule.Button.IosAuthServiceSavePasswordSkipped, EventStreamConstantsModule.State.IosAuthServiceProtocolNotAvailable)
					IosAuthServiceSignupPasswordSaveModule.reportSkipped(EventStreamConstantsModule.State.IosAuthServiceProtocolNotAvailable)
				end
			end
			return continuePostSignup()
		end, function(p13)
			-- upvalues: HttpService (upval), ReportEphemeralCounterModule (upval), AppSignupCounterNamesModule (upval), p7 (upval), VerifiedSignupErrorCodesModule (upval), SignUpV2ErrorCodesModule (upval), IosAuthServiceHealthCounters (upval), coarseSignupErrorBucket (upval), Enabled (upval), StatusCodes (upval), GetDxBlobModule (upval), GetCaptchaDataModule (upval), AppPageModule (upval), CaptchaCallback (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p12 (copy), NavigateDownModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), FFlagEnableLuaAccountSwitchModule (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), p13 (copy)
				return HttpService:JSONDecode(p13.Body)
			end)
			
			if not Success then
				IosAuthServiceHealthCounters.reportSignupFailure({
					credentialType = "password",
					errorCode = "unknown",
					iosAuthServiceEnabled = Enabled == true
				})
				p12:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
				
				return PromiseModule.reject()
			end
			local Code = Result.errors and (Result.errors[1] and Result.errors[1].code)
			ReportEphemeralCounterModule(AppSignupCounterNamesModule.Failure, 1)
			local VerifiedSignupErrorCodesModule1 = p7 and VerifiedSignupErrorCodesModule or SignUpV2ErrorCodesModule
			IosAuthServiceHealthCounters.reportSignupFailure({
				credentialType = "password",
				errorCode = coarseSignupErrorBucket(Code, p13, VerifiedSignupErrorCodesModule1),
				iosAuthServiceEnabled = Enabled == true
			})
			
			if Code and Code == VerifiedSignupErrorCodesModule1.Captcha then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureCaptcha, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.TooManyAttempts then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureThrottled, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.InvalidBirthdate then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureBirthdayInvalid, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.InvalidUsername then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureUsernameInvalid, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.UsernameAlreadyTaken then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureUsernameTaken, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.InvalidPassword then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailurePasswordInvalid, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.UsernameAndPasswordTheSame then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailurePasswordMatchesUsername, 1)
			elseif Code and Code == VerifiedSignupErrorCodesModule1.PasswordTooSimple then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailurePasswordTooSimple, 1)
			elseif Code == VerifiedSignupErrorCodesModule1.UnavailableInRegion then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureUnavailableInRegion, 1)
			elseif p13.HttpError == Enum.HttpError.OK and p13.StatusCode == StatusCodes.TOO_MANY_REQUESTS then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureThrottled, 1)
			elseif p13.HttpError == Enum.HttpError.OK and p13.StatusCode == StatusCodes.INTERNAL_SERVER_ERROR then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureInternalServerError, 1)
			elseif p13.HttpError == Enum.HttpError.OK and p13.StatusCode == StatusCodes.BAD_REQUEST then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureBadRequest, 1)
			elseif p13.HttpError == Enum.HttpError.OK and p13.StatusCode == StatusCodes.NOT_FOUND then
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureNotFound, 1)
			else
				ReportEphemeralCounterModule(AppSignupCounterNamesModule.FailureUnknownError, 1)
			end
			if Code == VerifiedSignupErrorCodesModule1.Captcha then
				local _ = GetDxBlobModule(Result)
				local CaptchaDataModule, CaptchaDataModule2 = GetCaptchaDataModule(Result)
				local config = {
					detail = "",
					name = AppPageModule.CaptchaNative,
					extraProps = {
						captchaType = "signup",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = CaptchaCallback,
						captchaId = CaptchaDataModule,
						dxBlob = CaptchaDataModule2
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				else
					p12:dispatch(NavigateDownModule(config))
				end
			elseif Code == VerifiedSignupErrorCodesModule1.InvalidEmail then
				p12:dispatch(SetCurrentToastMessageModule({
					toastMessage = "Authentication.SignUp.Response.InvalidEmail",
					toastType = ToastTypeModule.NetworkingError
				}))
			elseif Code == VerifiedSignupErrorCodesModule1.InvalidPassword then
				p12:dispatch(SetCurrentToastMessageModule({
					toastMessage = "Authentication.SignUp.Response.PasswordComplexity",
					toastType = ToastTypeModule.NetworkingError
				}))
			elseif Code == VerifiedSignupErrorCodesModule1.UnavailableInRegion then
				p12:dispatch(SetCurrentToastMessageModule({
					toastMessage = "Authentication.SignUp.Description.RobloxNotAvailableInRegion",
					toastType = ToastTypeModule.NetworkingError
				}))
			elseif (FFlagEnableLuaAccountSwitchModule ~= true or Code ~= VerifiedSignupErrorCodesModule1.EmptyAccountSwitchBlobRequired) and Code ~= VerifiedSignupErrorCodesModule1.ParentEmptyAccountSwitchBlobRequired then
				p12:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
			end
			return PromiseModule.reject(Code)
		end)
	end
end