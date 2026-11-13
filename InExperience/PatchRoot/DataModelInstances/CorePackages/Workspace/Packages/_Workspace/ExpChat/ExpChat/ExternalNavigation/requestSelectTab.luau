local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(p1, p2): boolean
	-- upvalues: ExpChatSharedModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	local Store = ExpChatSharedModule.context.store
	
	if Store == nil then
		return false
	elseif not FFlagExpChatUseChannelTabsStore then
		local ChannelTabs = Store:getState().ChannelTabs
		
		return ChannelTabs ~= nil and ChannelTabs.allChannelTabs[p1] ~= nil
	else
		local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
		
		if ChannelTabsStoreModule.getChannelTabsState(false).allChannelTabs[p1] == nil then
			return false
		else
			ChannelTabsStoreModule.setTargetChannel(p1, false, p2)
			
			return true
		end
	end
end