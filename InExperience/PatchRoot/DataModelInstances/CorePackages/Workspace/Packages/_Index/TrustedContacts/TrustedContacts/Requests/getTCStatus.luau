local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local url = require(trustedContacts.Parent.Http).Url
local myHttpRequestModule = require(trustedContacts.Networking.myHttpRequest)

return function(p1)
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/my/trusted-friends/%s/status", url.FRIEND_URL, tostring(p1)), "GET"):andThen(function(p2)
		return p2 and (p2.responseBody and p2.responseBody.status)
	end)
end