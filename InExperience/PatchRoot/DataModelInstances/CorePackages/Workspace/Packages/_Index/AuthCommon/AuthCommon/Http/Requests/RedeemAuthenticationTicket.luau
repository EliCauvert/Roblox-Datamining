local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local HttpService = game:GetService("HttpService")
local HttpModule = require(Parent.Http)
local SharedFlagsModule = require(Parent.SharedFlags)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local FFlagEnableLuaAccountSwitch = SharedFlagsModule.FFlagEnableLuaAccountSwitch

return function(Callback, AuthenticationTicket)
	-- upvalues: HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilitiesModule (copy), HttpModule (copy)
	return (Callback(string.format("%sv1/authentication-ticket/redeem", HttpModule.Url.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({
			retainCurrentSession = true,
			authenticationTicket = AuthenticationTicket,
			accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilitiesModule.getAccountBlob() or nil
		})
	}))
end