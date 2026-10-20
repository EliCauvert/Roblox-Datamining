local Players = game:GetService("Players")
local ChatConstantsModule = require(script.Parent:WaitForChild("ChatConstants"))
local config = {
	WindowDraggable = false,
	WindowResizable = false,
	ShowChannelsBar = false,
	GamepadNavigationEnabled = false,
	AllowMeCommand = false,
	ShowUserOwnFilteredMessage = true,
	ChatOnWithTopBarOff = false,
	ScreenGuiDisplayOrder = 6,
	ShowFriendJoinNotification = true,
	BubbleChatEnabled = Players.BubbleChat,
	ClassicChatEnabled = Players.ClassicChat,
	ChatWindowTextSize = 18,
	ChatChannelsTabTextSize = 18,
	ChatBarTextSize = 18,
	ChatWindowTextSizePhone = 14,
	ChatChannelsTabTextSizePhone = 18,
	ChatBarTextSizePhone = 14,
	DefaultFont = Enum.Font.SourceSansBold,
	ChatBarFont = Enum.Font.SourceSansBold,
	BackGroundColor = Color3.new(0, 0, 0),
	DefaultMessageColor = Color3.new(1, 1, 1),
	DefaultNameColor = Color3.new(1, 1, 1),
	ChatBarBackGroundColor = Color3.new(0, 0, 0),
	ChatBarBoxColor = Color3.new(1, 1, 1),
	ChatBarTextColor = Color3.new(0, 0, 0),
	ChannelsTabUnselectedColor = Color3.new(0, 0, 0),
	ChannelsTabSelectedColor = Color3.new(0.11764705882352941, 0.11764705882352941, 0.11764705882352941),
	DefaultChannelNameColor = Color3.fromRGB(35, 76, 142),
	WhisperChannelNameColor = Color3.fromRGB(102, 14, 102),
	ErrorMessageTextColor = Color3.fromRGB(245, 50, 50),
	MinimumWindowSize = UDim2.new(0.3, 0, 0.25, 0),
	MaximumWindowSize = UDim2.new(1, 0, 1, 0),
	DefaultWindowPosition = UDim2.new(0, 0, 0, 0),
	DefaultWindowSizePhone = UDim2.new(0.5, 0, 0.5, 24),
	DefaultWindowSizeTablet = UDim2.new(0.4, 0, 0.3, 24),
	DefaultWindowSizeDesktop = UDim2.new(0.3, 0, 0.25, 24),
	ChatWindowBackgroundFadeOutTime = 3.5,
	ChatWindowTextFadeOutTime = 30,
	ChatDefaultFadeDuration = 0.8,
	ChatShouldFadeInFromNewInformation = false,
	ChatAnimationFPS = 20,
	GeneralChannelName = "All",
	EchoMessagesInGeneralChannel = true,
	ChannelsBarFullTabSize = 4,
	MaxChannelNameLength = 12,
	MaxChannelNameCheckLength = 50,
	RightClickToLeaveChannelEnabled = false,
	MessageHistoryLengthPerChannel = 50,
	ShowJoinAndLeaveHelpText = false,
	MaximumMessageLength = 200,
	DisallowedWhiteSpace = {
		"\n",
		"\r",
		"\t",
		"\11",
		"\f"
	},
	ClickOnPlayerNameToWhisper = true,
	ClickOnChannelNameToSetMainChannel = true,
	BubbleChatMessageTypes = {
		ChatConstantsModule.MessageTypeDefault,
		ChatConstantsModule.MessageTypeWhisper
	},
	WhisperCommandAutoCompletePlayerNames = true,
	PlayerDisplayNamesEnabled = true,
	WhisperByDisplayName = true
}
local BindableEvent = Instance.new("BindableEvent")
local self = setmetatable({}, {
	__index = function(_, p1)
		-- upvalues: config (copy)
		return config[p1]
	end,
	__newindex = function(_, Key, p1)
		-- upvalues: config (copy), BindableEvent (copy)
		config[Key] = p1
		BindableEvent:Fire(Key, p1)
	end
})
rawset(self, "SettingsChanged", BindableEvent.Event)

return self