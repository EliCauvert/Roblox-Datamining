local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local List = require(Parent.llama).List
local MemoizeModule = require(ExpChat.memoize)
local SignalsModule = require(Parent.Signals)
local CreateEffectFunction = SignalsModule.createEffect
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagEnableVerifiedBadgeStore = require(Parent.SharedFlags).FFlagEnableVerifiedBadgeStore
local ChatWindowMessageSourceModule = require(script.Parent.UI.ChatWindow.ChatWindowMessageSource)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then require(ExpChat.Stores.GetChannelTabsStore) else nil
local ExpChatMoveMessagesStoreToInit = game:DefineFastFlag("ExpChatMoveMessagesStoreToInit", false)
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatMessagesStoreUseProxyModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreUseProxy)

local function readByMessageIdAsTable(MessagesStore, p1)
	-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (copy)
	local ByMessageId = if p1 then MessagesStore.getByMessageId(p1) else MessagesStore.getByMessageId(false)
	
	if not FFlagExpChatMessagesStoreUseProxyModule then
		return ByMessageId
	end
	local t = {}
	
	for i, value in ByMessageId do
		t[i] = value
	end
	return t
end

local ChatWindowApp = RoactModule.Component:extend("ChatWindowApp")
ChatWindowApp.defaultProps = {
	LayoutOrder = 1,
	messages = if FFlagExpChatEnableV2ChatWindowModule then nil else {},
	size = UDim2.fromScale(1, 1)
}
local Callback = nil
Callback = if GetFFlagTextChatEnableUniverseChatTabsFunction() then MemoizeModule(function(MessagesState, p2, p3, Name)
	-- upvalues: List (copy), FFlagExpChatGlobalTabDefaultModule (copy)
	if not p2 then
		return List.map(MessagesState.windowMessagesInOrder, function(p4)
			-- upvalues: MessagesState (copy)
			return MessagesState.byMessageId[p4]
		end)
	end
	local Name1 = Name
	
	if FFlagExpChatGlobalTabDefaultModule then
		if p3 and MessagesState.windowMessagesInOrderByTabId[p3.Name] and Name ~= "RBXGlobal" then
			Name1 = p3.Name
		end
	elseif p3 and MessagesState.windowMessagesInOrderByTabId[p3.Name] then
		Name1 = p3.Name
	end
	return if Name1 then List.map(MessagesState.windowMessagesInOrderByTabId[Name1] or {}, function(p4)
		-- upvalues: MessagesState (copy)
		return MessagesState.byMessageId[p4]
	end) else {}
end) else MemoizeModule(function(MessagesState, p2, p3)
	-- upvalues: List (copy)
	return if p2 then if p3 then List.map(MessagesState.windowMessagesInOrderByTabId[p3.Name] or {}, function(p4)
		-- upvalues: MessagesState (copy)
		return MessagesState.byMessageId[p4]
	end) else {} else List.map(MessagesState.windowMessagesInOrder, function(p4)
		-- upvalues: MessagesState (copy)
		return MessagesState.byMessageId[p4]
	end)
end)

if not FFlagExpChatEnableV2ChatWindowModule then
	function ChatWindowApp.init(p2)
		-- upvalues: GetMessagesStoreModule (copy), ExpChatMoveMessagesStoreToInit (copy), readByMessageIdAsTable (copy)
		p2.MessagesStore = GetMessagesStoreModule(false)
		p2.disposeEffects = {}
		
		if ExpChatMoveMessagesStoreToInit and p2.MessagesStore then
			p2.state = {
				messagesState = {
					byMessageId = readByMessageIdAsTable(p2.MessagesStore),
					windowMessagesInOrder = p2.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p2.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
			}
			
			return
		else
			p2.state = { messagesState = nil }
		end
	end
	
	function ChatWindowApp.didMount(p2)
		-- upvalues: ExpChatMoveMessagesStoreToInit (copy), readByMessageIdAsTable (copy), CreateEffectFunction (copy)
		if p2.MessagesStore then
			if not ExpChatMoveMessagesStoreToInit then
				local MessagesState = {
					byMessageId = readByMessageIdAsTable(p2.MessagesStore),
					windowMessagesInOrder = p2.MessagesStore.getWindowMessagesInOrder(false),
					windowMessagesInOrderByTabId = p2.MessagesStore.getWindowMessagesInOrderByTabId(false)
				}
				
				if MessagesState then
					p2:setState({ messagesState = MessagesState })
				end
			end
			table.insert(p2.disposeEffects, (CreateEffectFunction(function(p3)
				-- upvalues: readByMessageIdAsTable (upval), p2 (copy)
				local ByMessageIdAsTable = readByMessageIdAsTable(p2.MessagesStore, p3)
				local WindowMessagesInOrder = p2.MessagesStore.getWindowMessagesInOrder(p3)
				local WindowMessagesInOrderByTabId = p2.MessagesStore.getWindowMessagesInOrderByTabId(p3)
				
				if ByMessageIdAsTable or WindowMessagesInOrder or WindowMessagesInOrderByTabId then
					p2:setState({
						messagesState = {
							byMessageId = ByMessageIdAsTable,
							windowMessagesInOrder = WindowMessagesInOrder,
							windowMessagesInOrderByTabId = WindowMessagesInOrderByTabId
						}
					})
				end
			end)))
		end
	end
	
	function ChatWindowApp.willUnmount(p2)
		if p2.disposeEffects then
			for _, disposeEffect in ipairs(p2.disposeEffects) do
				disposeEffect()
			end
			p2.disposeEffects = {}
		end
	end
end
function ChatWindowApp.render(p2)
	-- upvalues: FFlagExpChatEnableV2ChatWindowModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), Callback (ref), RoactModule (copy), ChatWindowMessageSourceModule (copy)
	local v1 = nil
	
	if not FFlagExpChatEnableV2ChatWindowModule then
		local MessagesState = p2.state.messagesState
		v1 = if MessagesState then if GetFFlagTextChatEnableUniverseChatTabsFunction() then Callback(MessagesState, p2.props.isChannelBarVisible, p2.props.targetTextChannel, p2.props.selectedChannelName) else Callback(MessagesState, p2.props.isChannelBarVisible, p2.props.targetTextChannel) else {}
	end
	return RoactModule.createElement(ChatWindowMessageSourceModule, {
		LayoutOrder = p2.props.LayoutOrder,
		messages = if FFlagExpChatEnableV2ChatWindowModule then nil else v1,
		size = p2.props.size,
		transparencyValue = p2.props.transparencyValue,
		textTransparency = p2.props.textTransparency,
		onHovered = p2.props.onHovered,
		onUnhovered = p2.props.onUnhovered,
		verifiedUserIds = p2.props.verifiedUserIds,
		activateWhisperMode = p2.props.activateWhisperMode,
		resetTargetChannel = p2.props.resetTargetChannel,
		visible = p2.props.visible,
		onAbsoluteSizeChanged = p2.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p2.props.onAbsolutePositionChanged,
		chatWindowSettings = p2.props.chatWindowSettings,
		showTranslationButton = p2.props.showTranslationButton,
		targetTextChannel = p2.props.targetTextChannel,
		selectedChannelName = p2.props.selectedChannelName,
		scrollResetKey = p2.props.selectedChannelName,
		isChannelBarVisible = p2.props.isChannelBarVisible,
		onFocus = p2.props.onFocus,
		onUnfocus = p2.props.onUnfocus
	})
end

local function _(List, List1): boolean
	if List == List1 then
		return true
	end
	for i in List do
		if List1[i] == nil then
			return false
		end
	end
	for i1 in List1 do
		if List[i1] == nil then
			return false
		end
	end
	return true
end

local MemoResult = ReactModule.memo(ChatWindowApp)

local function ChatWindowAppWithSignals(p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), SignalsReactModule (copy), MemoResult (copy), CryoModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: GetChannelTabsStoreModule (upval)
			local ChannelTabsState = GetChannelTabsStoreModule(false).getChannelTabsState(p3)
			
			return {
				allChannelTabs = ChannelTabsState.allChannelTabs,
				selectedTabName = ChannelTabsState.selectedTabName
			}
		end, function(p3, p4): boolean
			local Flag = false
			
			if p3.selectedTabName == p4.selectedTabName then
				local AllChannelTabs = p3.allChannelTabs
				local AllChannelTabs1 = p4.allChannelTabs
				
				if AllChannelTabs == AllChannelTabs1 then
					return true
				end
				for allChannelTab in AllChannelTabs do
					if AllChannelTabs1[allChannelTab] == nil then
						return false
					end
				end
				for i in AllChannelTabs1 do
					if AllChannelTabs[i] == nil then
						return false
					end
				end
				Flag = true
			end
			return Flag
		end)
	end, {})))
	local RoduxSelectedChannelName = p2.roduxSelectedChannelName
	
	return ReactModule.createElement(MemoResult, CryoModule.Dictionary.union(p2, {
		selectedChannelName = if RoduxSelectedChannelName and UseSignalStateResult.allChannelTabs[RoduxSelectedChannelName] then RoduxSelectedChannelName else UseSignalStateResult.selectedTabName or "RBXGeneral"
	}))
end

return RoactRoduxModule.connect(function(p3)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), FFlagEnableVerifiedBadgeStore (copy)
	local SelectedTabName = nil
	
	if not FFlagExpChatUseChannelTabsStore then
		local ChannelTabs = p3.ChannelTabs
		local SelectedChannelName = p3.TextChannels.selectedChannelName
		SelectedTabName = if SelectedChannelName and ChannelTabs and ChannelTabs.allChannelTabs[SelectedChannelName] then SelectedChannelName else ChannelTabs and ChannelTabs.selectedTabName or "RBXGeneral"
	end
	return {
		chatIntervention = p3.ChatIntervention,
		verifiedUserIds = if FFlagEnableVerifiedBadgeStore then nil else p3.VerifiedUsers,
		targetTextChannel = p3.TextChannels.targetTextChannel,
		selectedChannelName = SelectedTabName,
		roduxSelectedChannelName = if FFlagExpChatUseChannelTabsStore then p3.TextChannels.selectedChannelName else nil
	}
end, function(_)
	-- upvalues: GetTransparencyStoreModule (copy)
	return {
		onFocus = function()
			-- upvalues: GetTransparencyStoreModule (upval)
			return GetTransparencyStoreModule(false).setContextMenuOpen()
		end,
		onUnfocus = function()
			-- upvalues: GetTransparencyStoreModule (upval)
			return GetTransparencyStoreModule(false).clearContextMenuOpen()
		end
	}
end)(if FFlagExpChatUseChannelTabsStore then ChatWindowAppWithSignals else ChatWindowApp)