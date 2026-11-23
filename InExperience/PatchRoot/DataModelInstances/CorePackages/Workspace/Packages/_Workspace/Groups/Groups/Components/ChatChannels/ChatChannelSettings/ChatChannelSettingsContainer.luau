local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local ChatChannelSettingsViewModule = require(script.Parent.ChatChannelSettingsView)
local UseChatChannelSettingsViewModelModule = require(script.Parent.useChatChannelSettingsViewModel)

return function(p1)
	-- upvalues: UseChatChannelSettingsViewModelModule (copy), ReactModule (copy), ChatChannelSettingsViewModule (copy)
	return ReactModule.createElement(ChatChannelSettingsViewModule, (UseChatChannelSettingsViewModelModule(p1)))
end