local Parent = script:FindFirstAncestor("AuthCommon").Parent
local Url = require(Parent.Http).Url
local FFlagEnableLogoutV3 = require(Parent.SharedFlags).FFlagEnableLogoutV3

return function(Callback) --[[ Line: 8 ]]
	-- upvalues: FFlagEnableLogoutV3 (copy), Url (copy)
	return Callback(if FFlagEnableLogoutV3 then string.format("%sv3/logout", Url.AUTH_URL) else string.format("%sv1/logout", Url.AUTH_URL), "POST", {
		maxRetryCount = 0,
		postBody = if FFlagEnableLogoutV3 then "{}" else ""
	})
end