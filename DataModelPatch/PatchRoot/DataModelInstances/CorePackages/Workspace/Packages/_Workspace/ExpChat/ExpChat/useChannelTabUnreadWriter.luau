local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local SetChannelUnreadStatusModule = require(ExpChat.Actions.SetChannelUnreadStatus)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore

return function(p1)
	-- upvalues: GetChannelTabsStoreModule (copy), UseDispatchFunction (copy), ReactModule (copy), SetChannelUnreadStatusModule (copy), FFlagExpChatUseChannelTabsStore (copy)
	local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), SetChannelUnreadStatusModule (upval), p1 (copy), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy)
		UseDispatchResult(SetChannelUnreadStatusModule(p1, p2))
		
		if FFlagExpChatUseChannelTabsStore then
			ChannelTabsStoreModule.setChannelUnreadStatus(p1, p2)
		end
	end, { ChannelTabsStoreModule, UseDispatchResult, p1 })
end