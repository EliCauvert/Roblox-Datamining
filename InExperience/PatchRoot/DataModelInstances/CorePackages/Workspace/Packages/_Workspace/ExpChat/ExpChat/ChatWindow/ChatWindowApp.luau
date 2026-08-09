local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local memoizeModule = require(expChat.memoize)
local createEffect = require(parent.Signals).createEffect
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatTransparentFocusSupportModule = require(expChat.Flags.FFlagExpChatTransparentFocusSupport)
local fFlagEnableVerifiedBadgeStore = require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local UI = script.Parent.UI
local chatWindowModule = require(UI.ChatWindow)
local chatWindowMessageSourceModule = require(UI.ChatWindow.ChatWindowMessageSource)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatWindowMessageSourceRefactor = sharedFlagsModule.FFlagExpChatWindowMessageSourceRefactor
local expChatMoveMessagesStoreToInit = game:DefineFastFlag("ExpChatMoveMessagesStoreToInit", false)
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local chatWindowApp = roactModule.Component:extend("ChatWindowApp")
chatWindowApp.defaultProps = {
	LayoutOrder = 1,
	messages = if fFlagExpChatEnableV2ChatWindowModule then nil else {},
	size = UDim2.fromScale(1, 1)
}
local var14 = if getFFlagTextChatEnableUniverseChatTabs() then memoizeModule(function(p5, p6, p7, p8) --[[ line: 38 ]]
	-- upvalues: list (ref)
	if not p6 then
		return list.map(p5.windowMessagesInOrder, function(p9) --[[ line: 40 ]]
			-- upvalues: p5 (ref)
			return p5.byMessageId[p9]
		end)
	end
	local var15 = if p7 and p5.windowMessagesInOrderByTabId[p7.Name] then p7.Name else p8
	
	return if var15 then list.map(p5.windowMessagesInOrderByTabId[var15] or {}, function(p10) --[[ line: 49 ]]
		-- upvalues: p5 (ref)
		return p5.byMessageId[p10]
	end) else {}
end) else memoizeModule(function(p0, p1, p2) --[[ line: 58 ]]
	-- upvalues: list (ref)
	return if p1 then if p2 then list.map(p0.windowMessagesInOrderByTabId[p2.Name] or {}, function(p4) --[[ line: 67 ]]
		-- upvalues: p0 (ref)
		return p0.byMessageId[p4]
	end) else {} else list.map(p0.windowMessagesInOrder, function(p3) --[[ line: 60 ]]
		-- upvalues: p0 (ref)
		return p0.byMessageId[p3]
	end)
end)

if fFlagExpChatUseMessagesStore and not fFlagExpChatEnableV2ChatWindowModule then
	function chatWindowApp.init(p11) --[[ line: 78 ]]
		-- upvalues: getMessagesStoreModule (ref), expChatMoveMessagesStoreToInit (ref)
		p11.MessagesStore = getMessagesStoreModule(false)
		p11.disposeEffects = {}
		
		if expChatMoveMessagesStoreToInit and p11.MessagesStore then
			p11.state = {
				messagesState = {
					byMessageId = p11.MessagesStore.getByMessageId(false),
					windowMessagesInOrder = p11.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p11.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
			}
			
			return
		end
		p11.state = { messagesState = nil }
	end
	
	function chatWindowApp.didMount(p12) --[[ line: 97 ]]
		-- upvalues: expChatMoveMessagesStoreToInit (ref), createEffect (ref)
		if p12.MessagesStore then
			if not expChatMoveMessagesStoreToInit then
				local t = {
					byMessageId = p12.MessagesStore.getByMessageId(false),
					windowMessagesInOrder = p12.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p12.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
				
				if t then
					p12:setState({ messagesState = t })
				end
			end
			table.insert(p12.disposeEffects, createEffect(function(p13) --[[ line: 118 ]]
				-- upvalues: p12 (ref)
				local byMessageId = p12.MessagesStore.getByMessageId(p13)
				local windowMessagesInOrder = p12.MessagesStore.getWindowMessagesInOrder(p13)
				local windowMessagesInOrderByTabId = p12.MessagesStore.getWindowMessagesInOrderByTabId(p13)
				
				if byMessageId or windowMessagesInOrder or windowMessagesInOrderByTabId then
					p12:setState({
						messagesState = {
							byMessageId = byMessageId,
							windowMessagesInOrder = windowMessagesInOrder,
							windowMessagesInOrderByTabId = windowMessagesInOrderByTabId
						}
					})
				end
			end))
		end
	end
	
	function chatWindowApp.willUnmount(p14) --[[ line: 138 ]]
		if p14.disposeEffects then
			for i, v in ipairs(p14.disposeEffects) do
				v()
			end
			p14.disposeEffects = {}
		end
	end
end
function chatWindowApp.render(p15) --[[ line: 148 ]]
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var14 (write), fFlagExpChatChannelTabRefactor (ref), fFlagExpChatWindowMessageSourceRefactor (ref), roactModule (ref), chatWindowMessageSourceModule (ref), chatWindowModule (ref)
	local var20 = nil
	
	if not fFlagExpChatEnableV2ChatWindowModule then
		if fFlagExpChatUseMessagesStore then
			local messagesState = p15.state.messagesState
			var20 = if messagesState then if getFFlagTextChatEnableUniverseChatTabs() then var14(messagesState, p15.props.isChannelBarVisible, p15.props.targetTextChannel, p15.props.selectedChannelName) else var14(messagesState, p15.props.isChannelBarVisible, p15.props.targetTextChannel) else {}
		else
			var20 = if getFFlagTextChatEnableUniverseChatTabs() then var14(p15.props.messages, p15.props.isChannelBarVisible, p15.props.targetTextChannel, p15.props.selectedChannelName) else var14(p15.props.messages, p15.props.isChannelBarVisible, p15.props.targetTextChannel)
		end
	end
	local t = {
		LayoutOrder = p15.props.LayoutOrder,
		messages = if fFlagExpChatEnableV2ChatWindowModule then nil else var20,
		size = p15.props.size,
		transparencyValue = p15.props.transparencyValue,
		textTransparency = p15.props.textTransparency,
		onHovered = p15.props.onHovered,
		onUnhovered = p15.props.onUnhovered,
		mutedUserIds = if fFlagExpChatUseMessagesStore then nil else p15.props.mutedUserIds,
		verifiedUserIds = p15.props.verifiedUserIds,
		activateWhisperMode = p15.props.activateWhisperMode,
		resetTargetChannel = p15.props.resetTargetChannel,
		visible = p15.props.visible,
		onAbsoluteSizeChanged = p15.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p15.props.onAbsolutePositionChanged,
		chatWindowSettings = p15.props.chatWindowSettings,
		showTranslationButton = p15.props.showTranslationButton,
		targetTextChannel = p15.props.targetTextChannel,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() or fFlagExpChatChannelTabRefactor then p15.props.selectedChannelName else nil,
		scrollResetKey = if fFlagExpChatChannelTabRefactor then p15.props.selectedChannelName else nil,
		isChannelBarVisible = p15.props.isChannelBarVisible,
		onFocus = p15.props.onFocus,
		onUnfocus = p15.props.onUnfocus
	}
	
	return if fFlagExpChatWindowMessageSourceRefactor then roactModule.createElement(chatWindowMessageSourceModule, t) else roactModule.createElement(chatWindowModule, t)
end

return roactRoduxModule.connect(function(p16) --[[ line: 221 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatChannelTabRefactor (ref), fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagEnableVerifiedBadgeStore (ref)
	local selectedChannelName
	local var22 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() or fFlagExpChatChannelTabRefactor then
		selectedChannelName = p16.TextChannels.selectedChannelName
		var22 = if selectedChannelName and p16.ChannelTabs and p16.ChannelTabs.allChannelTabs[selectedChannelName] then selectedChannelName elseif p16.ChannelTabs then p16.ChannelTabs.selectedTabName or "RBXGeneral" else "RBXGeneral"
	end
	selectedChannelName = {
		chatIntervention = p16.ChatIntervention,
		messages = if fFlagExpChatEnableV2ChatWindowModule or fFlagExpChatUseMessagesStore then nil else p16.Messages,
		mutedUserIds = if fFlagExpChatUseMessagesStore then nil else p16.MutedUsers,
		verifiedUserIds = if fFlagEnableVerifiedBadgeStore then nil else p16.VerifiedUsers,
		targetTextChannel = p16.TextChannels.targetTextChannel,
		selectedChannelName = var22
	}
	
	return selectedChannelName
end, function(_) --[[ line: 242 ]]
	-- upvalues: fFlagExpChatTransparentFocusSupportModule (ref), getTransparencyStoreModule (ref)
	return {
		onFocus = function() --[[ line: 244 ]]
			-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), getTransparencyStoreModule (copy)
			return if fFlagExpChatTransparentFocusSupportModule then getTransparencyStoreModule(false).setContextMenuOpen() else getTransparencyStoreModule(false).setTextboxFocus()
		end,
		onUnfocus = function() --[[ line: 252 ]]
			-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), getTransparencyStoreModule (copy)
			return if fFlagExpChatTransparentFocusSupportModule then getTransparencyStoreModule(false).clearContextMenuOpen() else getTransparencyStoreModule(false).clearTextboxFocus()
		end
	}
end)(chatWindowApp)