local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local friendsChatChannelAddedModule = require(expChat.Actions.FriendsChatChannelAdded)
local friendsChatChannelRemovedModule = require(expChat.Actions.FriendsChatChannelRemoved)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local getFriendsTabVisibilityStoreModule = require(parent.FriendsChat.GetFriendsTabVisibilityStore)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(p0) --[[ line: 16 | named "syncFriendsTabVisibility" ]]
	-- upvalues: getFriendsTabVisibilityStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), signalsModule (ref), friendsChatChannelAddedModule (ref), friendsChatChannelRemovedModule (ref)
	local var7 = getFriendsTabVisibilityStoreModule(false)
	local var8 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	
	return signalsModule.createEffect(function(p1) --[[ line: 20 ]]
		-- upvalues: var7 (ref), p0 (ref), friendsChatChannelAddedModule (copy), var8 (ref), friendsChatChannelRemovedModule (copy)
		if var7.getIsFriendsTabVisible(p1) then
			p0:dispatch(friendsChatChannelAddedModule("FriendsChat"))
			
			if var8 then
				var8.addChannelTab({ type = "FriendsChat", name = "FriendsChat" }, nil)
				
				return
			end
		else
			p0:dispatch(friendsChatChannelRemovedModule("FriendsChat"))
			
			if var8 then
				var8.handleChannelRemoved("FriendsChat")
			end
		end
	end)
end