local parent = script:FindFirstAncestor("AuthCommon").Parent
local url = require(parent.Http).Url
local fFlagEnableLogoutV3 = require(parent.SharedFlags).FFlagEnableLogoutV3

return function(p1)
	-- upvalues: fFlagEnableLogoutV3 (ref), url (ref)
	return p1(if fFlagEnableLogoutV3 then string.format("%sv3/logout", url.AUTH_URL) else string.format("%sv1/logout", url.AUTH_URL), "POST", {
		maxRetryCount = 0,
		postBody = if fFlagEnableLogoutV3 then "{}" else ""
	})
end