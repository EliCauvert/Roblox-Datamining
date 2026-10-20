local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ModalSequence, Key)
	return { key = Key, modalSequence = ModalSequence }
end)