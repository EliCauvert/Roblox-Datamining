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

function scrollingView.render(p0) --[[ line: 15 ]]
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), roactModule (ref), bottomLockedScrollViewV3Module (ref), dictionary (ref), fFlagExpChatEnableFriendsTab (ref)
	local var6 = if fFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = p0.props.showTranslationButton,
		chatWindowSettings = p0.props.chatWindowSettings,
		textTransparency = p0.props.textTransparency,
		onTextMessageLabelButtonActivated = p0.props.onTextMessageLabelButtonActivated,
		isSpatialUIEnabled = p0.props.isSpatialUIEnabled,
		chatWindowTransparencyBindable = p0.props.chatWindowTransparencyBindable,
		visible = p0.props.visible,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then p0.props.selectedChannelName else nil
	} else {}
	var6.messageComponentsSignal = p0.props.messageComponentsSignal
	
	return roactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Selectable = false,
		Size = p0.props.size
	}, {
		bottomLockedScrollView = roactModule.createElement(bottomLockedScrollViewV3Module, dictionary.join({
			Size = UDim2.fromScale(1, 1),
			isChannelBarVisible = p0.props.isChannelBarVisible,
			scrollResetKey = p0.props.scrollResetKey,
			onCanvasPositionChanged = if fFlagExpChatEnableFriendsTab then p0.props.onCanvasPositionChanged else nil,
			contentTopPadding = if fFlagExpChatEnableFriendsTab then p0.props.contentTopPadding else nil
		}, var6))
	})
end

return scrollingView