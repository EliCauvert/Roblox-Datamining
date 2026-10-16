local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local bottomLockedScrollViewV3Module = require(expChat.ChatWindow.UI.BottomLockedScrollViewV3)
local scrollingView = roactModule.PureComponent:extend("ScrollingView")
scrollingView.defaultProps = {}

function scrollingView.render(p1)
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), roactModule (ref), bottomLockedScrollViewV3Module (ref), dictionary (ref), fFlagExpChatEnableFriendsTab (ref)
	local var1 = if fFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = p1.props.showTranslationButton,
		chatWindowSettings = p1.props.chatWindowSettings,
		textTransparency = p1.props.textTransparency,
		onTextMessageLabelButtonActivated = p1.props.onTextMessageLabelButtonActivated,
		isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
		chatWindowTransparencyBindable = p1.props.chatWindowTransparencyBindable,
		visible = p1.props.visible,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then p1.props.selectedChannelName else nil
	} else {}
	var1.messageComponentsSignal = p1.props.messageComponentsSignal
	
	return roactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Selectable = false,
		Size = p1.props.size
	}, {
		bottomLockedScrollView = roactModule.createElement(bottomLockedScrollViewV3Module, dictionary.join({
			Size = UDim2.fromScale(1, 1),
			isChannelBarVisible = p1.props.isChannelBarVisible,
			scrollResetKey = p1.props.scrollResetKey,
			scrollToTopOnReset = if fFlagExpChatEnableFriendsTab then p1.props.scrollToTopOnReset else nil,
			onCanvasPositionChanged = if fFlagExpChatEnableFriendsTab then p1.props.onCanvasPositionChanged else nil,
			contentTopPadding = if fFlagExpChatEnableFriendsTab then p1.props.contentTopPadding else nil
		}, var1))
	})
end

return scrollingView