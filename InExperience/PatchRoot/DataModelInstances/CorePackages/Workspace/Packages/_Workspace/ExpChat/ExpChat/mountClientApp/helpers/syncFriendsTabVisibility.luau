local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)
local FriendsChatChannelAddedModule = require(ExpChat.Actions.FriendsChatChannelAdded)
local FriendsChatChannelRemovedModule = require(ExpChat.Actions.FriendsChatChannelRemoved)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local GetFriendsTabVisibilityStoreModule = require(Parent.FriendsChat.GetFriendsTabVisibilityStore)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore

return function(p1)
	-- upvalues: GetFriendsTabVisibilityStoreModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), SignalsModule (copy), FriendsChatTabNameModule (copy), FriendsChatChannelAddedModule (copy), FriendsChatChannelRemovedModule (copy)
	local FriendsTabVisibilityStoreModule = GetFriendsTabVisibilityStoreModule(false)
	local ChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false) else nil
	
	return SignalsModule.createEffect(function(p2)
		-- upvalues: FriendsTabVisibilityStoreModule (copy), ChannelTabsStoreModule (copy), FriendsChatTabNameModule (upval), p1 (copy), FriendsChatChannelAddedModule (upval), FriendsChatChannelRemovedModule (upval)
		if FriendsTabVisibilityStoreModule.getIsFriendsTabVisible(p2) then
			if ChannelTabsStoreModule then
				ChannelTabsStoreModule.addChannelTab({ type = "FriendsChat", name = FriendsChatTabNameModule }, nil)
				
				return
			else
				p1:dispatch(FriendsChatChannelAddedModule(FriendsChatTabNameModule))
				
				return
			end
		elseif ChannelTabsStoreModule then
			ChannelTabsStoreModule.handleChannelRemoved(FriendsChatTabNameModule)
			
			return
		else
			p1:dispatch(FriendsChatChannelRemovedModule(FriendsChatTabNameModule))
		end
	end)
end