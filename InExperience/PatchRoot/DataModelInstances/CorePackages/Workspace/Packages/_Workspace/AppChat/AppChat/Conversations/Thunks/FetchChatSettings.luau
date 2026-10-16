local AppChat = script:FindFirstAncestor("AppChat")
local Url = require(AppChat.Parent.Http).Url

return require(AppChat.Http.RoduxNetworking).GET(script.Name, function(Callback) --[[ Line: 7 ]]
	-- upvalues: Url (copy)
	return Callback(Url.CHAT_URL):path("chat-settings")
end)