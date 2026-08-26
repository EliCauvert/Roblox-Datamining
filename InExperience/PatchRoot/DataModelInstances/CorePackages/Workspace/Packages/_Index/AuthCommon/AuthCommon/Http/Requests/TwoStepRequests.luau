local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local url = require(parent.Http).Url
local consoleAuthRequestWrapper = require(parent.Http).Utils.ConsoleAuthRequestWrapper
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch

return {
	configuration = function(p1, p2)
		-- upvalues: url (ref)
		return p1(string.format("%sv1/users/%d/configuration", url.TWOSTEPVERIFICATION_URL, p2), "GET")
	end,
	resend = function(p1, p2, p3)
		-- upvalues: url (ref), httpService (ref)
		return p1(string.format("%sv1/twostepverification/resend", url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({ actionType = "Login", username = p2, ticket = p3 })
		})
	end,
	verify = function(p1, p2, p3, p4, p5)
		-- upvalues: url (ref), httpService (ref)
		return p1(string.format("%sv1/twostepverification/verify", url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				actionType = "Login",
				username = p2,
				ticket = p3,
				code = p4,
				rememberDevice = p5
			})
		})
	end,
	login = function(p1, p2, p3, p4, p5)
		-- upvalues: url (ref), getAppFeaturePolicies (ref), httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref), consoleAuthRequestWrapper (ref)
		local formattedText = string.format("%sv3/users/%s/two-step-verification/login", url.AUTH_URL, p2)
		local var1 = getAppFeaturePolicies()
		local var2 = httpService:JSONEncode({
			challengeId = p3,
			verificationToken = p4,
			rememberDevice = p5,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil,
			accountLinkParameters = if var1.getLinkingPlatform() then { LinkingPlatform = var1.getLinkingPlatform() } else nil
		})
		
		return if var1.getUseSingleSignOn() and var1.getLinkedAuthEndpointsEnabled() then consoleAuthRequestWrapper(p1, formattedText, "POST", { maxRetryCount = 0, postBody = var2 }) else p1(formattedText, "POST", { maxRetryCount = 0, postBody = var2 })
	end
}