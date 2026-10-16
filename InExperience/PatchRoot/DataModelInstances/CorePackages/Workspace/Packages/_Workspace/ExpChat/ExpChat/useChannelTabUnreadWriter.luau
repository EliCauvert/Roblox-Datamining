local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local SetChannelUnreadStatusModule = require(ExpChat.Actions.SetChannelUnreadStatus)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

local function useSignalsChannelTabUnreadWriter(p1) --[[ Line: 16 ]]
	-- upvalues: GetChannelTabsStoreModule (copy), ReactModule (copy)
	local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
	
	return ReactModule.useCallback(function(p2) --[[ Line: 18 ]]
		-- upvalues: ChannelTabsStoreModule (copy), p1 (copy)
		ChannelTabsStoreModule.setChannelUnreadStatus(p1, p2)
	end, { ChannelTabsStoreModule, p1 })
end

local function useRoduxChannelTabUnreadWriter(p1) --[[ Line: 23 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SetChannelUnreadStatusModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.useCallback(function(p2) --[[ Line: 25 ]]
		-- upvalues: UseDispatchResult (copy), SetChannelUnreadStatusModule (upval), p1 (copy)
		UseDispatchResult(SetChannelUnreadStatusModule(p1, p2))
	end, { UseDispatchResult, p1 })
end

return if require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore then useSignalsChannelTabUnreadWriter else useRoduxChannelTabUnreadWriter