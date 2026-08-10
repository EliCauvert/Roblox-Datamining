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

local function readByMessageIdAsTable(p0, p1) --[[ line: 27 ]]
	-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (ref)
	local var15 = if p1 then p0.getByMessageId(p1) else p0.getByMessageId(false)
	
	if not fFlagExpChatMessagesStoreUseProxyModule then
		return var15
	end
	local t = {}
	
	for i, v in var15 do
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
local var14 = if getFFlagTextChatEnableUniverseChatTabs() then memoizeModule(function(p7, p8, p9, p10) --[[ line: 50 ]]
	-- upvalues: list (ref)
	if not p8 then
		return list.map(p7.windowMessagesInOrder, function(p11) --[[ line: 52 ]]
			-- upvalues: p7 (ref)
			return p7.byMessageId[p11]
		end)
	end
	local var17 = if p9 and p7.windowMessagesInOrderByTabId[p9.Name] then p9.Name else p10
	
	return if var17 then list.map(p7.windowMessagesInOrderByTabId[var17] or {}, function(p12) --[[ line: 61 ]]
		-- upvalues: p7 (ref)
		return p7.byMessageId[p12]
	end) else {}
end) else memoizeModule(function(p2, p3, p4) --[[ line: 70 ]]
	-- upvalues: list (ref)
	return if p3 then if p4 then list.map(p2.windowMessagesInOrderByTabId[p4.Name] or {}, function(p6) --[[ line: 79 ]]
		-- upvalues: p2 (ref)
		return p2.byMessageId[p6]
	end) else {} else list.map(p2.windowMessagesInOrder, function(p5) --[[ line: 72 ]]
		-- upvalues: p2 (ref)
		return p2.byMessageId[p5]
	end)
end)

if fFlagExpChatUseMessagesStore and not fFlagExpChatEnableV2ChatWindowModule then
	function chatWindowApp.init(p13) --[[ line: 90 ]]
		-- upvalues: getMessagesStoreModule (ref), expChatMoveMessagesStoreToInit (ref), readByMessageIdAsTable (ref)
		p13.MessagesStore = getMessagesStoreModule(false)
		p13.disposeEffects = {}
		
		if expChatMoveMessagesStoreToInit and p13.MessagesStore then
			p13.state = {
				messagesState = {
					byMessageId = readByMessageIdAsTable(p13.MessagesStore),
					windowMessagesInOrder = p13.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p13.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
			}
			
			return
		end
		p13.state = { messagesState = nil }
	end
	
	function chatWindowApp.didMount(p14) --[[ line: 109 ]]
		-- upvalues: expChatMoveMessagesStoreToInit (ref), readByMessageIdAsTable (ref), createEffect (ref)
		if p14.MessagesStore then
			if not expChatMoveMessagesStoreToInit then
				local t = {
					byMessageId = readByMessageIdAsTable(p14.MessagesStore),
					windowMessagesInOrder = p14.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p14.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
				
				if t then
					p14:setState({ messagesState = t })
				end
			end
			table.insert(p14.disposeEffects, createEffect(function(p15) --[[ line: 130 ]]
				-- upvalues: readByMessageIdAsTable (copy), p14 (ref)
				local var19 = readByMessageIdAsTable(p14.MessagesStore, p15)
				local windowMessagesInOrder = p14.MessagesStore.getWindowMessagesInOrder(p15)
				local windowMessagesInOrderByTabId = p14.MessagesStore.getWindowMessagesInOrderByTabId(p15)
				
				if var19 or windowMessagesInOrder or windowMessagesInOrderByTabId then
					p14:setState({
						messagesState = {
							byMessageId = var19,
							windowMessagesInOrder = windowMessagesInOrder,
							windowMessagesInOrderByTabId = windowMessagesInOrderByTabId
						}
					})
				end
			end))
		end
	end
	
	function chatWindowApp.willUnmount(p16) --[[ line: 150 ]]
		if p16.disposeEffects then
			for i, v in ipairs(p16.disposeEffects) do
				v()
			end
			p16.disposeEffects = {}
		end
	end
end
function chatWindowApp.render(p17) --[[ line: 160 ]]
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var14 (write), roactModule (ref), chatWindowMessageSourceModule (ref)
	local var22 = nil
	
	if not fFlagExpChatEnableV2ChatWindowModule then
		if fFlagExpChatUseMessagesStore then
			local messagesState = p17.state.messagesState
			var22 = if messagesState then if getFFlagTextChatEnableUniverseChatTabs() then var14(messagesState, p17.props.isChannelBarVisible, p17.props.targetTextChannel, p17.props.selectedChannelName) else var14(messagesState, p17.props.isChannelBarVisible, p17.props.targetTextChannel) else {}
		else
			var22 = if getFFlagTextChatEnableUniverseChatTabs() then var14(p17.props.messages, p17.props.isChannelBarVisible, p17.props.targetTextChannel, p17.props.selectedChannelName) else var14(p17.props.messages, p17.props.isChannelBarVisible, p17.props.targetTextChannel)
		end
	end
	return roactModule.createElement(chatWindowMessageSourceModule, {
		LayoutOrder = p17.props.LayoutOrder,
		messages = if fFlagExpChatEnableV2ChatWindowModule then nil else var22,
		size = p17.props.size,
		transparencyValue = p17.props.transparencyValue,
		textTransparency = p17.props.textTransparency,
		onHovered = p17.props.onHovered,
		onUnhovered = p17.props.onUnhovered,
		mutedUserIds = if fFlagExpChatUseMessagesStore then nil else p17.props.mutedUserIds,
		verifiedUserIds = p17.props.verifiedUserIds,
		activateWhisperMode = p17.props.activateWhisperMode,
		resetTargetChannel = p17.props.resetTargetChannel,
		visible = p17.props.visible,
		onAbsoluteSizeChanged = p17.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p17.props.onAbsolutePositionChanged,
		chatWindowSettings = p17.props.chatWindowSettings,
		showTranslationButton = p17.props.showTranslationButton,
		targetTextChannel = p17.props.targetTextChannel,
		selectedChannelName = p17.props.selectedChannelName,
		scrollResetKey = p17.props.selectedChannelName,
		isChannelBarVisible = p17.props.isChannelBarVisible,
		onFocus = p17.props.onFocus,
		onUnfocus = p17.props.onUnfocus
	})
end

return roactRoduxModule.connect(function(p18) --[[ line: 226 ]]
	-- upvalues: fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagEnableVerifiedBadgeStore (ref)
	local _ = nil
	local selectedChannelName = p18.TextChannels.selectedChannelName
	
	return {
		chatIntervention = p18.ChatIntervention,
		messages = if fFlagExpChatEnableV2ChatWindowModule or fFlagExpChatUseMessagesStore then nil else p18.Messages,
		mutedUserIds = if fFlagExpChatUseMessagesStore then nil else p18.MutedUsers,
		verifiedUserIds = if fFlagEnableVerifiedBadgeStore then nil else p18.VerifiedUsers,
		targetTextChannel = p18.TextChannels.targetTextChannel,
		selectedChannelName = if selectedChannelName and p18.ChannelTabs and p18.ChannelTabs.allChannelTabs[selectedChannelName] then selectedChannelName elseif p18.ChannelTabs then p18.ChannelTabs.selectedTabName or "RBXGeneral" else "RBXGeneral"
	}
end, function(_) --[[ line: 245 ]]
	-- upvalues: fFlagExpChatTransparentFocusSupportModule (ref), getTransparencyStoreModule (ref)
	return {
		onFocus = function() --[[ line: 247 ]]
			-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), getTransparencyStoreModule (copy)
			return if fFlagExpChatTransparentFocusSupportModule then getTransparencyStoreModule(false).setContextMenuOpen() else getTransparencyStoreModule(false).setTextboxFocus()
		end,
		onUnfocus = function() --[[ line: 255 ]]
			-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), getTransparencyStoreModule (copy)
			return if fFlagExpChatTransparentFocusSupportModule then getTransparencyStoreModule(false).clearContextMenuOpen() else getTransparencyStoreModule(false).clearTextboxFocus()
		end
	}
end)(chatWindowApp)