local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local setChannelUnreadStatusModule = require(expChat.Actions.SetChannelUnreadStatus)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return if sharedFlagsModule.FFlagExpChatUseChannelTabsStore then function(value)
	-- upvalues: getChannelTabsStoreModule (ref), reactModule (ref)
	local var1 = getChannelTabsStoreModule(false)
	
	return reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref), value (ref)
		var1.setChannelUnreadStatus(value, p1)
	end, { var1, value })
end else function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), setChannelUnreadStatusModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), setChannelUnreadStatusModule (copy), p1 (ref)
		var1(setChannelUnreadStatusModule(p1, p2))
	end, { var1, p1 })
end