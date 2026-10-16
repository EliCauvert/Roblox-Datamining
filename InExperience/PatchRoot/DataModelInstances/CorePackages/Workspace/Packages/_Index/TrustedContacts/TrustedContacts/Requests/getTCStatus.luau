local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Url = require(TrustedContacts.Parent.Http).Url
local MyHttpRequestModule = require(TrustedContacts.Networking.myHttpRequest)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/my/trusted-friends/%s/status", Url.FRIEND_URL, (tostring(p1))), "GET"):andThen(function(Result) --[[ Line: 11 ]]
		return Result and (Result.responseBody and Result.responseBody.status)
	end)
end