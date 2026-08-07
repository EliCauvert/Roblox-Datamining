local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 15 ]]
	return { conversationId = p0, modalVariant = p1 }
end)