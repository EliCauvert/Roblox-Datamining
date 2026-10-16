local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local _ = require(parent.ExpChatShared)
local roactUtilsModule = require(parent.RoactUtils)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSignalState = signalsReactModule.useSignalState
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

local function selectRoduxTabType(p1)
	local channelTabs = p1.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		return nil
	end
	local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
	
	return if selectedTabName then selectedTabName.Type else nil
end

return function()
	-- upvalues: useSelector (ref), selectRoduxTabType (ref), useSignalState (ref), getChannelTabsStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref)
	local var1 = useSelector(selectRoduxTabType)
	local var2 = useSignalState(getChannelTabsStoreModule(false).getChannelTabsState)
	
	if not fFlagExpChatUseChannelTabsStore then
		return var1
	end
	local selectedTabName = var2.selectedTabName
	
	if selectedTabName == nil then
		return nil
	end
	local var3 = var2.allChannelTabs[selectedTabName]
	
	return if var3 then var3.type else nil
end