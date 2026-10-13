local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local _ = require(parent.ExpChatShared)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSignalState = signalsReactModule.useSignalState

local function selectRoduxTabType(p1)
	local channelTabs = p1.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		return nil
	end
	local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
	
	return if selectedTabName then selectedTabName.Type else nil
end

return if sharedFlagsModule.FFlagExpChatUseChannelTabsStore then function()
	-- upvalues: reactModule (ref), signalsModule (ref), getChannelTabsStoreModule (ref), useSignalState (ref)
	return useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getChannelTabsStoreModule (copy)
		return signalsModule.createComputed(function(p1)
			-- upvalues: getChannelTabsStoreModule (copy)
			local channelTabsState = getChannelTabsStoreModule(false).getChannelTabsState(p1)
			local selectedTabName = channelTabsState.selectedTabName
			
			if selectedTabName == nil then
				return nil
			end
			local var1 = channelTabsState.allChannelTabs[selectedTabName]
			
			return if var1 then var1.type else nil
		end)
	end, {}))
end else function()
	-- upvalues: useSelector (ref), selectRoduxTabType (ref)
	return useSelector(selectRoduxTabType)
end