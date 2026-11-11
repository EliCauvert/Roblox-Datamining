local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%s/messages/unread/count", Url.PRIVATEMESSAGES_URL), "GET")
end