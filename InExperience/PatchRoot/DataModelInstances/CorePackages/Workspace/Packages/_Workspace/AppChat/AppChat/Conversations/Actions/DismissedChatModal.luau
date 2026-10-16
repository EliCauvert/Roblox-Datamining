local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ModalSequence, Key) --[[ Line: 13 ]]
	return { key = Key, modalSequence = ModalSequence }
end)