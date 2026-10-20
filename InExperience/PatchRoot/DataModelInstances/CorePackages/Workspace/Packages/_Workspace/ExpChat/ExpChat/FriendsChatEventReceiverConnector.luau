local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FriendsChatEventReceiverModule = require(Parent.FriendsChat.FriendsChatEventReceiver)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local UseChannelTabUnreadWriterModule = require(ExpChat.useChannelTabUnreadWriter)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

local function selectIsChatWindowVisible(p1)
	return p1.ChatVisibility.isChatWindowEnabled.value
end

local function onActiveConversationMessageReceived()
	-- upvalues: GetTransparencyStoreModule (copy)
	GetTransparencyStoreModule(false).resetAllTransparency()
end

local function useSelectedTabNameFromSignals()
	-- upvalues: SignalsReactModule (copy), GetChannelTabsStoreModule (copy)
	return SignalsReactModule.useSignalState(GetChannelTabsStoreModule(false).getSelectedTabName)
end

local function useSelectedTabNameFromRodux()
	-- upvalues: UseSelectorFunction (copy), SelectSelectedTabNameModule (copy)
	return UseSelectorFunction(SelectSelectedTabNameModule)
end

local Callback = if require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore then useSelectedTabNameFromSignals else useSelectedTabNameFromRodux

return function()
	-- upvalues: Callback (copy), UseSelectorFunction (copy), selectIsChatWindowVisible (copy), UseChannelTabUnreadWriterModule (copy), FriendsChatTabNameModule (copy), ReactModule (copy), FriendsChatEventReceiverModule (copy), onActiveConversationMessageReceived (copy)
	return ReactModule.createElement(FriendsChatEventReceiverModule, {
		setTabUnread = UseChannelTabUnreadWriterModule(FriendsChatTabNameModule),
		selectedTabName = Callback(),
		isChatWindowVisible = UseSelectorFunction(selectIsChatWindowVisible),
		onActiveConversationMessageReceived = onActiveConversationMessageReceived
	})
end