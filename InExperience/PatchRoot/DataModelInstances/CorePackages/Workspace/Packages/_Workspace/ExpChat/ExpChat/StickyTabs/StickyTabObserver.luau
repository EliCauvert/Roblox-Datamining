local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.ExpChatShared)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local PerUserAppStorageModule = require(ExpChat.Utils.perUserAppStorage)
local _ = require(script.Parent.StickyTabsStore)
local SelectTabByTypeModule = require(ExpChat.TabNavigation.selectTabByType)
local HasUserSelectedTabModule = require(ExpChat.mountClientApp.helpers.hasUserSelectedTab)
local ExpChatStickyTabTimeLimitSeconds = game:DefineFastInt("ExpChatStickyTabTimeLimitSeconds", 10)
local v1 = nil
local v2 = nil
local ChannelName = nil
local ClockTime = 0

local function _(FriendsChatTabNameModule1): boolean
	-- upvalues: FriendsChatTabNameModule (copy)
	return FriendsChatTabNameModule1 ~= "RBXGeneral" and (FriendsChatTabNameModule1 ~= "RBXGlobal" and FriendsChatTabNameModule1 ~= FriendsChatTabNameModule)
end

local _ = function(TabName)
	-- upvalues: PerUserAppStorageModule (copy)
	local GameId = game.GameId
	PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p1)
		-- upvalues: TabName (copy), GameId (copy)
		return if p1.tabName == TabName and p1.experienceId == GameId then nil else { tabName = TabName, experienceId = GameId }
	end)
end

local _ = function(FriendsChatTabNameModule1): string
	-- upvalues: FriendsChatTabNameModule (copy)
	return if FriendsChatTabNameModule1 == "RBXGlobal" then "UniverseChat" elseif FriendsChatTabNameModule1 == FriendsChatTabNameModule then "FriendsChat" else "TextChat"
end

local _ = function(p1)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	return if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else p1:getState().ChannelTabs.allChannelTabs
end

local _ = function(p1)
	-- upvalues: FriendsChatTabNameModule (copy)
	if type(p1) ~= "table" then
		return nil
	end
	local TabName = p1.tabName
	
	if type(TabName) == "string" then
		local IsNotTabNameMatch: boolean = TabName ~= "RBXGeneral" and (TabName ~= "RBXGlobal" and TabName ~= FriendsChatTabNameModule)
		
		return if IsNotTabNameMatch and p1.experienceId ~= game.GameId then nil else TabName
	else
		return nil
	end
end

return {
	start = function(p1, p2)
		-- upvalues: v1 (ref), ClockTime (ref), ChannelName (ref), PerUserAppStorageModule (copy), FriendsChatTabNameModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), SignalsModule (copy), v2 (ref)
		p1:stop()
		v1 = p2
		ClockTime = os.clock()
		local ExpChatStickyTabEntry = PerUserAppStorageModule.getEntry("ExpChatStickyTab")
		local v3 = nil
		
		if type(ExpChatStickyTabEntry) == "table" then
			local TabName = ExpChatStickyTabEntry.tabName
			
			if type(TabName) == "string" then
				local IsNotTabNameMatch: boolean = TabName ~= "RBXGeneral" and (TabName ~= "RBXGlobal" and TabName ~= FriendsChatTabNameModule)
				v3 = if IsNotTabNameMatch and ExpChatStickyTabEntry.experienceId ~= game.GameId then nil else TabName
			else
				v3 = nil
			end
		else
			v3 = nil
		end
		ChannelName = v3
		
		if FFlagExpChatUseChannelTabsStore then
			local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
			local Effect = SignalsModule.createEffect(function(p3)
				-- upvalues: ChannelTabsStoreModule (copy), PerUserAppStorageModule (upval)
				local SelectedTabName = ChannelTabsStoreModule.getSelectedTabName(p3)
				
				if SelectedTabName ~= nil then
					local GameId = game.GameId
					PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p4)
						-- upvalues: SelectedTabName (copy), GameId (copy)
						return if p4.tabName == SelectedTabName and p4.experienceId == GameId then nil else { tabName = SelectedTabName, experienceId = GameId }
					end)
				end
			end)
			ChannelTabsStoreModule.setOnChannelTabAdded(function(ChannelName)
				-- upvalues: p1 (copy)
				p1:goToStickyTab(ChannelName)
			end)
			
			v2 = function()
				-- upvalues: Effect (copy), ChannelTabsStoreModule (copy)
				Effect()
				ChannelTabsStoreModule.setOnChannelTabAdded(nil)
			end
		else
			local ChangedConnection = p2.changed:connect(function(Value, p3)
				-- upvalues: PerUserAppStorageModule (upval)
				local SelectedTabName = Value.ChannelTabs.selectedTabName
				
				if SelectedTabName ~= nil and SelectedTabName ~= p3.ChannelTabs.selectedTabName then
					local GameId = game.GameId
					PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p4)
						-- upvalues: SelectedTabName (copy), GameId (copy)
						return if p4.tabName == SelectedTabName and p4.experienceId == GameId then nil else { tabName = SelectedTabName, experienceId = GameId }
					end)
				end
			end)
			
			v2 = function()
				-- upvalues: ChangedConnection (copy)
				ChangedConnection:disconnect()
			end
			
			local SelectedTabName = p2:getState().ChannelTabs.selectedTabName
			
			if SelectedTabName ~= nil then
				local GameId = game.GameId
				PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p3)
					-- upvalues: SelectedTabName (copy), GameId (copy)
					return if p3.tabName == SelectedTabName and p3.experienceId == GameId then nil else { tabName = SelectedTabName, experienceId = GameId }
				end)
			end
		end
		local ChannelName1 = ChannelName
		
		if ChannelName1 ~= nil and (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else p2:getState().ChannelTabs.allChannelTabs)[ChannelName1] then
			p1:goToStickyTab(ChannelName1)
		end
	end,
	goToStickyTab = function(_, ChannelName1)
		-- upvalues: ChannelName (ref), v1 (ref), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), ClockTime (ref), ExpChatStickyTabTimeLimitSeconds (copy), HasUserSelectedTabModule (copy), SelectTabByTypeModule (copy), FriendsChatTabNameModule (copy)
		if ChannelName1 ~= ChannelName then return end
		local v3 = v1
		
		if v3 == nil or not (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName1] then return end
		ChannelName = nil
		
		if ExpChatStickyTabTimeLimitSeconds < os.clock() - ClockTime then return end
		if not HasUserSelectedTabModule(v3) then
			task.defer(function()
				-- upvalues: v1 (upval), v3 (copy), HasUserSelectedTabModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), ChannelName1 (copy), SelectTabByTypeModule (upval), FriendsChatTabNameModule (upval)
				if v1 == v3 and not HasUserSelectedTabModule(v3) and (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName1] then
					SelectTabByTypeModule(function(p1)
						-- upvalues: v3 (upval)
						return v3:dispatch(p1)
					end, {
						shouldReorderTabs = false,
						channelName = ChannelName1,
						tabType = if ChannelName1 == "RBXGlobal" then "UniverseChat" elseif ChannelName1 == FriendsChatTabNameModule then "FriendsChat" else "TextChat",
						textChannel = v3:getState().TextChannels.allTextChannels[ChannelName1]
					})
					
					return
				end
			end)
			
			return
		end
	end,
	stop = function(_)
		-- upvalues: ChannelName (ref), v1 (ref), v2 (ref)
		ChannelName = nil
		v1 = nil
		local Callback: () -> () = v2
		
		if Callback then
			v2 = nil
			Callback()
		end
	end
}