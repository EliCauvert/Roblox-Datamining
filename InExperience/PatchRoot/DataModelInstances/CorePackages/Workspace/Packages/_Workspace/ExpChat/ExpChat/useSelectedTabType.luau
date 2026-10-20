local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local _ = require(Parent.ExpChatShared)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function selectRoduxTabType(p1)
	local ChannelTabs = p1.ChannelTabs
	
	if ChannelTabs == nil or ChannelTabs.allChannelTabs == nil or ChannelTabs.selectedTabName == nil then
		return nil
	else
		local AllChannelTab = ChannelTabs.allChannelTabs[ChannelTabs.selectedTabName]
		
		return AllChannelTab and AllChannelTab.Type or nil
	end
end

local function useSelectedTabTypeFromSignals()
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), UseSignalStateFunction (copy)
	return UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: GetChannelTabsStoreModule (upval)
			local ChannelTabsState = GetChannelTabsStoreModule(false).getChannelTabsState(p1)
			local SelectedTabName = ChannelTabsState.selectedTabName
			
			if SelectedTabName == nil then
				return nil
			else
				local AllChannelTab = ChannelTabsState.allChannelTabs[SelectedTabName]
				
				return AllChannelTab and AllChannelTab.type or nil
			end
		end)
	end, {})))
end

local function useSelectedTabTypeFromRodux()
	-- upvalues: UseSelectorFunction (copy), selectRoduxTabType (copy)
	return UseSelectorFunction(selectRoduxTabType)
end

return if require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore then useSelectedTabTypeFromSignals else useSelectedTabTypeFromRodux