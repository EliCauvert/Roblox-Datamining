local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local TextChatService = game:GetService("TextChatService")
local SignalsModule = require(Parent.Signals)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local PerUserAppStorageModule = require(ExpChat.Utils.perUserAppStorage)
local IsStickyTabRestoreEnabledModule = require(ExpChat.isStickyTabRestoreEnabled)
local _ = require(script.Parent.StickyTabsStore)
local SelectTabByTypeModule = require(ExpChat.TabNavigation.selectTabByType)
local HasUserSelectedTabModule = require(ExpChat.mountClientApp.helpers.hasUserSelectedTab)
local StickyTabCountersModule = require(script.Parent.StickyTabCounters)
local FFlagGlobalTextChatAddPlaySessionFieldModule = require(ExpChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local Copy = table.clone(ExpChatSharedModule.Analytics.DefaultStandardizedFields)
table.insert(Copy, "addPlaceInstanceId")

if FFlagGlobalTextChatAddPlaySessionFieldModule then
	table.insert(Copy, "addPlaySessionId")
end
local ExpChatStickyTabTimeLimitSeconds = game:DefineFastInt("ExpChatStickyTabTimeLimitSeconds", 10)
local StickyTabObserverModule = {}
local v1 = nil
local v2: (() -> ())? = nil
local Connection = nil
local Config = nil
local SelectedTabName = nil
local DelayedThread = nil
local Stabilized_tab = nil
local ClockTime = 0

local function _(FriendsChatTabNameModule1): boolean
	-- upvalues: FriendsChatTabNameModule (copy)
	return FriendsChatTabNameModule1 ~= "RBXGeneral" and (FriendsChatTabNameModule1 ~= "RBXGlobal" and FriendsChatTabNameModule1 ~= FriendsChatTabNameModule)
end

local _ = function(TabName)
	-- upvalues: IsStickyTabRestoreEnabledModule (copy), PerUserAppStorageModule (copy)
	if IsStickyTabRestoreEnabledModule() then
		local GameId = game.GameId
		PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p1)
			-- upvalues: TabName (copy), GameId (copy)
			return if p1.tabName == TabName and p1.experienceId == GameId then nil else { tabName = TabName, experienceId = GameId }
		end)
		
		return
	end
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

local function readStickyTab()
	-- upvalues: PerUserAppStorageModule (copy), FriendsChatTabNameModule (copy)
	local ExpChatStickyTabEntry = PerUserAppStorageModule.getEntry("ExpChatStickyTab")
	
	if type(ExpChatStickyTabEntry) ~= "table" then
		return nil
	end
	local TabName = ExpChatStickyTabEntry.tabName
	
	if type(TabName) == "string" then
		local IsNotExperienceIdMatch: boolean = TabName ~= "RBXGeneral" and (TabName ~= "RBXGlobal" and TabName ~= FriendsChatTabNameModule and ExpChatStickyTabEntry.experienceId ~= game.GameId)
		
		return {
			tabName = TabName,
			status = if IsNotExperienceIdMatch then "other_experience" else "pending"
		}
	else
		return nil
	end
end

local _ = function(TabName): boolean
	-- upvalues: Config (ref)
	return Config ~= nil and (Config.status == "pending" and (TabName == nil or Config.tabName == TabName))
end

local _ = function(): boolean
	-- upvalues: Config (ref)
	return Config ~= nil and (Config.status == "switched" or Config.status == "already_on_tab")
end

local function handleStickyTabEvent(ChannelName, Status)
	-- upvalues: StickyTabCountersModule (copy), Config (ref), v1 (ref), SelectTabByTypeModule (copy), FriendsChatTabNameModule (copy)
	StickyTabCountersModule.reportRestored(ChannelName, Status)
	Config = { tabName = ChannelName, status = Status }
	local v3 = v1
	
	if v3 and (Config ~= nil and (Config.status == "switched" or Config.status == "already_on_tab")) then
		SelectTabByTypeModule(function(p1)
			-- upvalues: v3 (copy)
			return v3:dispatch(p1)
		end, {
			shouldReorderTabs = false,
			channelName = ChannelName,
			tabType = if ChannelName == "RBXGlobal" then "UniverseChat" elseif ChannelName == FriendsChatTabNameModule then "FriendsChat" else "TextChat",
			textChannel = v3:getState().TextChannels.allTextChannels[ChannelName]
		})
	end
end

local function reportStabilizedTab(Stabilized_tab)
	-- upvalues: DelayedThread (ref), TextChatService (copy), SelectedTabName (ref), Config (ref), ExpChatSharedModule (copy), Copy (copy)
	local CurrentThread = DelayedThread
	
	if CurrentThread == nil then return end
	DelayedThread = nil
	
	if CurrentThread ~= coroutine.running() then
		task.cancel(CurrentThread)
	end
	local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local Enabled = ChannelTabsConfiguration ~= nil and ChannelTabsConfiguration.Enabled
	ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatTabStabilizedConfig, {
		intended_tab = (if SelectedTabName and not Enabled then "RBXGeneral" else SelectedTabName) or (if Config and Config.status ~= "other_experience" then Config.tabName else nil),
		stabilized_tab = Stabilized_tab
	}, Copy)
end

local _ = function(Stabilized_tab1, p1)
	-- upvalues: v1 (ref), DelayedThread (ref), reportStabilizedTab (copy), HasUserSelectedTabModule (copy), Config (ref), Stabilized_tab (ref), SelectedTabName (ref)
	local v3 = v1
	
	if DelayedThread == nil or v3 == nil then return end
	if p1 == "timeLimit" then
		reportStabilizedTab(Stabilized_tab1)
		
		return
	end
	if Stabilized_tab1 == nil then return end
	if p1 == "start" and HasUserSelectedTabModule(v3) then
		reportStabilizedTab(Stabilized_tab1)
		
		return
	end
	if p1 == "selected" and ((Config == nil or Config.status ~= "switched" and Config.status ~= "already_on_tab") and HasUserSelectedTabModule(v3)) then
		reportStabilizedTab(Stabilized_tab)
		
		return
	end
	Stabilized_tab = Stabilized_tab1
	
	if SelectedTabName and Stabilized_tab1 == SelectedTabName then
		reportStabilizedTab(Stabilized_tab1)
	end
end

local function watchForTabChanges(p1)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), SignalsModule (copy), IsStickyTabRestoreEnabledModule (copy), PerUserAppStorageModule (copy), v1 (ref), DelayedThread (ref), Config (ref), HasUserSelectedTabModule (copy), reportStabilizedTab (copy), Stabilized_tab (ref), SelectedTabName (ref), StickyTabObserverModule (copy), v2 (ref)
	if FFlagExpChatUseChannelTabsStore then
		local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: ChannelTabsStoreModule (copy), IsStickyTabRestoreEnabledModule (upval), PerUserAppStorageModule (upval), v1 (upval), DelayedThread (upval), Config (upval), HasUserSelectedTabModule (upval), reportStabilizedTab (upval), Stabilized_tab (upval), SelectedTabName (upval)
			local SelectedTabName1 = ChannelTabsStoreModule.getSelectedTabName(p2)
			
			if SelectedTabName1 ~= nil then
				if IsStickyTabRestoreEnabledModule() then
					local GameId = game.GameId
					PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p3)
						-- upvalues: SelectedTabName1 (copy), GameId (copy)
						return if p3.tabName == SelectedTabName1 and p3.experienceId == GameId then nil else { tabName = SelectedTabName1, experienceId = GameId }
					end)
				end
				local v3 = v1
				
				if DelayedThread ~= nil then
					if v3 == nil then return end
					if SelectedTabName1 == nil then return end
					if (Config == nil or Config.status ~= "switched" and Config.status ~= "already_on_tab") and HasUserSelectedTabModule(v3) then
						reportStabilizedTab(Stabilized_tab)
						
						return
					end
					Stabilized_tab = SelectedTabName1
					
					if SelectedTabName and SelectedTabName1 == SelectedTabName then
						reportStabilizedTab(SelectedTabName1)
					end
				end
			end
		end)
		ChannelTabsStoreModule.setOnChannelTabAdded(function(TabName)
			-- upvalues: StickyTabObserverModule (upval)
			StickyTabObserverModule:goToStickyTab(TabName)
		end)
		
		v2 = function()
			-- upvalues: Effect (copy), ChannelTabsStoreModule (copy)
			Effect()
			ChannelTabsStoreModule.setOnChannelTabAdded(nil)
		end
		
		return
	end
	local ChangedConnection = p1.changed:connect(function(Value, p2)
		-- upvalues: IsStickyTabRestoreEnabledModule (upval), PerUserAppStorageModule (upval), v1 (upval), DelayedThread (upval), Config (upval), HasUserSelectedTabModule (upval), reportStabilizedTab (upval), Stabilized_tab (upval), SelectedTabName (upval)
		local SelectedTabName1 = Value.ChannelTabs.selectedTabName
		
		if SelectedTabName1 ~= nil and SelectedTabName1 ~= p2.ChannelTabs.selectedTabName then
			if IsStickyTabRestoreEnabledModule() then
				local GameId = game.GameId
				PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p3)
					-- upvalues: SelectedTabName1 (copy), GameId (copy)
					return if p3.tabName == SelectedTabName1 and p3.experienceId == GameId then nil else { tabName = SelectedTabName1, experienceId = GameId }
				end)
			end
			local v3 = v1
			
			if DelayedThread ~= nil then
				if v3 == nil then return end
				if SelectedTabName1 == nil then return end
				if (Config == nil or Config.status ~= "switched" and Config.status ~= "already_on_tab") and HasUserSelectedTabModule(v3) then
					reportStabilizedTab(Stabilized_tab)
					
					return
				end
				Stabilized_tab = SelectedTabName1
				
				if SelectedTabName and SelectedTabName1 == SelectedTabName then
					reportStabilizedTab(SelectedTabName1)
				end
			end
		end
	end)
	
	v2 = function()
		-- upvalues: ChangedConnection (copy)
		ChangedConnection:disconnect()
	end
	
	local SelectedTabName1 = p1:getState().ChannelTabs.selectedTabName
	
	if SelectedTabName1 ~= nil then
		if IsStickyTabRestoreEnabledModule() then
			local GameId = game.GameId
			PerUserAppStorageModule.updateEntry("ExpChatStickyTab", function(p2)
				-- upvalues: SelectedTabName1 (copy), GameId (copy)
				return if p2.tabName == SelectedTabName1 and p2.experienceId == GameId then nil else { tabName = SelectedTabName1, experienceId = GameId }
			end)
		end
		local v3 = v1
		
		if DelayedThread ~= nil then
			if v3 == nil then return end
			if SelectedTabName1 == nil then return end
			if (Config == nil or Config.status ~= "switched" and Config.status ~= "already_on_tab") and HasUserSelectedTabModule(v3) then
				reportStabilizedTab(Stabilized_tab)
				
				return
			end
			Stabilized_tab = SelectedTabName1
			
			if SelectedTabName and SelectedTabName1 == SelectedTabName then
				reportStabilizedTab(SelectedTabName1)
			end
		end
	end
end

local function watchForDeveloperDefault()
	-- upvalues: TextChatService (copy), Config (ref), v1 (ref), HasUserSelectedTabModule (copy), handleStickyTabEvent (copy), SelectedTabName (ref), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), DelayedThread (ref), Stabilized_tab (ref), reportStabilizedTab (copy), Connection (ref)
	local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
	
	if ChatInputBarConfiguration ~= nil then
		local function onTargetChanged()
			-- upvalues: ChatInputBarConfiguration (copy), Config (upval), v1 (upval), HasUserSelectedTabModule (upval), handleStickyTabEvent (upval), SelectedTabName (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), DelayedThread (upval), Stabilized_tab (upval), reportStabilizedTab (upval)
			local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
			
			if Config and (Config ~= nil and Config.status == "pending" and TargetTextChannel and TargetTextChannel.Name ~= "RBXGeneral" and TargetTextChannel.Name ~= Config.tabName) then
				local HasUserSelectedTabModule1 = v1 ~= nil and HasUserSelectedTabModule(v1)
				handleStickyTabEvent(Config.tabName, if HasUserSelectedTabModule1 then "other_tab_pinned" else "developer_default")
			end
			if TargetTextChannel and TargetTextChannel.Name ~= "RBXGeneral" and (v1 == nil or not HasUserSelectedTabModule(v1)) then
				SelectedTabName = TargetTextChannel.Name
				local v3 = v1
				local SelectedTabName1 = if v3 then if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) else v3:getState().ChannelTabs.selectedTabName else nil
				local v4 = v1
				
				if DelayedThread ~= nil then
					if v4 == nil then return end
					if SelectedTabName1 == nil then return end
					Stabilized_tab = SelectedTabName1
					
					if SelectedTabName and SelectedTabName1 == SelectedTabName then
						reportStabilizedTab(SelectedTabName1)
					end
				end
			end
		end
		
		onTargetChanged()
		Connection = ChatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(onTargetChanged)
		
		return
	end
end

function StickyTabObserverModule.start(p1, p2)
	-- upvalues: v1 (ref), ClockTime (ref), Config (ref), IsStickyTabRestoreEnabledModule (copy), readStickyTab (copy), StickyTabCountersModule (copy), DelayedThread (ref), ExpChatStickyTabTimeLimitSeconds (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), reportStabilizedTab (copy), HasUserSelectedTabModule (copy), Stabilized_tab (ref), SelectedTabName (ref), watchForDeveloperDefault (copy), watchForTabChanges (copy)
	p1:stop()
	v1 = p2
	ClockTime = os.clock()
	Config = if IsStickyTabRestoreEnabledModule() then readStickyTab() else nil
	
	if IsStickyTabRestoreEnabledModule() then
		StickyTabCountersModule.reportStarted(if Config then Config.tabName else nil, Config ~= nil and Config.status == "pending")
	end
	DelayedThread = task.delay(ExpChatStickyTabTimeLimitSeconds, function()
		-- upvalues: p2 (copy), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), v1 (upval), DelayedThread (upval), reportStabilizedTab (upval)
		local SelectedTabName = if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) else p2:getState().ChannelTabs.selectedTabName
		local v3 = v1
		
		if DelayedThread ~= nil then
			if v3 == nil then return end
			reportStabilizedTab(SelectedTabName)
		end
	end)
	local SelectedTabName1 = if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) else p2:getState().ChannelTabs.selectedTabName
	local v3 = v1
	
	if DelayedThread ~= nil and v3 ~= nil and SelectedTabName1 ~= nil then
		if HasUserSelectedTabModule(v3) then
			reportStabilizedTab(SelectedTabName1)
		else
			Stabilized_tab = SelectedTabName1
			
			if SelectedTabName and SelectedTabName1 == SelectedTabName then
				reportStabilizedTab(SelectedTabName1)
			end
		end
	end
	watchForDeveloperDefault()
	watchForTabChanges(p2)
	
	if Config and (Config ~= nil and Config.status == "pending") then
		p1:goToStickyTab(Config.tabName)
	end
end

function StickyTabObserverModule:goToStickyTab(ChannelName)
	-- upvalues: v1 (ref), Config (ref), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), ClockTime (ref), ExpChatStickyTabTimeLimitSeconds (copy), handleStickyTabEvent (copy), HasUserSelectedTabModule (copy)
	local v3 = v1
	
	if Config ~= nil and (Config.status == "pending" and (ChannelName == nil or Config.tabName == ChannelName)) and v3 ~= nil and (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName] then
		local IsExpChatStickyTabTimeLimitSecondsBelow = ExpChatStickyTabTimeLimitSeconds < os.clock() - ClockTime
		task.defer(function()
			-- upvalues: v1 (upval), v3 (copy), ChannelName (copy), Config (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), handleStickyTabEvent (upval), IsExpChatStickyTabTimeLimitSecondsBelow (copy), HasUserSelectedTabModule (upval)
			if v1 ~= v3 or (Config == nil or (Config.status ~= "pending" or ChannelName ~= nil and Config.tabName ~= ChannelName)) then return end
			if not (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName] then
				handleStickyTabEvent(ChannelName, "tab_removed")
				
				return
			end
			if IsExpChatStickyTabTimeLimitSecondsBelow then
				handleStickyTabEvent(ChannelName, "too_late")
				
				return
			end
			local IsChannelNameMatch = (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getSelectedTabName(false) else v3:getState().ChannelTabs.selectedTabName) == ChannelName
			
			if IsChannelNameMatch or not HasUserSelectedTabModule(v3) then
				handleStickyTabEvent(ChannelName, if IsChannelNameMatch then "already_on_tab" else "switched")
				
				return
			else
				handleStickyTabEvent(ChannelName, "other_tab_pinned")
			end
		end)
		
		return
	end
end

function StickyTabObserverModule:stop()
	-- upvalues: Config (ref), SelectedTabName (ref), Stabilized_tab (ref), DelayedThread (ref), v1 (ref), Connection (ref), v2 (ref)
	Config = nil
	SelectedTabName = nil
	Stabilized_tab = nil
	
	if DelayedThread then
		task.cancel(DelayedThread)
		DelayedThread = nil
	end
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