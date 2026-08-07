local appChat = script:FindFirstAncestor("AppChat")
local url = require(appChat.Parent.Http).Url

return require(appChat.Http.RoduxNetworking).GET(script.Name, function(p0) --[[ line: 7 ]]
	-- upvalues: url (ref)
	return p0(url.CHAT_URL):path("chat-settings")
end)