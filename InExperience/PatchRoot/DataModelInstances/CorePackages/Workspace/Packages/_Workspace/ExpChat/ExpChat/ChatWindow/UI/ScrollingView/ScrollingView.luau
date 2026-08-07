local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local fFlagExpChatWindowMessageSourceRefactor = require(parent.SharedFlags).FFlagExpChatWindowMessageSourceRefactor
local fFlagExpChatChannelTabRefactor = require(parent.SharedFlags).FFlagExpChatChannelTabRefactor
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local bottomLockedScrollViewV3Module = require(expChat.ChatWindow.UI.BottomLockedScrollViewV3)
local scrollingView = roactModule.PureComponent:extend("ScrollingView")
scrollingView.defaultProps = {}

function scrollingView.render(p0) --[[ line: 19 ]]
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatWindowMessageSourceRefactor (ref), roactModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), bottomLockedScrollViewV3Module (ref), dictionary (ref), fFlagExpChatChannelTabRefactor (ref), fFlagExpChatEnableFriendsTab (ref)
	local var7 = if fFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = p0.props.showTranslationButton,
		chatWindowSettings = p0.props.chatWindowSettings,
		textTransparency = p0.props.textTransparency,
		onTextMessageLabelButtonActivated = p0.props.onTextMessageLabelButtonActivated,
		isSpatialUIEnabled = p0.props.isSpatialUIEnabled,
		chatWindowTransparencyBindable = p0.props.chatWindowTransparencyBindable,
		visible = p0.props.visible,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then p0.props.selectedChannelName else nil
	} else {}
	
	if fFlagExpChatWindowMessageSourceRefactor then
		var7.messageComponentsSignal = p0.props.messageComponentsSignal
	end
	return roactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Selectable = if fFlagExpChatEnableFocusNavigationModule then false else nil,
		Size = p0.props.size
	}, {
		bottomLockedScrollView = roactModule.createElement(bottomLockedScrollViewV3Module, dictionary.join({
			Size = UDim2.fromScale(1, 1),
			targetTextChannel = p0.props.targetTextChannel,
			isChannelBarVisible = p0.props.isChannelBarVisible,
			scrollResetKey = if fFlagExpChatChannelTabRefactor then p0.props.scrollResetKey else nil,
			onCanvasPositionChanged = if fFlagExpChatEnableFriendsTab then p0.props.onCanvasPositionChanged else nil,
			contentTopPadding = if fFlagExpChatEnableFriendsTab then p0.props.contentTopPadding else nil
		}, var7), if fFlagExpChatEnableV2ChatWindowModule or fFlagExpChatWindowMessageSourceRefactor then nil else p0.props[roactModule.Children])
	})
end

return scrollingView