local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local List = require(Parent.llama).List
local MemoizeModule = require(ExpChat.memoize)
local CreateEffectFunction = require(Parent.Signals).createEffect
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatTransparentFocusSupportModule = require(ExpChat.Flags.FFlagExpChatTransparentFocusSupport)
local FFlagEnableVerifiedBadgeStore = require(Parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local UI = script.Parent.UI
local ChatWindowModule = require(UI.ChatWindow)
local ChatWindowMessageSourceModule = require(UI.ChatWindow.ChatWindowMessageSource)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatWindowMessageSourceRefactor = SharedFlagsModule.FFlagExpChatWindowMessageSourceRefactor
local ExpChatMoveMessagesStoreToInit = game:DefineFastFlag("ExpChatMoveMessagesStoreToInit", false)
local FFlagExpChatChannelTabRefactor = SharedFlagsModule.FFlagExpChatChannelTabRefactor
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local ChatWindowApp = RoactModule.Component:extend("ChatWindowApp")
ChatWindowApp.defaultProps = {
	LayoutOrder = 1,
	messages = if FFlagExpChatEnableV2ChatWindowModule then nil else {},
	size = UDim2.fromScale(1, 1)
}
local Callback = nil
Callback = if GetFFlagTextChatEnableUniverseChatTabsFunction() then MemoizeModule(function(MessagesState, p1, p2, p3)
	-- upvalues: List (copy)
	if p1 then
		local Name = if p2 and MessagesState.windowMessagesInOrderByTabId[p2.Name] then p2.Name else p3
		
		return if Name then List.map(MessagesState.windowMessagesInOrderByTabId[Name] or {}, function(p4)
			-- upvalues: MessagesState (copy)
			return MessagesState.byMessageId[p4]
		end) else {}
	else
		return List.map(MessagesState.windowMessagesInOrder, function(p4)
			-- upvalues: MessagesState (copy)
			return MessagesState.byMessageId[p4]
		end)
	end
end) else MemoizeModule(function(MessagesState, p1, p2)
	-- upvalues: List (copy)
	return if p1 then if p2 then List.map(MessagesState.windowMessagesInOrderByTabId[p2.Name] or {}, function(p3)
		-- upvalues: MessagesState (copy)
		return MessagesState.byMessageId[p3]
	end) else {} else List.map(MessagesState.windowMessagesInOrder, function(p3)
		-- upvalues: MessagesState (copy)
		return MessagesState.byMessageId[p3]
	end)
end)

if FFlagExpChatUseMessagesStore and not FFlagExpChatEnableV2ChatWindowModule then
	function ChatWindowApp.init(p1)
		-- upvalues: GetMessagesStoreModule (copy), ExpChatMoveMessagesStoreToInit (copy)
		p1.MessagesStore = GetMessagesStoreModule(false)
		p1.disposeEffects = {}
		
		if ExpChatMoveMessagesStoreToInit and p1.MessagesStore then
			p1.state = {
				messagesState = {
					byMessageId = p1.MessagesStore.getByMessageId(false),
					windowMessagesInOrder = p1.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p1.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
			}
			
			return
		else
			p1.state = { messagesState = nil }
		end
	end
	
	function ChatWindowApp.didMount(p1)
		-- upvalues: ExpChatMoveMessagesStoreToInit (copy), CreateEffectFunction (copy)
		if p1.MessagesStore then
			if not ExpChatMoveMessagesStoreToInit then
				local MessagesState = {
					byMessageId = p1.MessagesStore.getByMessageId(false),
					windowMessagesInOrder = p1.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p1.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
				
				if MessagesState then
					p1:setState({ messagesState = MessagesState })
				end
			end
			table.insert(p1.disposeEffects, (CreateEffectFunction(function(p2)
				-- upvalues: p1 (copy)
				local ByMessageId = p1.MessagesStore.getByMessageId(p2)
				local WindowMessagesInOrder = p1.MessagesStore.getWindowMessagesInOrder(p2)
				local WindowMessagesInOrderByTabId = p1.MessagesStore.getWindowMessagesInOrderByTabId(p2)
				
				if ByMessageId or WindowMessagesInOrder or WindowMessagesInOrderByTabId then
					p1:setState({
						messagesState = {
							byMessageId = ByMessageId,
							windowMessagesInOrder = WindowMessagesInOrder,
							windowMessagesInOrderByTabId = WindowMessagesInOrderByTabId
						}
					})
				end
			end)))
		end
	end
	
	function ChatWindowApp.willUnmount(p1)
		if p1.disposeEffects then
			for _, disposeEffect in ipairs(p1.disposeEffects) do
				disposeEffect()
			end
			p1.disposeEffects = {}
		end
	end
end
function ChatWindowApp.render(p1)
	-- upvalues: FFlagExpChatEnableV2ChatWindowModule (copy), FFlagExpChatUseMessagesStore (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), Callback (ref), FFlagExpChatChannelTabRefactor (copy), FFlagExpChatWindowMessageSourceRefactor (copy), RoactModule (copy), ChatWindowMessageSourceModule (copy), ChatWindowModule (copy)
	local v1 = nil
	
	if not FFlagExpChatEnableV2ChatWindowModule then
		if FFlagExpChatUseMessagesStore then
			local MessagesState = p1.state.messagesState
			v1 = if MessagesState then if GetFFlagTextChatEnableUniverseChatTabsFunction() then Callback(MessagesState, p1.props.isChannelBarVisible, p1.props.targetTextChannel, p1.props.selectedChannelName) else Callback(MessagesState, p1.props.isChannelBarVisible, p1.props.targetTextChannel) else {}
		else
			v1 = if GetFFlagTextChatEnableUniverseChatTabsFunction() then Callback(p1.props.messages, p1.props.isChannelBarVisible, p1.props.targetTextChannel, p1.props.selectedChannelName) else Callback(p1.props.messages, p1.props.isChannelBarVisible, p1.props.targetTextChannel)
		end
	end
	local config = {
		LayoutOrder = p1.props.LayoutOrder,
		messages = if FFlagExpChatEnableV2ChatWindowModule then nil else v1,
		size = p1.props.size,
		transparencyValue = p1.props.transparencyValue,
		textTransparency = p1.props.textTransparency,
		onHovered = p1.props.onHovered,
		onUnhovered = p1.props.onUnhovered,
		mutedUserIds = if FFlagExpChatUseMessagesStore then nil else p1.props.mutedUserIds,
		verifiedUserIds = p1.props.verifiedUserIds,
		activateWhisperMode = p1.props.activateWhisperMode,
		resetTargetChannel = p1.props.resetTargetChannel,
		visible = p1.props.visible,
		onAbsoluteSizeChanged = p1.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.props.onAbsolutePositionChanged,
		chatWindowSettings = p1.props.chatWindowSettings,
		showTranslationButton = p1.props.showTranslationButton,
		targetTextChannel = p1.props.targetTextChannel,
		selectedChannelName = if GetFFlagTextChatEnableUniverseChatTabsFunction() or FFlagExpChatChannelTabRefactor then p1.props.selectedChannelName else nil,
		scrollResetKey = if FFlagExpChatChannelTabRefactor then p1.props.selectedChannelName else nil,
		isChannelBarVisible = p1.props.isChannelBarVisible,
		onFocus = p1.props.onFocus,
		onUnfocus = p1.props.onUnfocus
	}
	
	return if FFlagExpChatWindowMessageSourceRefactor then RoactModule.createElement(ChatWindowMessageSourceModule, config) else RoactModule.createElement(ChatWindowModule, config)
end

return RoactRoduxModule.connect(function(p1)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatChannelTabRefactor (copy), FFlagExpChatEnableV2ChatWindowModule (copy), FFlagExpChatUseMessagesStore (copy), FFlagEnableVerifiedBadgeStore (copy)
	local SelectedTabName = nil
	
	if GetFFlagTextChatEnableUniverseChatTabsFunction() or FFlagExpChatChannelTabRefactor then
		local SelectedChannelName = p1.TextChannels.selectedChannelName
		SelectedTabName = if SelectedChannelName and p1.ChannelTabs and p1.ChannelTabs.allChannelTabs[SelectedChannelName] then SelectedChannelName else p1.ChannelTabs and p1.ChannelTabs.selectedTabName or "RBXGeneral"
	end
	return {
		chatIntervention = p1.ChatIntervention,
		messages = if FFlagExpChatEnableV2ChatWindowModule or FFlagExpChatUseMessagesStore then nil else p1.Messages,
		mutedUserIds = if FFlagExpChatUseMessagesStore then nil else p1.MutedUsers,
		verifiedUserIds = if FFlagEnableVerifiedBadgeStore then nil else p1.VerifiedUsers,
		targetTextChannel = p1.TextChannels.targetTextChannel,
		selectedChannelName = SelectedTabName
	}
end, function(_)
	-- upvalues: FFlagExpChatTransparentFocusSupportModule (copy), GetTransparencyStoreModule (copy)
	return {
		onFocus = function()
			-- upvalues: FFlagExpChatTransparentFocusSupportModule (upval), GetTransparencyStoreModule (upval)
			return if FFlagExpChatTransparentFocusSupportModule then GetTransparencyStoreModule(false).setContextMenuOpen() else GetTransparencyStoreModule(false).setTextboxFocus()
		end,
		onUnfocus = function()
			-- upvalues: FFlagExpChatTransparentFocusSupportModule (upval), GetTransparencyStoreModule (upval)
			return if FFlagExpChatTransparentFocusSupportModule then GetTransparencyStoreModule(false).clearContextMenuOpen() else GetTransparencyStoreModule(false).clearTextboxFocus()
		end
	}
end)(ChatWindowApp)