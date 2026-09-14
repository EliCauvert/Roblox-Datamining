local authSignup = script:FindFirstAncestor("AuthSignup")
local parent = authSignup.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local _ = require(parent.Http)
local url = require(parent.Http).Url
local authCommonModule = require(parent.AuthCommon)
local getSingleSignOnUrls = authCommonModule.Utils.getSingleSignOnUrls
local appStorageUtilities = authCommonModule.Utils.AppStorageUtilities
local consoleAuthRequestWrapper = require(parent.Http).Utils.ConsoleAuthRequestWrapper
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableLuaAccountSwitch = sharedFlagsModule.FFlagEnableLuaAccountSwitch
local fFlagEnableKoreaKISACompliance = sharedFlagsModule.FFlagEnableKoreaKISACompliance
local getFFlagEnableAuditForSinglePageSignUp = sharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local getFFlagEnableAuditForSso = sharedFlagsModule.GetFFlagEnableAuditForSso
local signUpV2ErrorCodesModule = require(authSignup.Enums.SignUpV2ErrorCodes)
local tModule = require(parent.t)
local t = {
	signUp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: url (ref), httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilities (ref)
		assert(type(p2) == "string", "invalid username has been passed into SignUpRequests.signUp")
		assert(type(p3) == "string", "invalid password has been passed into SignUpRequests.signUp")
		assert(type(p4) == "string", "invalid birthdate has been passed into SignUpRequests.signUp")
		assert(tonumber(p5) and type(p5) == "string", "invalid bundleId has been passed into SignUpRequests.signUp")
		
		return p1(string.format("%sv3/signup", url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				username = p2,
				password = p3,
				birthdate = p4,
				bundleId = p5,
				captchaId = if p6 then p6.captchaId else nil,
				captchaToken = if p6 then p6.captchaToken else nil,
				captchaProvider = if p6 then p6.captchaProvider else nil,
				accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilities.getAccountBlob() or nil
			})
		})
	end
}
local var1 = tModule.union(tModule.interface({
	username = tModule.string,
	password = tModule.string,
	gender = tModule.string,
	birthday = tModule.string,
	displayName = tModule.optional(tModule.string),
	locale = tModule.optional(tModule.string),
	email = tModule.optional(tModule.string)
}), tModule.interface({
	username = tModule.string,
	isExpressSignup = tModule.literal(true)
}))

function t.signUpV2(p1, p2, p3)
	-- upvalues: var1 (ref), url (ref), httpService (ref), fFlagEnableKoreaKISACompliance (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilities (ref), getFFlagEnableAuditForSinglePageSignUp (ref)
	assert(var1(p2))
	
	return p1(string.format("%sv2/signup", url.AUTH_URL), "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			isTosAgreementBoxChecked = true,
			username = p2.username,
			password = p2.password,
			gender = p2.gender,
			birthday = p2.birthday,
			locale = p2.locale,
			email = p2.email,
			otpSession = if fFlagEnableKoreaKISACompliance then p2.otpSession else nil,
			agreementIds = p2.agreementIds,
			displayName = p2.displayName,
			captchaId = if p3 then p3.captchaId else nil,
			captchaToken = if p3 then p3.captchaToken else nil,
			captchaProvider = if p3 then p3.captchaProvider else nil,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilities.getAccountBlob() or nil,
			passkeySessionId = p2.passkeySessionId,
			passkeyRegistrationResponse = p2.passkeyRegistrationResponse,
			isExpressSignup = p2.isExpressSignup,
			auditSystemContent = if getFFlagEnableAuditForSinglePageSignUp() and p2.capturedAuditContent and next(p2.capturedAuditContent) ~= nil then {
				capturedAuditContent = p2.capturedAuditContent,
				additionalAuditContent = p2.additionalAuditContent
			} else nil
		})
	})
end

local var2 = tModule.interface({
	username = tModule.string,
	password = tModule.string,
	gender = tModule.string,
	birthday = tModule.string,
	verifiedSignupVoucher = tModule.string
})

function t.verifiedSignup(p1, p2, p3)
	-- upvalues: var2 (ref), url (ref), httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilities (ref)
	assert(var2(p2))
	
	return p1(string.format("%sv1/verified-signup", url.AUTH_URL), "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			isTosAgreementBoxChecked = true,
			username = p2.username,
			password = p2.password,
			gender = p2.gender,
			birthday = p2.birthday,
			voucher = p2.verifiedSignupVoucher,
			agreementIds = p2.agreementIds,
			captchaId = if p3 then p3.captchaId else nil,
			captchaToken = if p3 then p3.captchaToken else nil,
			captchaProvider = if p3 then p3.captchaProvider else nil,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilities.getAccountBlob() or nil
		})
	})
end

function t.singleSignOnSignup(p1, p2)
	-- upvalues: getSingleSignOnUrls (ref), getFFlagEnableAuditForSso (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), signUpV2ErrorCodesModule (ref)
	local var3 = getSingleSignOnUrls()
	local signup = var3.signup
	
	return if signup then consoleAuthRequestWrapper(p1, signup(), "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			isTosAgreementBoxChecked = true,
			username = p2.username,
			password = p2.password,
			gender = p2.gender,
			birthday = p2.birthday,
			locale = p2.locale,
			email = p2.email,
			agreementIds = p2.agreementIds,
			isExpressSignup = p2.isExpressSignup,
			accountLinkParameters = if var3.linkingPlatform then { LinkingPlatform = var3.linkingPlatform } else nil,
			auditSystemContent = if getFFlagEnableAuditForSso() and p2.capturedAuditContent and next(p2.capturedAuditContent) ~= nil then {
				capturedAuditContent = p2.capturedAuditContent,
				additionalAuditContent = p2.additionalAuditContent
			} else nil
		})
	}) else promiseModule.reject(signUpV2ErrorCodesModule.TokenValidationFailed)
end

function t.expressLinkedSignup(p1, p2, p3)
	-- upvalues: getSingleSignOnUrls (ref), promiseModule (ref), signUpV2ErrorCodesModule (ref), httpService (ref), consoleAuthRequestWrapper (ref)
	local var3 = getSingleSignOnUrls()
	local signup = var3.signup
	local linkingPlatform = var3.linkingPlatform
	
	return if signup and linkingPlatform ~= nil and type(p2) == "string" then consoleAuthRequestWrapper(p1, signup(), "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			signupType = "Express",
			locale = p2,
			agreementIds = p3,
			accountLinkParameters = { LinkingPlatform = linkingPlatform }
		})
	}, true) else promiseModule.reject(signUpV2ErrorCodesModule.TokenValidationFailed)
end

return t