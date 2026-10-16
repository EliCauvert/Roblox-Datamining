local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local Dictionary = require(Parent.llama).Dictionary
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local BottomLockedScrollViewV3Module = require(ExpChat.ChatWindow.UI.BottomLockedScrollViewV3)
local ScrollingView = RoactModule.PureComponent:extend("ScrollingView")
ScrollingView.defaultProps = {}

function ScrollingView.render(p1) --[[ Line: 15 ]]
	-- upvalues: FFlagExpChatEnableV2ChatWindowModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), RoactModule (copy), BottomLockedScrollViewV3Module (copy), Dictionary (copy), FFlagExpChatEnableFriendsTab (copy)
	local Config = if FFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = p1.props.showTranslationButton,
		chatWindowSettings = p1.props.chatWindowSettings,
		textTransparency = p1.props.textTransparency,
		onTextMessageLabelButtonActivated = p1.props.onTextMessageLabelButtonActivated,
		isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
		chatWindowTransparencyBindable = p1.props.chatWindowTransparencyBindable,
		visible = p1.props.visible,
		selectedChannelName = if GetFFlagTextChatEnableUniverseChatTabsFunction() then p1.props.selectedChannelName else nil,
		historicalMessageCountSignal = p1.props.historicalMessageCountSignal
	} else {}
	Config.messageComponentsSignal = p1.props.messageComponentsSignal
	
	return RoactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Selectable = false,
		Size = p1.props.size
	}, {
		bottomLockedScrollView = RoactModule.createElement(BottomLockedScrollViewV3Module, Dictionary.join({
			Size = UDim2.fromScale(1, 1),
			isChannelBarVisible = p1.props.isChannelBarVisible,
			scrollResetKey = p1.props.scrollResetKey,
			scrollToTopOnReset = if FFlagExpChatEnableFriendsTab then p1.props.scrollToTopOnReset else nil,
			onCanvasPositionChanged = if FFlagExpChatEnableFriendsTab then p1.props.onCanvasPositionChanged else nil,
			contentTopPadding = if FFlagExpChatEnableFriendsTab then p1.props.contentTopPadding else nil
		}, Config))
	})
end

return ScrollingView