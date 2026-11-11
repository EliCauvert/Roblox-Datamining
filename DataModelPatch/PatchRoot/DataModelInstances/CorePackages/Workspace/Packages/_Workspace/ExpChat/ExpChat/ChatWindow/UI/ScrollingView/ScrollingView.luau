local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local Dictionary = require(Parent.llama).Dictionary
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatWindowMessageSourceRefactor = require(Parent.SharedFlags).FFlagExpChatWindowMessageSourceRefactor
local FFlagExpChatChannelTabRefactor = require(Parent.SharedFlags).FFlagExpChatChannelTabRefactor
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local BottomLockedScrollViewV3Module = require(ExpChat.ChatWindow.UI.BottomLockedScrollViewV3)
local ScrollingView = RoactModule.PureComponent:extend("ScrollingView")
ScrollingView.defaultProps = {}

function ScrollingView.render(p1)
	-- upvalues: FFlagExpChatEnableV2ChatWindowModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatWindowMessageSourceRefactor (copy), RoactModule (copy), FFlagExpChatEnableFocusNavigationModule (copy), BottomLockedScrollViewV3Module (copy), Dictionary (copy), FFlagExpChatChannelTabRefactor (copy)
	local Config = if FFlagExpChatEnableV2ChatWindowModule then {
		showTranslationButton = p1.props.showTranslationButton,
		chatWindowSettings = p1.props.chatWindowSettings,
		textTransparency = p1.props.textTransparency,
		onTextMessageLabelButtonActivated = p1.props.onTextMessageLabelButtonActivated,
		isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
		chatWindowTransparencyBindable = p1.props.chatWindowTransparencyBindable,
		visible = p1.props.visible,
		selectedChannelName = if GetFFlagTextChatEnableUniverseChatTabsFunction() then p1.props.selectedChannelName else nil
	} else {}
	
	if FFlagExpChatWindowMessageSourceRefactor then
		Config.messageComponentsSignal = p1.props.messageComponentsSignal
	end
	return RoactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Selectable = not FFlagExpChatEnableFocusNavigationModule and nil,
		Size = p1.props.size
	}, {
		bottomLockedScrollView = RoactModule.createElement(BottomLockedScrollViewV3Module, Dictionary.join({
			Size = UDim2.fromScale(1, 1),
			targetTextChannel = p1.props.targetTextChannel,
			isChannelBarVisible = p1.props.isChannelBarVisible,
			scrollResetKey = if FFlagExpChatChannelTabRefactor then p1.props.scrollResetKey else nil
		}, Config), if FFlagExpChatEnableV2ChatWindowModule or FFlagExpChatWindowMessageSourceRefactor then nil else p1.props[RoactModule.Children])
	})
end

return ScrollingView