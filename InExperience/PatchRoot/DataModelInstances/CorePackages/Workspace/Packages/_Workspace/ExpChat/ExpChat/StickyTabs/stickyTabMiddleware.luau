local ExpChat = script:FindFirstAncestor("ExpChat")
local FriendsChatChannelAddedModule = require(ExpChat.Actions.FriendsChatChannelAdded)
local LocalTextChannelParticipantAddedModule = require(ExpChat.Actions.LocalTextChannelParticipantAdded)
local UniverseChatChannelAddedModule = require(ExpChat.Actions.UniverseChatChannelAdded)
local StickyTabObserverModule = require(script.Parent.StickyTabObserver)
local _ = require(script.Parent.StickyTabsStore)
local config = {
	[LocalTextChannelParticipantAddedModule.name] = function(p1)
		return p1.textChannel.Name
	end,
	[UniverseChatChannelAddedModule.name] = function(p1)
		return p1.channelName
	end,
	[FriendsChatChannelAddedModule.name] = function(p1)
		return p1.channelName
	end
}

return function(Callback, p1)
	-- upvalues: config (copy), StickyTabObserverModule (copy)
	return function(p2)
		-- upvalues: Callback (copy), config (upval), p1 (copy), StickyTabObserverModule (upval)
		local CallbackResult = Callback(p2)
		local Type = if type(p2) == "table" then p2.type else nil
		local Entry = if type(Type) == "string" then config[Type] else nil
		
		if Entry then
			local EntryResult = Entry(p2)
			local ChannelTabs = p1:getState().ChannelTabs
			
			if ChannelTabs and ChannelTabs.allChannelTabs[EntryResult] then
				StickyTabObserverModule:goToStickyTab(EntryResult)
			end
		end
		return CallbackResult
	end
end