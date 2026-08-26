local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { modalSequence = p1 }
end)