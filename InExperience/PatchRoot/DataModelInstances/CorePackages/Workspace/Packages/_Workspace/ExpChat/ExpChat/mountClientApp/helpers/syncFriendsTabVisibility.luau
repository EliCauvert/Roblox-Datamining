local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local friendsChatChannelAddedModule = require(expChat.Actions.FriendsChatChannelAdded)
local friendsChatChannelRemovedModule = require(expChat.Actions.FriendsChatChannelRemoved)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local getFriendsTabVisibilityStoreModule = require(parent.FriendsChat.GetFriendsTabVisibilityStore)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(p1)
	-- upvalues: getFriendsTabVisibilityStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), signalsModule (ref), friendsChatChannelAddedModule (ref), friendsChatTabNameModule (ref), friendsChatChannelRemovedModule (ref)
	local var1 = getFriendsTabVisibilityStoreModule(false)
	local var2 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	return signalsModule.createEffect(function(p2)
		-- upvalues: var1 (ref), p1 (ref), friendsChatChannelAddedModule (copy), friendsChatTabNameModule (copy), var2 (ref), friendsChatChannelRemovedModule (copy)
		if var1.getIsFriendsTabVisible(p2) then
			p1:dispatch(friendsChatChannelAddedModule(friendsChatTabNameModule))
			
			if var2 then
				var2.addChannelTab({ type = "FriendsChat", name = friendsChatTabNameModule }, nil)
				
				return
			end
		else
			p1:dispatch(friendsChatChannelRemovedModule(friendsChatTabNameModule))
			
			if var2 then
				var2.handleChannelRemoved(friendsChatTabNameModule)
			end
		end
	end)
end