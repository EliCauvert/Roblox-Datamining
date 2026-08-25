local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local url = require(trustedContacts.Parent.Http).Url
local myHttpRequestModule = require(trustedContacts.Networking.myHttpRequest)

return function(p0)
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/accept-trusted-friend-request", url.FRIEND_URL, tostring(p0)), "POST", { postBody = {} })
end