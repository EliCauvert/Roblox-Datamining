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

return function(p0)
	-- upvalues: getFriendsTabVisibilityStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), signalsModule (ref), friendsChatChannelAddedModule (ref), friendsChatTabNameModule (ref), friendsChatChannelRemovedModule (ref)
	local var8 = getFriendsTabVisibilityStoreModule(false)
	local var9 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	return signalsModule.createEffect(function(p1)
		-- upvalues: var8 (ref), p0 (ref), friendsChatChannelAddedModule (copy), friendsChatTabNameModule (copy), var9 (ref), friendsChatChannelRemovedModule (copy)
		if var8.getIsFriendsTabVisible(p1) then
			p0:dispatch(friendsChatChannelAddedModule(friendsChatTabNameModule))
			
			if var9 then
				var9.addChannelTab({ type = "FriendsChat", name = friendsChatTabNameModule }, nil)
				
				return
			end
		else
			p0:dispatch(friendsChatChannelRemovedModule(friendsChatTabNameModule))
			
			if var9 then
				var9.handleChannelRemoved(friendsChatTabNameModule)
			end
		end
	end)
end