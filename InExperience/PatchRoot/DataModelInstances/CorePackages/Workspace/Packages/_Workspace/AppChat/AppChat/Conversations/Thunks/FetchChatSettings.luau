local appChat = script:FindFirstAncestor("AppChat")
local url = require(appChat.Parent.Http).Url

return require(appChat.Http.RoduxNetworking).GET(script.Name, function(p1)
	-- upvalues: url (ref)
	return p1(url.CHAT_URL):path("chat-settings")
end)