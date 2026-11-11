local CorePackages = game:GetService("CorePackages")
local TelemetryService = game:GetService("TelemetryService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Llama = require(CorePackages.Packages.LuaSocialLibrariesDeps).llama
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.LuaApp.Constants)
local UpdateActivePresenceGamesDetailsModule = require(Modules.LuaApp.Thunks.Games.UpdateActivePresenceGamesDetails)
local SetUserPresencesFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.SetUserPresences
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local ExperienceEventReceiverModule = require(Modules.LuaApp.ExperienceEventReceiver)
local EventNetworkingModule = require(script.Parent.EventNetworking)
local NetworkStatus = EventNetworkingModule.RoduxNetworking.Enum.NetworkStatus
local NetworkingPresence = EventNetworkingModule.NetworkingPresence
local JoinYourFriendsRefreshEventModule = require(Modules.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent)
local UseHandlePresenceEventFunction = require(CorePackages.Workspace.Packages.FriendsCommon).Hooks.useHandlePresenceEvent
local FireFriendsSortFeRtnMessageReceivedFunction = require(CorePackages.Workspace.Packages.FriendsCommon).Analytics.fireFriendsSortFeRtnMessageReceived
local GetFFlagLuaAppHomeJoinYourFriendsPresenceFixModule = require(Modules.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsPresenceFix)
local FFlagPresencePropagationDelayMonitoringEnabledV2Module = require(Modules.LuaApp.Flags.FFlagPresencePropagationDelayMonitoringEnabledV2)
local PresencePropagationDelayMetricName = game:DefineFastString("PresencePropagationDelayMetricName", "PresencePropagationDelay")
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagFriendSortedByPresenceSignalsImplementation = SharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local FFlagFriendsSignalMigrationTelemetry = SharedFlagsModule.FFlagFriendsSignalMigrationTelemetry
local GetResult = if FFlagFriendSortedByPresenceSignalsImplementation then DataHydrationModule.Friends.FriendsStore.get() else nil
game:DefineFastInt("PresenceEventReceiverErrorEventThrottleHundrethsPercent", 10000)
local config = {
	eventName = "PresenceEventReceiverErrorEvent",
	description = "Report errors in presence event receiver",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("PresenceEventReceiverErrorEventThrottleHundrethsPercent"),
	lastUpdated = { 25, 9, 5 }
}
local config1 = {
	eventName = "PresenceEventReceiverErrorEvent",
	description = "Counter to track errors in PresenceEventReceiver",
	lastUpdated = { 2025, 9, 4 },
	backends = { "RobloxTelemetryCounter" }
}
local config2 = { Offline = 0, Online = 1, InGame = 2, InStudio = 3 }

local function handleSignalFriendsPresenceEvent(p1, p2, p3)
	-- upvalues: GetResult (copy), FireFriendsSortFeRtnMessageReceivedFunction (copy)
	GetResult._updateFriendsPresences(p1, p2)
	FireFriendsSortFeRtnMessageReceivedFunction(p3, p1)
end

local PresenceEventReceiver = RoactModule.PureComponent:extend("PresenceEventReceiver")
PresenceEventReceiver.defaultProps = { networkImpl = EventNetworkingModule.networkImpl }

function PresenceEventReceiver.init(p1)
	-- upvalues: ExperienceEventReceiverModule (copy), Llama (copy), GetFFlagLuaAppHomeJoinYourFriendsPresenceFixModule (copy), ConstantsModule (copy), JoinYourFriendsRefreshEventModule (copy), FFlagPresencePropagationDelayMonitoringEnabledV2Module (copy), PresencePropagationDelayMetricName (copy)
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	local Analytics = p1.props.analytics
	local EventIngestService = p1.props.eventIngestService
	p1._experienceEventReceiver = ExperienceEventReceiverModule.new()
	p1.state = {
		inExperience = false,
		staleUsers = {},
		lastUpdatedTimesByUserId = {}
	}
	local Now = p1.props.dateTimeOverride and p1.props.dateTimeOverride.now or DateTime.now
	p1.tokens = {
		RobloxEventReceiver:observeEvent("PresenceBulkNotifications", function(List)
			-- upvalues: Llama (upval), p1 (copy), GetFFlagLuaAppHomeJoinYourFriendsPresenceFixModule (upval), ConstantsModule (upval), JoinYourFriendsRefreshEventModule (upval), FFlagPresencePropagationDelayMonitoringEnabledV2Module (upval), Now (copy), Analytics (copy), PresencePropagationDelayMetricName (upval), EventIngestService (copy)
			local MapResult = Llama.List.map(List, function(Player): string
				return (tostring(Player.UserId))
			end)
			
			if p1.state.inExperience then
				local t = {}
				
				for _, value in pairs(MapResult) do
					t[value] = true
				end
				p1:setState({
					staleUsers = Llama.Dictionary.join(p1.state.staleUsers, t)
				})
				
				return
			else
				local List1 = {}
				local SortScores = {}
				local List2 = {}
				local t1 = {}
				local RtnMessageId = nil
				
				for _, Player in pairs(List) do
					local _DateTime = if Player.SessionStarted == nil then nil else DateTime.fromIsoDate(Player.SessionStarted)
					local LastUpdatedTimesByUserIdEntry = p1.state.lastUpdatedTimesByUserId[tostring(Player.UserId)]
					
					if Player.PresenceReport and _DateTime and Player.SortScore and (LastUpdatedTimesByUserIdEntry == nil or LastUpdatedTimesByUserIdEntry < _DateTime.UnixTimestampMillis) then
						table.insert(List1, Player.PresenceReport)
						t1[tostring(Player.UserId)] = _DateTime.UnixTimestampMillis
						SortScores[tostring(Player.UserId)] = Player.SortScore
						
						if Player.RtnMessageId then
							RtnMessageId = Player.RtnMessageId
						end
					else
						table.insert(List2, (tostring(Player.UserId)))
					end
				end
				if #List2 > 0 then
					p1.props.updateUserPresences(List2):andThen(function(Result)
						-- upvalues: p1 (upval)
						p1.props.refetchOnlineFriends()
						p1.props.updateActivePresenceGamesDetails(p1.props.networkImpl, Result)
					end)
				else
					p1.props.setUserPresences(List1)
					p1.props.handlePresenceEvent(List1, SortScores, RtnMessageId)
					p1.props.updateActivePresenceGamesDetails(p1.props.networkImpl, List1)
				end
				p1:setState({
					lastUpdatedTimesByUserId = Llama.Dictionary.join(p1.state.lastUpdatedTimesByUserId, t1)
				})
				
				for _, Player1 in List do
					local Type = Player1.Type
					
					if GetFFlagLuaAppHomeJoinYourFriendsPresenceFixModule() then
						local Text = tostring(Player1.UserId)
						
						if Type == ConstantsModule.PresenceSignal.EventType and Text ~= p1.props.localUserId then
							JoinYourFriendsRefreshEventModule:Fire()
							break
						end
					elseif Type == ConstantsModule.PresenceSignal.EventType then
						JoinYourFriendsRefreshEventModule:Fire()
						break
					end
					if FFlagPresencePropagationDelayMonitoringEnabledV2Module and Player1.SessionStarted ~= nil then
						local _DateTime = DateTime.fromIsoDate(Player1.SessionStarted)
						
						if _DateTime ~= nil then
							local UnixTimestampMillis = Now().UnixTimestampMillis
							local UnixTimestampMillis1 = _DateTime.UnixTimestampMillis
							Analytics.Diag:reportStats(PresencePropagationDelayMetricName, UnixTimestampMillis - UnixTimestampMillis1)
							EventIngestService:sendEventDeferred("PresenceEventReceiver", "PresencePropagationDelay", {
								deviceCurrentTimestampEpochMs = UnixTimestampMillis,
								sessionChangedTimestampEpochMs = UnixTimestampMillis1
							})
						end
					end
				end
			end
		end),
		p1._experienceEventReceiver:onLaunched(function()
			-- upvalues: p1 (copy)
			p1:onExperienceJoin()
		end),
		p1._experienceEventReceiver:onLeft(function()
			-- upvalues: p1 (copy)
			p1:onExperienceLeave()
		end)
	}
end

function PresenceEventReceiver:render()
	return nil
end

function PresenceEventReceiver.willUnmount(p2)
	for _, token in pairs(p2.tokens) do
		token:disconnect()
	end
	p2._experienceEventReceiver:UnsubscribeFromAllMessages()
end

function PresenceEventReceiver.onExperienceJoin(p3)
	p3:setState({ inExperience = true })
end

local function v29(p3, StaleUsers)
	-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (copy), config2 (copy), Llama (copy)
	local Data = if FFlagFriendSortedByPresenceSignalsImplementation then p3 and p3.data or {} else p3 and p3.data and p3.data.onlineFriendsByUserId or {}
	local t = {}
	
	for i, staleUser in pairs(StaleUsers) do
		t[i] = {
			userPresenceType = 0,
			lastLocation = "Website",
			userId = tonumber(i)
		}
	end
	for _, staleUser in pairs(Data) do
		if staleUser.presence and not FFlagFriendSortedByPresenceSignalsImplementation then
			t[staleUser.id] = {
				userId = tonumber(staleUser.id),
				userPresenceType = config2[staleUser.presence.userPresenceType] or 0,
				lastLocation = staleUser.presence.lastLocation or "",
				gameId = staleUser.presence.gameId,
				placeId = tonumber(staleUser.presence.placeId),
				rootPlaceId = tonumber(staleUser.presence.rootPlaceId),
				universeId = tonumber(staleUser.presence.universeId),
				lastOnline = staleUser.presence.lastOnline
			}
		elseif FFlagFriendSortedByPresenceSignalsImplementation then
			local UserPresence = staleUser.userPresence
			local Text = tostring(staleUser.id)
			
			if UserPresence then
				t[Text] = {
					userId = staleUser.id,
					userPresenceType = config2[UserPresence.UserPresenceType] or 0,
					lastLocation = UserPresence.lastLocation or "",
					gameId = UserPresence.gameInstanceId,
					placeId = UserPresence.placeId,
					rootPlaceId = UserPresence.rootPlaceId,
					universeId = UserPresence.universeId,
					lastOnline = UserPresence.lastOnline
				}
			end
		end
	end
	return Llama.Dictionary.values(t)
end

function PresenceEventReceiver.onExperienceLeave(p4)
	-- upvalues: v29 (copy), TelemetryService (copy), config1 (copy), config (copy)
	p4:setState({ inExperience = false })
	p4.props.refetchOnlineFriends():andThen(function(Result)
		-- upvalues: v29 (upval), p4 (copy)
		local v1 = v29(Result, p4.state.staleUsers)
		p4.props.setUserPresences(v1)
		p4.props.updateActivePresenceGamesDetails(p4.props.networkImpl, v1)
		p4:setState({ staleUsers = {} })
	end):catch(function(Err)
		-- upvalues: TelemetryService (upval), config1 (upval), config (upval)
		warn("Failed to refetch online friends after leaving experience:", Err.error)
		TelemetryService:LogCounter(config1)
		TelemetryService:LogEvent(config, { errorMessage = Err.error })
	end)
end

local function _(p4, p5)
	-- upvalues: Llama (copy), NetworkingPresence (copy), NetworkStatus (copy)
	return Llama.List.filter(p5, function(p6): boolean
		-- upvalues: NetworkingPresence (upval), p4 (copy), NetworkStatus (upval)
		return NetworkingPresence.GetPresencesFromUserIds.getStatus(p4, p6) ~= NetworkStatus.Fetching
	end)
end

local _ = function(p4)
	-- upvalues: Llama (copy), NetworkingPresence (copy), NetworkStatus (copy)
	return function(p5)
		-- upvalues: p4 (copy), Llama (upval), NetworkingPresence (upval), NetworkStatus (upval)
		local State = p5:getState()
		
		return p5:dispatch(NetworkingPresence.GetPresencesFromUserIds.API((Llama.List.filter(p4, function(p6): boolean
			-- upvalues: NetworkingPresence (upval), State (copy), NetworkStatus (upval)
			return NetworkingPresence.GetPresencesFromUserIds.getStatus(State, p6) ~= NetworkStatus.Fetching
		end)))):andThen(function(Result)
			return Result.responseBody.userPresences or {}
		end)
	end
end

local v1 = RoactRoduxModule.connect(function(p4, _)
	-- upvalues: GetFFlagLuaAppHomeJoinYourFriendsPresenceFixModule (copy)
	return {
		localUserId = if GetFFlagLuaAppHomeJoinYourFriendsPresenceFixModule() then p4.LocalUserId else nil
	}
end, function(Callback)
	-- upvalues: Llama (copy), NetworkingPresence (copy), NetworkStatus (copy), SetUserPresencesFunction (copy), UpdateActivePresenceGamesDetailsModule (copy)
	return {
		updateUserPresences = function(p4)
			-- upvalues: Callback (copy), Llama (upval), NetworkingPresence (upval), NetworkStatus (upval), SetUserPresencesFunction (upval)
			return Callback(function(p5)
				-- upvalues: p4 (copy), Llama (upval), NetworkingPresence (upval), NetworkStatus (upval)
				local State = p5:getState()
				
				return p5:dispatch(NetworkingPresence.GetPresencesFromUserIds.API((Llama.List.filter(p4, function(p6): boolean
					-- upvalues: NetworkingPresence (upval), State (copy), NetworkStatus (upval)
					return NetworkingPresence.GetPresencesFromUserIds.getStatus(State, p6) ~= NetworkStatus.Fetching
				end)))):andThen(function(Result)
					return Result.responseBody.userPresences or {}
				end)
			end):andThen(function(Result)
				-- upvalues: Callback (upval), SetUserPresencesFunction (upval)
				Callback(SetUserPresencesFunction(Result))
				
				return Result
			end)
		end,
		setUserPresences = function(p4)
			-- upvalues: Callback (copy), SetUserPresencesFunction (upval)
			Callback(SetUserPresencesFunction(p4))
		end,
		updateActivePresenceGamesDetails = function(p4, p5)
			-- upvalues: Callback (copy), UpdateActivePresenceGamesDetailsModule (upval)
			Callback(UpdateActivePresenceGamesDetailsModule(p4, p5))
		end
	}
end)((RoactServices.connect({
	analytics = RoactAnalyticsModule,
	eventIngestService = AppEventIngestServiceModule
})(PresenceEventReceiver)))

return function(p4)
	-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (copy), UseHandlePresenceEventFunction (copy), RoactModule (copy), v1 (ref), Llama (copy), FFlagFriendsSignalMigrationTelemetry (copy), handleSignalFriendsPresenceEvent (copy), GetResult (copy)
	local UseHandlePresenceEventResult = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseHandlePresenceEventFunction()
	
	return RoactModule.createElement(v1, Llama.Dictionary.join(p4, {
		handlePresenceEvent = if FFlagFriendSortedByPresenceSignalsImplementation then if FFlagFriendsSignalMigrationTelemetry then handleSignalFriendsPresenceEvent else GetResult._updateFriendsPresences else UseHandlePresenceEventResult.handleNewEvent,
		refetchOnlineFriends = if FFlagFriendSortedByPresenceSignalsImplementation then GetResult._fetchOnlineFriendsAsync else UseHandlePresenceEventResult.refetchOnlineFriends
	}))
end