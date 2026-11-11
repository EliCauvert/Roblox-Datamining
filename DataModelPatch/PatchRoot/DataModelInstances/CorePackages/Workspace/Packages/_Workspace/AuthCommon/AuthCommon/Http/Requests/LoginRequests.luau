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

function getLoginUrl(): string
	-- upvalues: Url (copy)
	return string.format("%sv2/login", Url.AUTH_URL)
end

return {
	logByPasskey = function(Callback, Input, Password)
		-- upvalues: HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy)
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				ctype = "Passkey",
				cvalue = HttpService:JSONEncode(Input),
				password = Password,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	logByUsername = function(Callback, Cvalue, Password, p1, p2)
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy)
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				ctype = "Username",
				cvalue = Cvalue,
				password = Password,
				captchaToken = p1 and p1.captchaToken or nil,
				captchaProvider = p1 and p1.captchaProvider or nil,
				captchaId = p1 and p1.captchaId or nil,
				securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.sessionId or nil,
				securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.redemptionToken or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	logByEmail = function(Callback, Cvalue, Password, p1, p2, p3)
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy)
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				ctype = "Email",
				cvalue = Cvalue,
				password = Password,
				captchaToken = p1 and p1.captchaToken or nil,
				captchaProvider = p1 and p1.captchaProvider or nil,
				captchaId = p1 and p1.captchaId or nil,
				securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.sessionId or nil,
				securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.redemptionToken or nil,
				userId = GetFFlagEnableLoginAccountSelectorFunction() and p3 or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	logByPhone = function(Callback, Cvalue, Password, p1, p2, p3)
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy)
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				ctype = "PhoneNumber",
				cvalue = Cvalue,
				password = Password,
				captchaToken = p1 and p1.captchaToken or nil,
				captchaProvider = p1 and p1.captchaProvider or nil,
				captchaId = p1 and p1.captchaId or nil,
				securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.sessionId or nil,
				securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.redemptionToken or nil,
				userId = GetFFlagEnableLoginAccountSelectorFunction() and p3 or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	loginWithCode = function(Callback, Cvalue, Password, p1, p2)
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy)
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				ctype = "AuthToken",
				cvalue = Cvalue,
				password = Password,
				captchaToken = p1 and p1.captchaToken or nil,
				captchaProvider = p1 and p1.captchaProvider or nil,
				captchaId = p1 and p1.captchaId or nil,
				securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.sessionId or nil,
				securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p2 and p2.redemptionToken or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	logByOtp = function(Callback, Cvalue, Password, p1, p2)
		-- upvalues: HttpService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy)
		return Callback(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				ctype = "EmailOtpSessionToken",
				cvalue = Cvalue,
				password = Password,
				securityQuestionSessionId = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.sessionId or nil,
				securityQuestionRedemptionToken = GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and p1 and p1.redemptionToken or nil,
				userId = GetFFlagEnableLoginAccountSelectorFunction() and p2 or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	singleSignOnLogin = function(p1)
		-- upvalues: GetSingleSignOnUrlsModule (copy), HttpService (copy), ConsoleAuthRequestWrapperFunction (copy), PromiseModule (copy), LoginErrorCodesModule (copy)
		local SingleSignOnUrlsModule = GetSingleSignOnUrlsModule()
		local LoginFunction = SingleSignOnUrlsModule.login
		
		return if LoginFunction then ConsoleAuthRequestWrapperFunction(p1, LoginFunction(), "POST", {
			maxRetryCount = 0,
			postBody = if SingleSignOnUrlsModule.linkingPlatform then HttpService:JSONEncode({
				identityProvider = SingleSignOnUrlsModule.linkingPlatform
			}) else "{}"
		}) else PromiseModule.reject({ errorCode = LoginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCode = function(p1, Cvalue, Password)
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
	singleSignOnConnectWithCredential = function(p1, Cvalue, Password, Ctype)
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