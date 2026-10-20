local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local ConsoleAuthRequestWrapperFunction = require(Parent.Http).Utils.ConsoleAuthRequestWrapper
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local FFlagEnableLuaAccountSwitch = require(Parent.SharedFlags).FFlagEnableLuaAccountSwitch

return {
	configuration = function(Callback, p1)
		-- upvalues: Url (copy)
		return Callback(string.format("%sv1/users/%d/configuration", Url.TWOSTEPVERIFICATION_URL, p1), "GET")
	end,
	resend = function(Callback, Username, Ticket)
		-- upvalues: Url (copy), HttpService (copy)
		return Callback(string.format("%sv1/twostepverification/resend", Url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				actionType = "Login",
				username = Username,
				ticket = Ticket
			})
		})
	end,
	verify = function(Callback, Username, Ticket, Code, RememberDevice)
		-- upvalues: Url (copy), HttpService (copy)
		return Callback(string.format("%sv1/twostepverification/verify", Url.AUTH_URL), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				actionType = "Login",
				username = Username,
				ticket = Ticket,
				code = Code,
				rememberDevice = RememberDevice
			})
		})
	end,
	login = function(Callback, p1, ChallengeId, VerificationToken, RememberDevice)
		-- upvalues: Url (copy), GetAppFeaturePoliciesFunction (copy), HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy), ConsoleAuthRequestWrapperFunction (copy)
		local Formatted = string.format("%sv3/users/%s/two-step-verification/login", Url.AUTH_URL, p1)
		local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
		local Json = HttpService:JSONEncode({
			challengeId = ChallengeId,
			verificationToken = VerificationToken,
			rememberDevice = RememberDevice,
			accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil,
			accountLinkParameters = if AppFeaturePolicies.getLinkingPlatform() then {
				LinkingPlatform = AppFeaturePolicies.getLinkingPlatform()
			} else nil
		})
		
		return if AppFeaturePolicies.getUseSingleSignOn() and AppFeaturePolicies.getLinkedAuthEndpointsEnabled() then ConsoleAuthRequestWrapperFunction(Callback, Formatted, "POST", { maxRetryCount = 0, postBody = Json }) else Callback(Formatted, "POST", { maxRetryCount = 0, postBody = Json })
	end
}