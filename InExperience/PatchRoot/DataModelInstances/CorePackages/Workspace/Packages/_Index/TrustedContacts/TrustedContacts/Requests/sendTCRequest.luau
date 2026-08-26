local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local url = require(trustedContacts.Parent.Http).Url
local myHttpRequestModule = require(trustedContacts.Networking.myHttpRequest)

return function(p1)
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/send-trusted-friend-request", url.FRIEND_URL, tostring(p1)), "POST", { postBody = {} })
end