local Groups = script:FindFirstAncestor("Groups")
local ReactModule = require(Groups.Parent.React)
local CryoModule = require(Groups.Parent.Cryo)
local ChatChannelSettingsFlowModule = require(script.Parent.Parent.ChatChannelSettingsFlow)
local _ = require(script.Parent.Parent.ChatChannelSettingsFlow.ChatChannelSettingsFlowLayout)
local ChatChannelSettingsModalViewModule = require(script.Parent.ChatChannelSettingsModalView)
local UseChatChannelSettingsModalViewModelModule = require(script.Parent.useChatChannelSettingsModalViewModel)

local function ModalLayout(p1)
	-- upvalues: UseChatChannelSettingsModalViewModelModule (copy), ReactModule (copy), ChatChannelSettingsModalViewModule (copy)
	return ReactModule.createElement(ChatChannelSettingsModalViewModule, (UseChatChannelSettingsModalViewModelModule(p1)))
end

return function(p1)
	-- upvalues: CryoModule (copy), ModalLayout (copy), ReactModule (copy), ChatChannelSettingsFlowModule (copy)
	return ReactModule.createElement(ChatChannelSettingsFlowModule, (CryoModule.Dictionary.join(p1, {
		Layout = ModalLayout,
		testId = p1.testId or "--chat-channel-settings-modal"
	})))
end