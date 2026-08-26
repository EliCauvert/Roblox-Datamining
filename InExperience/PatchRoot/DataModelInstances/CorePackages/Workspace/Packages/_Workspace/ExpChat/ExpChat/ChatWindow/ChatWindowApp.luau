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
local chatWindowMessageSourceModule = require(script.Parent.UI.ChatWindow.ChatWindowMessageSource)
local fFlagExpChatUseMessagesStore = require(parent.SharedFlags).FFlagExpChatUseMessagesStore
local expChatMoveMessagesStoreToInit = game:DefineFastFlag("ExpChatMoveMessagesStoreToInit", false)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatMessagesStoreUseProxyModule = require(expChat.Flags.FFlagExpChatMessagesStoreUseProxy)

local function readByMessageIdAsTable(p1, p2)
	-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (ref)
	local var1 = if p2 then p1.getByMessageId(p2) else p1.getByMessageId(false)
	
	if not fFlagExpChatMessagesStoreUseProxyModule then
		return var1
	end
	local t = {}
	
	for i, v in var1 do
		t[i] = v
	end
	return t
end

local chatWindowApp = roactModule.Component:extend("ChatWindowApp")
chatWindowApp.defaultProps = {
	LayoutOrder = 1,
	messages = if fFlagExpChatEnableV2ChatWindowModule then nil else {},
	size = UDim2.fromScale(1, 1)
}
local var2 = if getFFlagTextChatEnableUniverseChatTabs() then memoizeModule(function(p3, p4, p5, p6)
	-- upvalues: list (ref)
	if not p4 then
		return list.map(p3.windowMessagesInOrder, function(p7)
			-- upvalues: p3 (ref)
			return p3.byMessageId[p7]
		end)
	end
	local var3 = if p5 and p3.windowMessagesInOrderByTabId[p5.Name] then p5.Name else p6
	
	return if var3 then list.map(p3.windowMessagesInOrderByTabId[var3] or {}, function(p7)
		-- upvalues: p3 (ref)
		return p3.byMessageId[p7]
	end) else {}
end) else memoizeModule(function(p3, p4, p5)
	-- upvalues: list (ref)
	return if p4 then if p5 then list.map(p3.windowMessagesInOrderByTabId[p5.Name] or {}, function(p6)
		-- upvalues: p3 (ref)
		return p3.byMessageId[p6]
	end) else {} else list.map(p3.windowMessagesInOrder, function(p6)
		-- upvalues: p3 (ref)
		return p3.byMessageId[p6]
	end)
end)

if fFlagExpChatUseMessagesStore and not fFlagExpChatEnableV2ChatWindowModule then
	function chatWindowApp.init(p3)
		-- upvalues: getMessagesStoreModule (ref), expChatMoveMessagesStoreToInit (ref), readByMessageIdAsTable (ref)
		p3.MessagesStore = getMessagesStoreModule(false)
		p3.disposeEffects = {}
		
		if expChatMoveMessagesStoreToInit and p3.MessagesStore then
			p3.state = {
				messagesState = {
					byMessageId = readByMessageIdAsTable(p3.MessagesStore),
					windowMessagesInOrder = p3.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p3.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
			}
			
			return
		end
		p3.state = { messagesState = nil }
	end
	
	function chatWindowApp.didMount(p3)
		-- upvalues: expChatMoveMessagesStoreToInit (ref), readByMessageIdAsTable (ref), createEffect (ref)
		if p3.MessagesStore then
			if not expChatMoveMessagesStoreToInit then
				local t = {
					byMessageId = readByMessageIdAsTable(p3.MessagesStore),
					windowMessagesInOrder = p3.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p3.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
				
				if t then
					p3:setState({ messagesState = t })
				end
			end
			table.insert(p3.disposeEffects, createEffect(function(p4)
				-- upvalues: readByMessageIdAsTable (copy), p3 (ref)
				local var3 = readByMessageIdAsTable(p3.MessagesStore, p4)
				local windowMessagesInOrder = p3.MessagesStore.getWindowMessagesInOrder(p4)
				local windowMessagesInOrderByTabId = p3.MessagesStore.getWindowMessagesInOrderByTabId(p4)
				
				if var3 or windowMessagesInOrder or windowMessagesInOrderByTabId then
					p3:setState({
						messagesState = {
							byMessageId = var3,
							windowMessagesInOrder = windowMessagesInOrder,
							windowMessagesInOrderByTabId = windowMessagesInOrderByTabId
						}
					})
				end
			end))
		end
	end
	
	function chatWindowApp.willUnmount(p3)
		if p3.disposeEffects then
			for i, v in ipairs(p3.disposeEffects) do
				v()
			end
			p3.disposeEffects = {}
		end
	end
end
function chatWindowApp.render(p3)
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var2 (write), roactModule (ref), chatWindowMessageSourceModule (ref)
	local var3 = nil
	
	if not fFlagExpChatEnableV2ChatWindowModule then
		if fFlagExpChatUseMessagesStore then
			local messagesState = p3.state.messagesState
			var3 = if messagesState then if getFFlagTextChatEnableUniverseChatTabs() then var2(messagesState, p3.props.isChannelBarVisible, p3.props.targetTextChannel, p3.props.selectedChannelName) else var2(messagesState, p3.props.isChannelBarVisible, p3.props.targetTextChannel) else {}
		else
			var3 = if getFFlagTextChatEnableUniverseChatTabs() then var2(p3.props.messages, p3.props.isChannelBarVisible, p3.props.targetTextChannel, p3.props.selectedChannelName) else var2(p3.props.messages, p3.props.isChannelBarVisible, p3.props.targetTextChannel)
		end
	end
	return roactModule.createElement(chatWindowMessageSourceModule, {
		LayoutOrder = p3.props.LayoutOrder,
		messages = if fFlagExpChatEnableV2ChatWindowModule then nil else var3,
		size = p3.props.size,
		transparencyValue = p3.props.transparencyValue,
		textTransparency = p3.props.textTransparency,
		onHovered = p3.props.onHovered,
		onUnhovered = p3.props.onUnhovered,
		mutedUserIds = if fFlagExpChatUseMessagesStore then nil else p3.props.mutedUserIds,
		verifiedUserIds = p3.props.verifiedUserIds,
		activateWhisperMode = p3.props.activateWhisperMode,
		resetTargetChannel = p3.props.resetTargetChannel,
		visible = p3.props.visible,
		onAbsoluteSizeChanged = p3.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p3.props.onAbsolutePositionChanged,
		chatWindowSettings = p3.props.chatWindowSettings,
		showTranslationButton = p3.props.showTranslationButton,
		targetTextChannel = p3.props.targetTextChannel,
		selectedChannelName = p3.props.selectedChannelName,
		scrollResetKey = p3.props.selectedChannelName,
		isChannelBarVisible = p3.props.isChannelBarVisible,
		onFocus = p3.props.onFocus,
		onUnfocus = p3.props.onUnfocus
	})
end

return roactRoduxModule.connect(function(p3)
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagEnableVerifiedBadgeStore (ref)
	local _ = nil
	local selectedChannelName = p3.TextChannels.selectedChannelName
	
	return {
		chatIntervention = p3.ChatIntervention,
		messages = if fFlagExpChatEnableV2ChatWindowModule or fFlagExpChatUseMessagesStore then nil else p3.Messages,
		mutedUserIds = if fFlagExpChatUseMessagesStore then nil else p3.MutedUsers,
		verifiedUserIds = if fFlagEnableVerifiedBadgeStore then nil else p3.VerifiedUsers,
		targetTextChannel = p3.TextChannels.targetTextChannel,
		selectedChannelName = if selectedChannelName and p3.ChannelTabs and p3.ChannelTabs.allChannelTabs[selectedChannelName] then selectedChannelName elseif p3.ChannelTabs then p3.ChannelTabs.selectedTabName or "RBXGeneral" else "RBXGeneral"
	}
end, function(_)
	-- upvalues: fFlagExpChatTransparentFocusSupportModule (ref), getTransparencyStoreModule (ref)
	return {
		onFocus = function()
			-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), getTransparencyStoreModule (copy)
			return if fFlagExpChatTransparentFocusSupportModule then getTransparencyStoreModule(false).setContextMenuOpen() else getTransparencyStoreModule(false).setTextboxFocus()
		end,
		onUnfocus = function()
			-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), getTransparencyStoreModule (copy)
			return if fFlagExpChatTransparentFocusSupportModule then getTransparencyStoreModule(false).clearContextMenuOpen() else getTransparencyStoreModule(false).clearTextboxFocus()
		end
	}
end)(chatWindowApp)