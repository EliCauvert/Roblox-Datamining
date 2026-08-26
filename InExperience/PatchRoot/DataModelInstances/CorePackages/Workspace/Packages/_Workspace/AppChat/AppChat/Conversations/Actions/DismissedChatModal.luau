local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { key = p2, modalSequence = p1 }
end)