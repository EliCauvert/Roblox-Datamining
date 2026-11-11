local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local PromiseUtilities = require(CorePackages.Workspace.Packages.AppCommonLib).Utils.PromiseUtilities
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local NextDataExpirationTimeRoduxModule = require(CorePackages.Workspace.Packages.NextDataExpirationTimeRodux)
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local ApiFetchAgeRecommendations = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.ApiFetchAgeRecommendations
local ApiFetchVoiceChatOptInStatus = require(CorePackages.Workspace.Packages.VoiceChat).OptInStatus.ApiFetchVoiceChatOptInStatus
local FetchGameVotes = require(CorePackages.Workspace.Packages.GameVotesRodux).GameVotes.FetchGameVotes
local ApiFetchExperienceCommunityLinkFunction = require(CorePackages.Workspace.Packages.CommunityLinks).Thunks.ApiFetchExperienceCommunityLink
local FetchGamePlayButtonData = require(CorePackages.Workspace.Packages.GamePlayButton).FetchGamePlayButtonData
local GameIconRoduxModule = require(CorePackages.Workspace.Packages.GameIconRodux)
local BigGameIconReducer = GameIconRoduxModule.BigGameIcons.BigGameIconReducer
local GameIconReducer = GameIconRoduxModule.GameIcons.GameIconReducer
local ApiFetchBigGameIconsFunction = GameIconRoduxModule.BigGameIcons.ApiFetchBigGameIcons
local ApiFetchGameIconsFunction = GameIconRoduxModule.GameIcons.ApiFetchGameIcons
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local DataStatus = require(CorePackages.Workspace.Packages.DataHydration).DataStatus
local ApiFetchGameMedia = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.ApiFetchGameMedia
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchGameIsFavoriteModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGameIsFavorite)
local ApiFetchGameFollowingStatusModule = require(Modules.LuaApp.Thunks.ApiFetchGameFollowingStatus)
local ApiFetchGameSocialLinksModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGameSocialLinks)
local ApiFetchGamePassesModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local ApiFetchGameDeveloperProductsModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts)
local ApiFetchGameSubscriptionProductsModule = require(Modules.LuaApp.Thunks.Subscription.ApiFetchGameSubscriptionProducts)
local ApiFetchGameBadgesModule = require(Modules.LuaApp.Thunks.ApiFetchGameBadges)
local RecommendedGamesModule = require(Modules.LuaApp.Thunks.Games.RecommendedGames)
local ApiFetchAssetTextFilterSettingsModule = require(Modules.LuaApp.Thunks.ApiFetchAssetTextFilterSettings)
local ApiFetchPrivateServersEnabledModule = require(Modules.LuaApp.Thunks.Games.ApiFetchPrivateServersEnabled)
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local ApiFetchExperienceDetailsPageCountersModule = require(Modules.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters)
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local EdpSduiUtilsModule = require(script.Parent.Parent.Parent.Components.ExperienceDetails.EdpSduiUtils)
local Number: number? = tonumber(settings():GetFVariable("LuaAppGameDetailsRefreshIntervalInSeconds"))
local GetFFlagLuaAppLaunchConnectorFixModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix)
local GetFFlagEnableBigGameIconInDetailsPageModule = require(Modules.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpFetchLatencyTracking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFetchLatencyTracking
local EdpFetchLatencyTrackingThrottlingHundredthsPercent = game:DefineFastInt("EdpFetchLatencyTrackingThrottlingHundredthsPercent", 1000)
local FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure
local FFlagLuaAppEdpBackendV2LogUniverseIdForEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogUniverseIdForEvents
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local v1 = nil
local v2 = nil

if FFlagLuaAppEdpFetchLatencyTracking then
	v1 = {
		eventName = "experienceDetailsFetchLatency",
		description = "\"Latency measurement for EDP first class promise fetch batch\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			LoggingProtocolModule.TelemetryBackends.Points,
			LoggingProtocolModule.TelemetryBackends.EventIngest
		},
		throttlingPercentage = EdpFetchLatencyTrackingThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 20 }
	}
	v2 = {
		eventName = "experienceDetailsFetchLatencyMissingStartTime",
		description = "\"Missing start time for EDP first class promise fetch batch\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			LoggingProtocolModule.TelemetryBackends.Points,
			LoggingProtocolModule.TelemetryBackends.EventIngest
		},
		throttlingPercentage = EdpFetchLatencyTrackingThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 20 }
	}
end
local function logMissingDataMetrics(State, p1)
	-- upvalues: ApiFetchExperienceDetailsPageCountersModule (copy)
	if State.GameDetailsV2[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("gameDetails")
	end
	if State.GameMedia[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("gameMedia")
	end
	if State.AgeRecommendations[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("ageRecommendations")
	end
	if State.GameVotes[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("gameVotes")
	end
	if State.GameFavorites[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("gameFavorites")
	end
	if State.GameFollowings[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("gameFollowings")
	end
	if State.AssetTextFilterSettings[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("assetTextFilterSettings")
	end
	if State.GamePrivateServersEnabled[p1] == nil then
		ApiFetchExperienceDetailsPageCountersModule.logFetchMissingData("gamePrivateServersEnabled")
	end
end

local function startFirstClassFetchPromises(p1, p2, UniverseId, p3, p4, p5, p6, p7)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure (copy), ApiFetchExperienceDetailsPageCountersModule (copy), logMissingDataMetrics (copy), EdpSduiUtilsModule (copy), Number (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchVoiceChatOptInStatus (copy), ApiFetchGameDetails (copy), ApiFetchGameMedia (copy), ApiFetchAgeRecommendations (copy), GetFFlagEnableBigGameIconInDetailsPageModule (copy), GetFFlagLuaAppLaunchConnectorFixModule (copy), UiMode (copy), BigGameIconReducer (copy), ApiFetchBigGameIconsFunction (copy), GameIconReducer (copy), ApiFetchGameIconsFunction (copy)
	local DispatchResults = {}
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5 or (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p6) then
		if not FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then
			ApiFetchExperienceDetailsPageCountersModule.logFetchRequest("initial")
			
			if p4 then
				ApiFetchExperienceDetailsPageCountersModule.logFetchRequest("forceRefresh")
			end
		end
		local NoGameDetailsVEntry: boolean? = nil
		
		if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5 then
			local State = p2:getState()
			NoGameDetailsVEntry = State.GameDetailsV2[UniverseId] == nil or (State.GameMedia[UniverseId] == nil or (State.AgeRecommendations[UniverseId] == nil or (State.GameVotes[UniverseId] == nil or (State.GameFavorites[UniverseId] == nil or (State.GameFollowings[UniverseId] == nil or (State.AssetTextFilterSettings[UniverseId] == nil or State.GamePrivateServersEnabled[UniverseId] == nil))))))
			
			if NoGameDetailsVEntry and not p4 then
				logMissingDataMetrics(State, UniverseId)
			end
		end
		local CheckEdpDataStalenessResult = nil
		
		if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p6 then
			CheckEdpDataStalenessResult = EdpSduiUtilsModule.checkEdpDataStaleness(p7, Number)
			
			if CheckEdpDataStalenessResult then
				ApiFetchExperienceDetailsPageCountersModule.logFetchRequest("sduiStale")
			else
				ApiFetchExperienceDetailsPageCountersModule.logFetchRequest("sduiFresh")
			end
		end
		if p4 or (FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5) and NoGameDetailsVEntry or (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p6) and CheckEdpDataStalenessResult then
			if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then
				if p4 then
					ApiFetchExperienceDetailsPageCountersModule.logFetchRequest("forceRefresh", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
				else
					ApiFetchExperienceDetailsPageCountersModule.logFetchRequest("initial", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
				end
			end
			table.insert(DispatchResults, p2:dispatch(ApiFetchExperienceDetailsPageModule.Fetch(p1, UniverseId, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p5 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p6 else nil)))
		end
		if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5 then
			if p4 or p2:getState().VoiceChatOptInStatus == nil then
				p2:dispatch(ApiFetchVoiceChatOptInStatus.Fetch(p1))
			end
			return DispatchResults
		end
	end
	if p4 or p2:getState().GameDetails[UniverseId] == nil then
		table.insert(DispatchResults, p2:dispatch(ApiFetchGameDetails.Fetch(p1, { UniverseId })))
	end
	if p4 or p2:getState().VoiceChatOptInStatus == nil then
		p2:dispatch(ApiFetchVoiceChatOptInStatus.Fetch(p1))
	end
	if p4 or p2:getState().GameMedia[UniverseId] == nil then
		table.insert(DispatchResults, p2:dispatch(ApiFetchGameMedia.Fetch(p1, UniverseId)))
	end
	if p4 or p2:getState().AgeRecommendations[UniverseId] == nil then
		table.insert(DispatchResults, p2:dispatch(ApiFetchAgeRecommendations.Fetch(p1, UniverseId)))
	end
	if GetFFlagEnableBigGameIconInDetailsPageModule() and GetFFlagLuaAppLaunchConnectorFixModule() and (p3 and p3.uiMode == UiMode.TenFoot and (p4 or p2:getState()[BigGameIconReducer.key][UniverseId] == nil)) then
		p2:dispatch(ApiFetchBigGameIconsFunction(p1, { UniverseId }))
	end
	if p2:getState()[GameIconReducer.key][UniverseId] == nil then
		p2:dispatch(ApiFetchGameIconsFunction(p1, { UniverseId }))
	end
	return DispatchResults
end

local function startSecondClassFetchPromises(BackendVersion, CurrentTime, UniverseId, p1, p2)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchPrivateServersEnabledModule (copy), ApiFetchGameSubscriptionProductsModule (copy), ApiFetchGameDeveloperProductsModule (copy), FetchGameVotes (copy), ApiFetchGameIsFavoriteModule (copy), ApiFetchGameFollowingStatusModule (copy), ApiFetchGameSocialLinksModule (copy), RecommendedGamesModule (copy), DiscoveryTypesModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), DataHydrationModule (copy), DataStatus (copy), ApiFetchGamePassesModule (copy), ApiFetchGameBadgesModule (copy), ApiFetchAssetTextFilterSettingsModule (copy), GetAppFeaturePoliciesFunction (copy), ApiFetchExperienceCommunityLinkFunction (copy)
	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2 then
		if p1 or CurrentTime:getState().GamePrivateServersEnabled[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchPrivateServersEnabledModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameSubscriptionProducts[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGameSubscriptionProductsModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameDeveloperProducts[UniverseId] == nil then
			local State = CurrentTime:getState()
			local GameDetailsVEntry = State.GameDetailsV2[UniverseId]
			
			if GameDetailsVEntry and GameDetailsVEntry.rootPlaceId and State.LocalUserId then
				CurrentTime:dispatch(ApiFetchGameDeveloperProductsModule(BackendVersion, UniverseId, GameDetailsVEntry.rootPlaceId, State.LocalUserId))
			end
		end
		return
	else
		if p1 or CurrentTime:getState().GameVotes[UniverseId] == nil then
			CurrentTime:dispatch(FetchGameVotes.Fetch(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameFavorites[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGameIsFavoriteModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameFollowings[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGameFollowingStatusModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameSocialLinks[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGameSocialLinksModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().RecommendedGameEntries[UniverseId] == nil then
			CurrentTime:dispatch(RecommendedGamesModule.Fetch(BackendVersion, UniverseId, {
				maxRows = DiscoveryTypesModule.Constants.MAX_RECOMMENDED_GAMES_FETCH_COUNT
			}))
		end
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
			local StatusResult = DataHydrationModule.Game.getGamePassStore(false).getPassesForUniverse(UniverseId).status(false)
			
			if p1 or StatusResult == DataStatus.NotReady or StatusResult == DataStatus.Failed then
				DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(UniverseId)
			end
		elseif p1 or CurrentTime:getState().GamePasses[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGamePassesModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameSubscriptionProducts[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGameSubscriptionProductsModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GameDeveloperProducts[UniverseId] == nil then
			local State = CurrentTime:getState()
			local GameDetail = State.GameDetails[UniverseId]
			
			if GameDetail and GameDetail.rootPlaceId and State.LocalUserId then
				CurrentTime:dispatch(ApiFetchGameDeveloperProductsModule(BackendVersion, UniverseId, GameDetail.rootPlaceId, State.LocalUserId))
			end
		end
		if p1 or CurrentTime:getState().GameBadges[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchGameBadgesModule(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().AssetTextFilterSettings[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchAssetTextFilterSettingsModule.Fetch(BackendVersion, UniverseId))
		end
		if p1 or CurrentTime:getState().GamePrivateServersEnabled[UniverseId] == nil then
			CurrentTime:dispatch(ApiFetchPrivateServersEnabledModule(BackendVersion, UniverseId))
		end
		if GetAppFeaturePoliciesFunction().getCommunityLinksEnabled() and (p1 or CurrentTime:getState().CommunityLinks.ExperienceCommunityLinks[UniverseId] == nil) then
			CurrentTime:dispatch(ApiFetchExperienceCommunityLinkFunction(BackendVersion, UniverseId))
		end
	end
end

return function(p1, UniverseId: string, p2, p3, p4, p5)
	-- upvalues: NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy), FetchGamePlayButtonData (copy), startFirstClassFetchPromises (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), RunService (copy), FFlagLuaAppEdpFetchLatencyTracking (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), PromiseUtilities (copy), Number (copy), SetNextDataExpirationTimeFunction (copy), startSecondClassFetchPromises (copy), v1 (ref), LoggingProtocolModule (copy), v2 (ref)
	if type(UniverseId) ~= "string" then
		error(string.format("FetchGameDetailsPageData thunk expects universeId to be a string. Got type: '%s', value: '%s'", type(UniverseId), (tostring(UniverseId))))
	end
	return function(p6)
		-- upvalues: NextDataExpirationTimeReducer (upval), ExpirationTimeNamespace (upval), UniverseId (copy), FetchGamePlayButtonData (upval), p1 (copy), startFirstClassFetchPromises (upval), p2 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p4 (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), p5 (copy), RunService (upval), FFlagLuaAppEdpFetchLatencyTracking (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), PromiseUtilities (upval), Number (upval), SetNextDataExpirationTimeFunction (upval), startSecondClassFetchPromises (upval), v1 (upval), LoggingProtocolModule (upval), v2 (upval)
		local Flag = false
		local CurrentTime = tick()
		local Floored = nil
		local PersonalizationEntry = p6:getState().Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameDetailPage]
		
		if PersonalizationEntry then
			Floored = PersonalizationEntry[UniverseId]
		end
		if Floored == nil or Floored < CurrentTime then
			Flag = true
		end
		p6:dispatch(FetchGamePlayButtonData.Fetch(p1, UniverseId))
		local StartFirstClassFetchPromisesResult = startFirstClassFetchPromises(p1, p6, UniverseId, p2, Flag, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p3 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then p4 else nil, if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p4 then p5 else nil)
		
		if #StartFirstClassFetchPromisesResult <= 0 then
			local BackendVersion = p1
			local CurrentTime1 = p6
			startSecondClassFetchPromises(BackendVersion, CurrentTime1, UniverseId, Flag, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p3 else nil)
			
			return
		end
		local Warn = if _G.__TESTEZ_RUNNING_TEST__ or RunService:IsStudio() then warn else nil
		local BackendVersion: number? = nil
		local CurrentTime1: number? = nil
		
		if FFlagLuaAppEdpFetchLatencyTracking then
			BackendVersion = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then 2 else 1
			CurrentTime1 = tick()
		end
		return PromiseUtilities.Batch(StartFirstClassFetchPromisesResult, Warn):andThen(function(Result)
			-- upvalues: PromiseUtilities (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (upval), p6 (copy), UniverseId (upval), CurrentTime (ref), Floored (ref), Number (upval), SetNextDataExpirationTimeFunction (upval), ExpirationTimeNamespace (upval), startSecondClassFetchPromises (upval), p1 (upval), Flag (ref)
			PromiseUtilities.CountResults(Result)
			
			if (if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then p6:getState().GameDetailsV2[UniverseId] else p6:getState().GameDetails[UniverseId]) ~= nil then
				CurrentTime = tick()
				Floored = math.floor(CurrentTime + Number)
				p6:dispatch(SetNextDataExpirationTimeFunction(UniverseId, Floored, ExpirationTimeNamespace.GameDetailPage))
			end
			startSecondClassFetchPromises(p1, p6, UniverseId, Flag, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p3 else nil)
		end):finally(function()
			-- upvalues: FFlagLuaAppEdpFetchLatencyTracking (upval), v1 (upval), CurrentTime1 (ref), LoggingProtocolModule (upval), BackendVersion (ref), UniverseId (upval), v2 (upval)
			if FFlagLuaAppEdpFetchLatencyTracking and v1 and CurrentTime1 then
				LoggingProtocolModule.default:logRobloxTelemetryEvent(v1, nil, {
					latencyMs = (tick() - CurrentTime1) * 1000,
					backendVersion = BackendVersion,
					universeId = UniverseId
				})
				
				return
			end
			if FFlagLuaAppEdpFetchLatencyTracking and v2 then
				LoggingProtocolModule.default:logRobloxTelemetryEvent(v2, nil, { universeId = UniverseId })
			end
		end)
	end
end