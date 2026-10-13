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
	-- upvalues: getFriendsTabVisibilityStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), signalsModule (ref), friendsChatTabNameModule (ref), friendsChatChannelAddedModule (ref), friendsChatChannelRemovedModule (ref)
	local var1 = getFriendsTabVisibilityStoreModule(false)
	local var2 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	return signalsModule.createEffect(function(p2)
		-- upvalues: var1 (ref), var2 (ref), friendsChatTabNameModule (copy), p1 (ref), friendsChatChannelAddedModule (copy), friendsChatChannelRemovedModule (copy)
		if var1.getIsFriendsTabVisible(p2) then
			if var2 then
				var2.addChannelTab({ type = "FriendsChat", name = friendsChatTabNameModule }, nil)
				
				return
			end
			p1:dispatch(friendsChatChannelAddedModule(friendsChatTabNameModule))
			
			return
		elseif var2 then
			var2.handleChannelRemoved(friendsChatTabNameModule)
			
			return
		end
		p1:dispatch(friendsChatChannelRemovedModule(friendsChatTabNameModule))
	end)
end