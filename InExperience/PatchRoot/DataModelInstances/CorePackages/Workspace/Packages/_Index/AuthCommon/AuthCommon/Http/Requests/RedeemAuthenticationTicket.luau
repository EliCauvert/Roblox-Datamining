local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local httpModule = require(parent.Http)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch

return function(p1, p2)
	-- upvalues: httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref), httpModule (ref)
	return p1(string.format("%sv1/authentication-ticket/redeem", httpModule.Url.AUTH_URL), "POST", {
		postBody = httpService:JSONEncode({
			retainCurrentSession = true,
			authenticationTicket = p2,
			accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil
		})
	})
end