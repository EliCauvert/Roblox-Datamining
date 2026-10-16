local AuthSignup = script:FindFirstAncestor("AuthSignup")
local Parent = AuthSignup.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.Http)
local Url = require(Parent.Http).Url
local AuthCommonModule = require(Parent.AuthCommon)
local GetSingleSignOnUrlsFunction = AuthCommonModule.Utils.getSingleSignOnUrls
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local ConsoleAuthRequestWrapperFunction = require(Parent.Http).Utils.ConsoleAuthRequestWrapper
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableLuaAccountSwitch = SharedFlagsModule.FFlagEnableLuaAccountSwitch
local FFlagEnableKoreaKISACompliance = SharedFlagsModule.FFlagEnableKoreaKISACompliance
local GetFFlagEnableAuditForSinglePageSignUpFunction = SharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local GetFFlagEnableAuditForSsoFunction = SharedFlagsModule.GetFFlagEnableAuditForSso
local SignUpV2ErrorCodesModule = require(AuthSignup.Enums.SignUpV2ErrorCodes)
local TModule = require(Parent.t)
local UnionResult = TModule.union(TModule.interface({
	username = TModule.string,
	password = TModule.string,
	gender = TModule.string,
	birthday = TModule.string,
	displayName = TModule.optional(TModule.string),
	locale = TModule.optional(TModule.string),
	email = TModule.optional(TModule.string)
}), (TModule.interface({
	username = TModule.string,
	isExpressSignup = TModule.literal(true)
})))
local InterfaceResult = TModule.interface({
	username = TModule.string,
	password = TModule.string,
	gender = TModule.string,
	birthday = TModule.string,
	verifiedSignupVoucher = TModule.string
})

return {
	signUp = function(Callback, Username, Password, Birthdate, BundleId, p1) --[[ Line: 40 ]]
		-- upvalues: Url (copy), HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy)
		assert(type(Username) == "string", "invalid username has been passed into SignUpRequests.signUp")
		assert(type(Password) == "string", "invalid password has been passed into SignUpRequests.signUp")
		assert(type(Birthdate) == "string", "invalid birthdate has been passed into SignUpRequests.signUp")
		assert(tonumber(BundleId) and type(BundleId) == "string", "invalid bundleId has been passed into SignUpRequests.signUp")
		
		return Callback(string.format("%sv3/signup", Url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				username = Username,
				password = Password,
				birthdate = Birthdate,
				bundleId = BundleId,
				captchaId = p1 and p1.captchaId or nil,
				captchaToken = p1 and p1.captchaToken or nil,
				captchaProvider = p1 and p1.captchaProvider or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or nil
			})
		})
	end,
	signUpV2 = function(Callback, p1, p2) --[[ Line: 121 ]]
		-- upvalues: UnionResult (copy), Url (copy), HttpService (copy), FFlagEnableKoreaKISACompliance (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy)
		assert(UnionResult(p1))
		
		return Callback(string.format("%sv2/signup", Url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				isTosAgreementBoxChecked = true,
				username = p1.username,
				password = p1.password,
				gender = p1.gender,
				birthday = p1.birthday,
				locale = p1.locale,
				email = p1.email,
				otpSession = if FFlagEnableKoreaKISACompliance then p1.otpSession else nil,
				agreementIds = p1.agreementIds,
				displayName = p1.displayName,
				captchaId = p2 and p2.captchaId or nil,
				captchaToken = p2 and p2.captchaToken or nil,
				captchaProvider = p2 and p2.captchaProvider or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or nil,
				passkeySessionId = p1.passkeySessionId,
				passkeyRegistrationResponse = p1.passkeyRegistrationResponse,
				isExpressSignup = p1.isExpressSignup,
				auditSystemContent = if GetFFlagEnableAuditForSinglePageSignUpFunction() and p1.capturedAuditContent and next(p1.capturedAuditContent) ~= nil then {
					capturedAuditContent = p1.capturedAuditContent,
					additionalAuditContent = p1.additionalAuditContent
				} else nil
			})
		})
	end,
	verifiedSignup = function(Callback, p1, p2) --[[ Line: 169 ]]
		-- upvalues: InterfaceResult (copy), Url (copy), HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy)
		assert(InterfaceResult(p1))
		
		return Callback(string.format("%sv1/verified-signup", Url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				isTosAgreementBoxChecked = true,
				username = p1.username,
				password = p1.password,
				gender = p1.gender,
				birthday = p1.birthday,
				voucher = p1.verifiedSignupVoucher,
				agreementIds = p1.agreementIds,
				captchaId = p2 and p2.captchaId or nil,
				captchaToken = p2 and p2.captchaToken or nil,
				captchaProvider = p2 and p2.captchaProvider or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or nil
			})
		})
	end,
	singleSignOnSignup = function(p1, p2) --[[ Line: 194 ]]
		-- upvalues: GetSingleSignOnUrlsFunction (copy), GetFFlagEnableAuditForSsoFunction (copy), HttpService (copy), ConsoleAuthRequestWrapperFunction (copy), PromiseModule (copy), SignUpV2ErrorCodesModule (copy)
		local SingleSignOnUrls = GetSingleSignOnUrlsFunction()
		local SignupFunction = SingleSignOnUrls.signup
		local Json = HttpService:JSONEncode({
			isTosAgreementBoxChecked = true,
			username = p2.username,
			password = p2.password,
			gender = p2.gender,
			birthday = p2.birthday,
			locale = p2.locale,
			email = p2.email,
			agreementIds = p2.agreementIds,
			isExpressSignup = p2.isExpressSignup,
			accountLinkParameters = if SingleSignOnUrls.linkingPlatform then { LinkingPlatform = SingleSignOnUrls.linkingPlatform } else nil,
			auditSystemContent = if GetFFlagEnableAuditForSsoFunction() and p2.capturedAuditContent and next(p2.capturedAuditContent) ~= nil then {
				capturedAuditContent = p2.capturedAuditContent,
				additionalAuditContent = p2.additionalAuditContent
			} else nil
		})
		
		return if SignupFunction then ConsoleAuthRequestWrapperFunction(p1, SignupFunction(), "POST", { maxRetryCount = 0, postBody = Json }) else PromiseModule.reject(SignUpV2ErrorCodesModule.TokenValidationFailed)
	end,
	expressLinkedSignup = function(p1, Locale, AgreementIds) --[[ Line: 236 ]]
		-- upvalues: GetSingleSignOnUrlsFunction (copy), PromiseModule (copy), SignUpV2ErrorCodesModule (copy), HttpService (copy), ConsoleAuthRequestWrapperFunction (copy)
		local SingleSignOnUrls = GetSingleSignOnUrlsFunction()
		local SignupFunction = SingleSignOnUrls.signup
		local LinkingPlatform = SingleSignOnUrls.linkingPlatform
		
		return if SignupFunction and LinkingPlatform ~= nil and type(Locale) == "string" then ConsoleAuthRequestWrapperFunction(p1, SignupFunction(), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				signupType = "Express",
				locale = Locale,
				agreementIds = AgreementIds,
				accountLinkParameters = { LinkingPlatform = LinkingPlatform }
			})
		}, true) else PromiseModule.reject(SignUpV2ErrorCodesModule.TokenValidationFailed)
	end
}