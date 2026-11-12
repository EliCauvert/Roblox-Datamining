local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore

return function(p1): boolean
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
			ChannelTabsStoreModule.setTargetChannel(p1, false)
			
			return true
		end
	end
end