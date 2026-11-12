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
	-- upvalues: TextChatService (copy), ChannelName (ref), Connection (ref)
	local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
	
	if ChatInputBarConfiguration == nil then return end
	local function onTargetChanged()
		-- upvalues: ChatInputBarConfiguration (copy), ChannelName (upval)
		local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
		
		if TargetTextChannel and TargetTextChannel.Name ~= "RBXGeneral" and TargetTextChannel.Name ~= ChannelName then
			ChannelName = nil
		end
	end
	
	local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
	
	if TargetTextChannel and TargetTextChannel.Name ~= "RBXGeneral" and TargetTextChannel.Name ~= ChannelName then
		ChannelName = nil
	end
	Connection = ChatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(onTargetChanged)
end

function StickyTabObserverModule.start(p1, p2)
	-- upvalues: v1 (ref), ClockTime (ref), ChannelName (ref), PerUserAppStorageModule (copy), FriendsChatTabNameModule (copy), watchForTabChanges (copy), watchForDeveloperDefault (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
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
	watchForTabChanges(p2)
	watchForDeveloperDefault()
	local ChannelName1 = ChannelName
	
	if ChannelName1 ~= nil and (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else p2:getState().ChannelTabs.allChannelTabs)[ChannelName1] then
		p1:goToStickyTab(ChannelName1)
	end
end

function StickyTabObserverModule:goToStickyTab(ChannelName1)
	-- upvalues: ChannelName (ref), v1 (ref), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), ClockTime (ref), ExpChatStickyTabTimeLimitSeconds (copy), HasUserSelectedTabModule (copy), SelectTabByTypeModule (copy), FriendsChatTabNameModule (copy)
	if ChannelName1 ~= ChannelName then return end
	local v3 = v1
	
	if v3 == nil or not (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName1] then return end
	if ExpChatStickyTabTimeLimitSeconds < os.clock() - ClockTime or HasUserSelectedTabModule(v3) then
		ChannelName = nil
		
		return
	else
		task.defer(function()
			-- upvalues: v1 (upval), v3 (copy), ChannelName (upval), ChannelName1 (copy), HasUserSelectedTabModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), SelectTabByTypeModule (upval), FriendsChatTabNameModule (upval)
			if v1 ~= v3 or ChannelName ~= ChannelName1 then return end
			ChannelName = nil
			
			if not HasUserSelectedTabModule(v3) and (if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else v3:getState().ChannelTabs.allChannelTabs)[ChannelName1] then
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