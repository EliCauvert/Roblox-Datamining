local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local friendsChatEventReceiverModule = require(parent.FriendsChat.FriendsChatEventReceiver)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local useChannelTabUnreadWriterModule = require(expChat.useChannelTabUnreadWriter)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

local function selectIsChatWindowVisible(p1)
	return p1.ChatVisibility.isChatWindowEnabled.value
end

local function onActiveConversationMessageReceived()
	-- upvalues: getTransparencyStoreModule (ref)
	getTransparencyStoreModule(false).resetAllTransparency()
end

local var1 = if fFlagExpChatUseChannelTabsStore then function()
	-- upvalues: signalsReactModule (ref), getChannelTabsStoreModule (ref)
	return signalsReactModule.useSignalState(getChannelTabsStoreModule(false).getSelectedTabName)
end else function()
	-- upvalues: useSelector (ref), selectSelectedTabNameModule (ref)
	return useSelector(selectSelectedTabNameModule)
end

return function()
	-- upvalues: var1 (ref), useSelector (ref), selectIsChatWindowVisible (ref), useChannelTabUnreadWriterModule (ref), friendsChatTabNameModule (ref), reactModule (ref), friendsChatEventReceiverModule (ref), onActiveConversationMessageReceived (ref)
	return reactModule.createElement(friendsChatEventReceiverModule, {
		setTabUnread = useChannelTabUnreadWriterModule(friendsChatTabNameModule),
		selectedTabName = var1(),
		isChatWindowVisible = useSelector(selectIsChatWindowVisible),
		onActiveConversationMessageReceived = onActiveConversationMessageReceived
	})
end