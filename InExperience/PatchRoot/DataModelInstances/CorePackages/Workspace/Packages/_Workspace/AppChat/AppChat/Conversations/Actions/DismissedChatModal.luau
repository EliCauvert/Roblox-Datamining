local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.AppChatNetworking)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 13 ]]
	return { key = p1, modalSequence = p0 }
end)