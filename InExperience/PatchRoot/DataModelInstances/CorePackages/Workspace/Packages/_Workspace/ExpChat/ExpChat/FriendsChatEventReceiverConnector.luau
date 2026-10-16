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

local function selectIsChatWindowVisible(p1) --[[ Line: 39 ]]
	return p1.ChatVisibility.isChatWindowEnabled.value
end

local function onActiveConversationMessageReceived() --[[ Line: 45 ]]
	-- upvalues: GetTransparencyStoreModule (copy)
	GetTransparencyStoreModule(false).resetAllTransparency()
end

local function useSelectedTabNameFromSignals() --[[ Line: 49 ]]
	-- upvalues: SignalsReactModule (copy), GetChannelTabsStoreModule (copy)
	return SignalsReactModule.useSignalState(GetChannelTabsStoreModule(false).getSelectedTabName)
end

local function useSelectedTabNameFromRodux() --[[ Line: 53 ]]
	-- upvalues: UseSelectorFunction (copy), SelectSelectedTabNameModule (copy)
	return UseSelectorFunction(SelectSelectedTabNameModule)
end

local Callback = if require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore then useSelectedTabNameFromSignals else useSelectedTabNameFromRodux

return function() --[[ Line: 61 | Named "FriendsChatEventReceiverConnector" ]]
	-- upvalues: Callback (copy), UseSelectorFunction (copy), selectIsChatWindowVisible (copy), UseChannelTabUnreadWriterModule (copy), FriendsChatTabNameModule (copy), ReactModule (copy), FriendsChatEventReceiverModule (copy), onActiveConversationMessageReceived (copy)
	return ReactModule.createElement(FriendsChatEventReceiverModule, {
		setTabUnread = UseChannelTabUnreadWriterModule(FriendsChatTabNameModule),
		selectedTabName = Callback(),
		isChatWindowVisible = UseSelectorFunction(selectIsChatWindowVisible),
		onActiveConversationMessageReceived = onActiveConversationMessageReceived
	})
end