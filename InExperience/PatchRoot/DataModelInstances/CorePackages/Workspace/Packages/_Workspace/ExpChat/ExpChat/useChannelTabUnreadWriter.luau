local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local setChannelUnreadStatusModule = require(expChat.Actions.SetChannelUnreadStatus)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

return function(p0)
	-- upvalues: getChannelTabsStoreModule (ref), useDispatch (ref), reactModule (ref), setChannelUnreadStatusModule (ref), fFlagExpChatUseChannelTabsStore (ref)
	local var6 = getChannelTabsStoreModule(false)
	local var7 = useDispatch()
	
	return reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), setChannelUnreadStatusModule (copy), p0 (ref), fFlagExpChatUseChannelTabsStore (copy), var6 (ref)
		var7(setChannelUnreadStatusModule(p0, p1))
		
		if fFlagExpChatUseChannelTabsStore then
			var6.setChannelUnreadStatus(p0, p1)
		end
	end, { var6, var7, p0 })
end