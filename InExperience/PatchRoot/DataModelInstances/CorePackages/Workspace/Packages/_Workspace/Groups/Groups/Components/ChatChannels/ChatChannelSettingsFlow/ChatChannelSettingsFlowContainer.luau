local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local ChatChannelSettingsFlowViewModule = require(script.Parent.ChatChannelSettingsFlowView)
local UseChatChannelSettingsFlowViewModelModule = require(script.Parent.useChatChannelSettingsFlowViewModel)

return function(p1)
	-- upvalues: UseChatChannelSettingsFlowViewModelModule (copy), ReactModule (copy), ChatChannelSettingsFlowViewModule (copy)
	return ReactModule.createElement(ChatChannelSettingsFlowViewModule, (UseChatChannelSettingsFlowViewModelModule(p1)))
end