local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local GetSingleSignOnUrlsModule = require(AuthCommon.Utils.getSingleSignOnUrls)
local ConsoleAuthRequestWrapperFunction = require(Parent.Http).Utils.ConsoleAuthRequestWrapper
local HttpService = game:GetService("HttpService")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction = require(Parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local GetFFlagEnableLoginAccountSelectorFunction = require(Parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local FFlagEnableLuaAccountSwitch = require(Parent.SharedFlags).FFlagEnableLuaAccountSwitch
local FFlagClearAccountBlobForPioneerLoginModule = require(AuthCommon.Flags.FFlagClearAccountBlobForPioneerLogin)
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch

function getLoginUrl(): string --[[ Line: 30 ]]
	-- upvalues: Url (copy)
	return string.format("%sv2/login", Url.AUTH_URL)
end

local function _() --[[ Line: 34 | Named "getAccountBlobForLogin" ]]
	-- upvalues: FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
	if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
		AppStorageUtilitiesModule.setAccountBlob("")
		AppStorageUtilitiesModule.flush()
	end
	return FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
end

return {
	logByPasskey = function(Callback, Input, Password) --[[ Line: 42 ]]
		-- upvalues: HttpService (copy), FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
		local config = {
			ctype = "Passkey",
			cvalue = HttpService:JSONEncode(Input),
			password = Password
		}
		
		if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
			AppStorageUtilitiesModule.setAccountBlob("")
			AppStorageUtilitiesModule.flush()
		end
		config.accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode(config)
		})
	end,
	logByUsername = function(Callback, Cvalue, Password, Input, p1) --[[ Line: 52 ]]
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
		local config = {
			ctype = "Username",
			cvalue = Cvalue,
			password = Password,
			captchaToken = Input and Input.captchaToken or nil,
			captchaProvider = Input and Input.captchaProvider or nil,
			captchaId = Input and Input.captchaId or nil,
			securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.sessionId or nil,
			securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.redemptionToken or nil
		}
		
		if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
			AppStorageUtilitiesModule.setAccountBlob("")
			AppStorageUtilitiesModule.flush()
		end
		config.accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode(config)
		})
	end,
	logByEmail = function(Callback, Cvalue, Password, Input, p1, p2) --[[ Line: 73 ]]
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
		local config = {
			ctype = "Email",
			cvalue = Cvalue,
			password = Password,
			captchaToken = Input and Input.captchaToken or nil,
			captchaProvider = Input and Input.captchaProvider or nil,
			captchaId = Input and Input.captchaId or nil,
			securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.sessionId or nil,
			securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.redemptionToken or nil,
			userId = GetFFlagEnableLoginAccountSelectorFunction() and p2 or nil
		}
		
		if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
			AppStorageUtilitiesModule.setAccountBlob("")
			AppStorageUtilitiesModule.flush()
		end
		config.accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode(config)
		})
	end,
	logByPhone = function(Callback, Cvalue, Password, Input, p1, p2) --[[ Line: 95 ]]
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
		local config = {
			ctype = "PhoneNumber",
			cvalue = Cvalue,
			password = Password,
			captchaToken = Input and Input.captchaToken or nil,
			captchaProvider = Input and Input.captchaProvider or nil,
			captchaId = Input and Input.captchaId or nil,
			securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.sessionId or nil,
			securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.redemptionToken or nil,
			userId = GetFFlagEnableLoginAccountSelectorFunction() and p2 or nil
		}
		
		if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
			AppStorageUtilitiesModule.setAccountBlob("")
			AppStorageUtilitiesModule.flush()
		end
		config.accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode(config)
		})
	end,
	loginWithCode = function(Callback, Cvalue, Password, Input, p1) --[[ Line: 117 ]]
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
		local config = {
			ctype = "AuthToken",
			cvalue = Cvalue,
			password = Password,
			captchaToken = Input and Input.captchaToken or nil,
			captchaProvider = Input and Input.captchaProvider or nil,
			captchaId = Input and Input.captchaId or nil,
			securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.sessionId or nil,
			securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.redemptionToken or nil
		}
		
		if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
			AppStorageUtilitiesModule.setAccountBlob("")
			AppStorageUtilitiesModule.flush()
		end
		config.accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode(config)
		})
	end,
	logByOtp = function(Callback, Cvalue, Password, p1, p2) --[[ Line: 138 ]]
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), FFlagClearAccountBlobForPioneerLoginModule (copy), IsPioneerLaunchFunction (copy), AppStorageUtilitiesModule (copy), FFlagEnableLuaAccountSwitch (copy)
		local config = {
			ctype = "EmailOtpSessionToken",
			cvalue = Cvalue,
			password = Password,
			securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.sessionId or nil,
			securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.redemptionToken or nil,
			userId = GetFFlagEnableLoginAccountSelectorFunction() and p2 or nil
		}
		
		if FFlagClearAccountBlobForPioneerLoginModule and IsPioneerLaunchFunction() then
			AppStorageUtilitiesModule.setAccountBlob("")
			AppStorageUtilitiesModule.flush()
		end
		config.accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode(config)
		})
	end,
	singleSignOnLogin = function(p1) --[[ Line: 157 ]]
		-- upvalues: GetSingleSignOnUrlsModule (copy), HttpService (copy), ConsoleAuthRequestWrapperFunction (copy), PromiseModule (copy), LoginErrorCodesModule (copy)
		local SingleSignOnUrlsModule = GetSingleSignOnUrlsModule()
		local LoginFunction = SingleSignOnUrlsModule.login
		
		return if LoginFunction then ConsoleAuthRequestWrapperFunction(p1, LoginFunction(), "POST", {
			maxRetryCount = 0,
			postBody = if SingleSignOnUrlsModule.linkingPlatform then HttpService:JSONEncode({
				identityProvider = SingleSignOnUrlsModule.linkingPlatform
			}) else "{}"
		}, true) else PromiseModule.reject({ errorCode = LoginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCode = function(p1, Cvalue, Password) --[[ Line: 181 ]]
		-- upvalues: GetSingleSignOnUrlsModule (copy), HttpService (copy), ConsoleAuthRequestWrapperFunction (copy), PromiseModule (copy), LoginErrorCodesModule (copy)
		local SingleSignOnUrlsModule = GetSingleSignOnUrlsModule()
		local ConnectFunction = SingleSignOnUrlsModule.connect
		local Json = HttpService:JSONEncode({
			ctype = "AuthToken",
			cvalue = Cvalue,
			password = Password,
			accountLinkParameters = if SingleSignOnUrlsModule.linkingPlatform then { LinkingPlatform = SingleSignOnUrlsModule.linkingPlatform } else nil
		})
		
		return if ConnectFunction then ConsoleAuthRequestWrapperFunction(p1, ConnectFunction(), "POST", { maxRetryCount = 0, postBody = Json }) else PromiseModule.reject({ errorCode = LoginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCredential = function(p1, Cvalue, Password, Ctype) --[[ Line: 210 ]]
		-- upvalues: GetSingleSignOnUrlsModule (copy), HttpService (copy), ConsoleAuthRequestWrapperFunction (copy), PromiseModule (copy), LoginErrorCodesModule (copy)
		local SingleSignOnUrlsModule = GetSingleSignOnUrlsModule()
		local ConnectFunction = SingleSignOnUrlsModule.connect
		local Json = HttpService:JSONEncode({
			ctype = Ctype,
			cvalue = Cvalue,
			password = Password,
			accountLinkParameters = if SingleSignOnUrlsModule.linkingPlatform then { LinkingPlatform = SingleSignOnUrlsModule.linkingPlatform } else nil
		})
		
		return if ConnectFunction then ConsoleAuthRequestWrapperFunction(p1, ConnectFunction(), "POST", { maxRetryCount = 0, postBody = Json }) else PromiseModule.reject({ errorCode = LoginErrorCodesModule.ServiceUnavailable })
	end
}