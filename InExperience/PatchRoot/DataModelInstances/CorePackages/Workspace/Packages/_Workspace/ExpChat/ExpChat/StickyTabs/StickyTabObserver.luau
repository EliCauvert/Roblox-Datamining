local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local TextChatService = game:GetService("TextChatService")
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.ExpChatShared)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local PerUserAppStorageModule = require(ExpChat.Utils.perUserAppStorage)
local _ = require(script.Parent.StickyTabsStore)
local SelectTabByTypeModule = require(ExpChat.TabNavigation.selectTabByType)
local HasUserSelectedTabModule = require(ExpChat.mountClientApp.helpers.hasUserSelectedTab)
local StickyTabCountersModule = require(script.Parent.StickyTabCounters)
local ExpChatStickyTabTimeLimitSeconds = game:DefineFastInt("ExpChatStickyTabTimeLimitSeconds", 10)
local StickyTabObserverModule = {}
local v1 = nil
local v2: (() -> ())? = nil
local Connection = nil
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
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	return if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) else p1:getState().ChannelTabs.selectedTabName
end

local _ = function()
	-- upvalues: PerUserAppStorageModule (copy), FriendsChatTabNameModule (copy)
	local ExpChatStickyTabEntry = PerUserAppStorageModule.getEntry("ExpChatStickyTab")
	
	if type(ExpChatStickyTabEntry) ~= "table" then
		return nil, nil
	end
	local TabName = ExpChatStickyTabEntry.tabName
	
	if type(TabName) ~= "string" then
		return nil, nil
	elseif TabName ~= "RBXGeneral" and (TabName ~= "RBXGlobal" and TabName ~= FriendsChatTabNameModule) and ExpChatStickyTabEntry.experienceId ~= game.GameId then
		return TabName, nil
	else
		return TabName, TabName
	end
end

local function watchForTabChanges(p1)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), SignalsModule (copy), PerUserAppStorageModule (copy), StickyTabObserverModule (copy), v2 (ref)
	if FFlagExpChatUseChannelTabsStore then
		local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: ChannelTabsStoreModule (copy), PerUserAppStorageModule (upval)
			local SelectedTabName = ChannelTabsStoreModule.getSelectedTabName(p2)
			
			if SelectedTabName ~= nil then
				local GameId = game.GameId
				PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p3)
					-- upvalues: SelectedTabName (copy), GameId (copy)
					return if p3.tabName == SelectedTabName and p3.experienceId == GameId then nil else { tabName = SelectedTabName, experienceId = GameId }
				end)
			end
		end)
		ChannelTabsStoreModule.setOnChannelTabAdded(function(ChannelName)
			-- upvalues: StickyTabObserverModule (upval)
			StickyTabObserverModule:goToStickyTab(ChannelName)
		end)
		
		v2 = function()
			-- upvalues: Effect (copy), ChannelTabsStoreModule (copy)
			Effect()
			ChannelTabsStoreModule.setOnChannelTabAdded(nil)
		end
		
		return
	end
	local ChangedConnection = p1.changed:connect(function(Value, p2)
		-- upvalues: PerUserAppStorageModule (upval)
		local SelectedTabName = Value.ChannelTabs.selectedTabName
		
		if SelectedTabName ~= nil and SelectedTabName ~= p2.ChannelTabs.selectedTabName then
			local GameId = game.GameId
			PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p3)
				-- upvalues: SelectedTabName (copy), GameId (copy)
				return if p3.tabName == SelectedTabName and p3.experienceId == GameId then nil else { tabName = SelectedTabName, experienceId = GameId }
			end)
		end
	end)
	
	v2 = function()
		-- upvalues: ChangedConnection (copy)
		ChangedConnection:disconnect()
	end
	
	local SelectedTabName = p1:getState().ChannelTabs.selectedTabName
	
	if SelectedTabName ~= nil then
		local GameId = game.GameId
		PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p2)
			-- upvalues: SelectedTabName (copy), GameId (copy)
			return if p2.tabName == SelectedTabName and p2.experienceId == GameId then nil else { tabName = SelectedTabName, experienceId = GameId }
		end)
	end
end

local function watchForDeveloperDefault()
	-- upvalues: TextChatService (copy), ChannelName (ref), v1 (ref), HasUserSelectedTabModule (copy), StickyTabCountersModule (copy), Connection (ref)
	local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
	
	if ChatInputBarConfiguration == nil then return end
	local function onTargetChanged()
		-- upvalues: ChatInputBarConfiguration (copy), ChannelName (upval), v1 (upval), HasUserSelectedTabModule (upval), StickyTabCountersModule (upval)
		local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
		
		if ChannelName and TargetTextChannel and TargetTextChannel.Name ~= "RBXGeneral" and TargetTextChannel.Name ~= ChannelName then
			local HasUserSelectedTabModule1 = v1 ~= nil and HasUserSelectedTabModule(v1)
			StickyTabCountersModule.reportRestored(ChannelName, if HasUserSelectedTabModule1 then "other_tab_pinned" else "developer_default")
			ChannelName = nil
		end
	end
	
	local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
	
	if ChannelName and TargetTextChannel and TargetTextChannel.Name ~= "RBXGeneral" and TargetTextChannel.Name ~= ChannelName then
		local HasUserSelectedTabModule1 = v1 ~= nil and HasUserSelectedTabModule(v1)
		StickyTabCountersModule.reportRestored(ChannelName, if HasUserSelectedTabModule1 then "other_tab_pinned" else "developer_default")
		ChannelName = nil
	end
	Connection = ChatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(onTargetChanged)
end

function StickyTabObserverModule.start(p1, p2)
	-- upvalues: v1 (ref), ClockTime (ref), PerUserAppStorageModule (copy), FriendsChatTabNameModule (copy), ChannelName (ref), StickyTabCountersModule (copy), watchForTabChanges (copy), watchForDeveloperDefault (copy)
	p1:stop()
	v1 = p2
	ClockTime = os.clock()
	local ExpChatStickyTabEntry = PerUserAppStorageModule.getEntry("ExpChatStickyTab")
	local ChannelName1 = nil
	local v3 = nil
	
	if type(ExpChatStickyTabEntry) == "table" then
		local TabName = ExpChatStickyTabEntry.tabName
		
		if type(TabName) == "string" then
			if TabName ~= "RBXGeneral" and (TabName ~= "RBXGlobal" and TabName ~= FriendsChatTabNameModule) and ExpChatStickyTabEntry.experienceId ~= game.GameId then
				v3 = TabName
				ChannelName1 = nil
			else
				v3 = TabName
				ChannelName1 = TabName
			end
		else
			v3 = nil
			ChannelName1 = nil
		end
	else
		v3 = nil
		ChannelName1 = nil
	end
	ChannelName = ChannelName1
	StickyTabCountersModule.reportStarted(v3, ChannelName1 ~= nil)
	watchForTabChanges(p2)
	watchForDeveloperDefault()
	
	if ChannelName1 ~= nil then
		p1:goToStickyTab(ChannelName1)
	end
end

function StickyTabObserverModule:goToStickyTab(ChannelName1)
	-- upvalues: v1 (ref), ChannelName (ref), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), ClockTime (ref), ExpChatStickyTabTimeLimitSeconds (copy), StickyTabCountersModule (copy), HasUserSelectedTabModule (copy), SelectTabByTypeModule (copy), FriendsChatTabNameModule (copy)
	local v3 = v1
	
	if ChannelName1 == ChannelName and v3 ~= nil and (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName1] then
		local IsExpChatStickyTabTimeLimitSecondsBelow = ExpChatStickyTabTimeLimitSeconds < os.clock() - ClockTime
		task.defer(function()
			-- upvalues: v1 (upval), v3 (copy), ChannelName (upval), ChannelName1 (copy), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), StickyTabCountersModule (upval), IsExpChatStickyTabTimeLimitSecondsBelow (copy), HasUserSelectedTabModule (upval), SelectTabByTypeModule (upval), FriendsChatTabNameModule (upval)
			if v1 ~= v3 or ChannelName ~= ChannelName1 then return end
			ChannelName = nil
			
			if not (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName1] then
				StickyTabCountersModule.reportRestored(ChannelName1, "tab_removed")
				
				return
			end
			if IsExpChatStickyTabTimeLimitSecondsBelow then
				StickyTabCountersModule.reportRestored(ChannelName1, "too_late")
				
				return
			end
			local IsChannelNameMatch = (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) else v3:getState().ChannelTabs.selectedTabName) == ChannelName1
			
			if IsChannelNameMatch or not HasUserSelectedTabModule(v3) then
				StickyTabCountersModule.reportRestored(ChannelName1, if IsChannelNameMatch then "already_on_tab" else "switched")
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
			else
				StickyTabCountersModule.reportRestored(ChannelName1, "other_tab_pinned")
			end
		end)
		
		return
	end
end

function StickyTabObserverModule:stop()
	-- upvalues: ChannelName (ref), v1 (ref), Connection (ref), v2 (ref)
	ChannelName = nil
	v1 = nil
	
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
	local Callback: () -> () = v2
	
	if Callback then
		v2 = nil
		Callback()
	end
end

return StickyTabObserverModule