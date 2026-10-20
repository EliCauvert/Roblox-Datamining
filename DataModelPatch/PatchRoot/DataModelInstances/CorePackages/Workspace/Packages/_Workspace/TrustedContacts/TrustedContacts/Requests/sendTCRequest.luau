local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Url = require(TrustedContacts.Parent.Http).Url
local MyHttpRequestModule = require(TrustedContacts.Networking.myHttpRequest)

return function(p1)
	-- upvalues: Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/send-trusted-friend-request", Url.FRIEND_URL, (tostring(p1))), "POST", { postBody = {} })
end