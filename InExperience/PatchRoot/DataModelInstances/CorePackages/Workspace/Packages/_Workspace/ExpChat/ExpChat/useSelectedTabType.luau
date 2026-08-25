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

local function selectRoduxTabType(p0)
	local channelTabs = p0.ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil or channelTabs.selectedTabName == nil then
		return nil
	end
	local selectedTabName = channelTabs.allChannelTabs[channelTabs.selectedTabName]
	
	return if selectedTabName then selectedTabName.Type else nil
end

return function()
	-- upvalues: useSelector (ref), selectRoduxTabType (ref), useSignalState (ref), getChannelTabsStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref)
	local var6 = useSelector(selectRoduxTabType)
	local var7 = useSignalState(getChannelTabsStoreModule(false).getChannelTabsState)
	
	if not fFlagExpChatUseChannelTabsStore then
		return var6
	end
	local selectedTabName = var7.selectedTabName
	
	if selectedTabName == nil then
		return nil
	end
	local var8 = var7.allChannelTabs[selectedTabName]
	
	return if var8 then var8.type else nil
end