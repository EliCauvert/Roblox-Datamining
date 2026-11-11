local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local Url = DependenciesModule.Url

return DependenciesModule.RoduxNetworking.GET(script.Name, function(Callback)
	-- upvalues: Url (copy)
	return Callback(Url.CHAT_URL):path("chat-settings")
end)