local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ModalSequence) --[[ Line: 14 ]]
	return { modalSequence = ModalSequence }
end)