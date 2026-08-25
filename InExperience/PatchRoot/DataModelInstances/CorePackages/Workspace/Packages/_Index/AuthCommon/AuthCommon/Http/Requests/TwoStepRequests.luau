local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local url = require(parent.Http).Url
local consoleAuthRequestWrapper = require(parent.Http).Utils.ConsoleAuthRequestWrapper
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch

return {
	configuration = function(p0, p1)
		-- upvalues: url (ref)
		return p0(string.format("%sv1/users/%d/configuration", url.TWOSTEPVERIFICATION_URL, p1), "GET")
	end,
	resend = function(p2, p3, p4)
		-- upvalues: url (ref), httpService (ref)
		return p2(string.format("%sv1/twostepverification/resend", url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({ actionType = "Login", username = p3, ticket = p4 })
		})
	end,
	verify = function(p5, p6, p7, p8, p9)
		-- upvalues: url (ref), httpService (ref)
		return p5(string.format("%sv1/twostepverification/verify", url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				actionType = "Login",
				username = p6,
				ticket = p7,
				code = p8,
				rememberDevice = p9
			})
		})
	end,
	login = function(p10, p11, p12, p13, p14)
		-- upvalues: url (ref), getAppFeaturePolicies (ref), httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref), consoleAuthRequestWrapper (ref)
		local formattedText = string.format("%sv3/users/%s/two-step-verification/login", url.AUTH_URL, p11)
		local var4 = getAppFeaturePolicies()
		local var5 = httpService:JSONEncode({
			challengeId = p12,
			verificationToken = p13,
			rememberDevice = p14,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil,
			accountLinkParameters = if var4.getLinkingPlatform() then { LinkingPlatform = var4.getLinkingPlatform() } else nil
		})
		
		return if var4.getUseSingleSignOn() and var4.getLinkedAuthEndpointsEnabled() then consoleAuthRequestWrapper(p10, formattedText, "POST", { maxRetryCount = 0, postBody = var5 }) else p10(formattedText, "POST", { maxRetryCount = 0, postBody = var5 })
	end
}