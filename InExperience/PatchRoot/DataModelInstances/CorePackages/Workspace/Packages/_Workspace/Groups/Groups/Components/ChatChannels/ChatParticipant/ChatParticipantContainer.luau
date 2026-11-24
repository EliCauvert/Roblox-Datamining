local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local ChatParticipantViewModule = require(script.Parent.ChatParticipantView)
local UseChatParticipantViewModelModule = require(script.Parent.useChatParticipantViewModel)

return function(p1)
	-- upvalues: UseChatParticipantViewModelModule (copy), ReactModule (copy), ChatParticipantViewModule (copy)
	return ReactModule.createElement(ChatParticipantViewModule, (UseChatParticipantViewModelModule(p1)))
end