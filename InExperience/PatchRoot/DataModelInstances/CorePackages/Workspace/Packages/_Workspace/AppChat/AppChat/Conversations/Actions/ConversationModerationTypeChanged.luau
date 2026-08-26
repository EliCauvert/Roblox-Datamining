local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { conversationId = p1, moderationType = p2 }
end)