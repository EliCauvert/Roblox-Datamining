local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local setChannelUnreadStatusModule = require(expChat.Actions.SetChannelUnreadStatus)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(p1)
	-- upvalues: getChannelTabsStoreModule (ref), useDispatch (ref), reactModule (ref), setChannelUnreadStatusModule (ref), fFlagExpChatUseChannelTabsStore (ref)
	local var1 = getChannelTabsStoreModule(false)
	local var2 = useDispatch()
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), setChannelUnreadStatusModule (copy), p1 (ref), fFlagExpChatUseChannelTabsStore (copy), var1 (ref)
		var2(setChannelUnreadStatusModule(p1, p2))
		
		if fFlagExpChatUseChannelTabsStore then
			var1.setChannelUnreadStatus(p1, p2)
		end
	end, { var1, var2, p1 })
end