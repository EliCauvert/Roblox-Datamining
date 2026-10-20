local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules1 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local ParseAndAddGameInfosFunction = require(CorePackages.Workspace.Packages.GameInfosRodux).parseAndAddGameInfos
local GameInfoModel = require(CorePackages.Workspace.Packages.GameModels).GameInfoModel
local TopicContentsEntryModel = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsEntryModel
local GameDetailModel = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.GameDetailModel
local SetGameVotesFunction = require(CorePackages.Workspace.Packages.GameVotesRodux).GameVotes.SetGameVotes
local AddGameDetailsV2Function = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.AddGameDetailsV2
local SetGameDetailErrorFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.SetGameDetailError
local AgeRecommendationDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails
local SetAgeRecommendationFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.SetAgeRecommendation
local SetAgeRecommendationHeadersFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.SetAgeRecommendationHeaders
local GetEdpServerIxpVariablesStoreModule = require(Modules.LuaApp.Components.ExperienceDetails.getEdpServerIxpVariablesStore)
local GetEdpPerUniverseVisibilityVariablesStoreModule = require(Modules.LuaApp.Components.ExperienceDetails.getEdpPerUniverseVisibilityVariablesStore)
local EnumGameDetailErrorTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local PromiseModule = require(Modules.LuaApp.Promise)
local ApiFetchExperienceDetailsPageCountersModule = require(Modules.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters)
local GetExperienceDetailsPageFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).ExperienceDetails.GetExperienceDetailsPage
local EdpSduiUtilsModule = require(script.Parent.Parent.Parent.Components.ExperienceDetails.EdpSduiUtils)
local AgeCheckUpsellRenderedData = require(CorePackages.Workspace.Packages.GameDetail).AgeCheckUpsellRenderedData
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable
local FFlagLuaAppExtendPlayWithRewardPeekView = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExtendPlayWithRewardPeekView
local FFlagLuaAppDataHydrationUpdateItem = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local FFlagSduiFavoritesHydrationStructured = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiFavoritesHydrationStructured
local FFlagLuaAppEdpBackendV2AddUserVote = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2AddUserVote
local LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2 = game:DefineFastFlag("LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2", false)
local FFlagLuaAppDataHydrationConnectionsPlayedStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDataHydrationConnectionsPlayedStore
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight
local SetGameFavoriteModule = require(Modules.LuaApp.Actions.Games.SetGameFavorite)
local SetRecommendedGameEntriesModule = require(Modules.LuaApp.Actions.Games.SetRecommendedGameEntries)
local SetExperienceNotificationsEnabledCountModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount)
local SetExperienceNotificationsEnabledLimitModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit)
local SetGamePassesModule = require(Modules.LuaApp.Actions.Games.SetGamePasses)
local SetGameFollowingStatusModule = require(Modules.LuaApp.Actions.SetGameFollowingStatus)
local SetGameBadgesModule = require(Modules.LuaApp.Actions.SetGameBadges)
local SetGameSocialLinksModule = require(Modules.LuaApp.Actions.Games.SetGameSocialLinks)
local SetExperienceCommunityLinkFunction = require(CorePackages.Workspace.Packages.CommunityLinks).Actions.SetExperienceCommunityLink
local UpdateGameMediaFunction = Modules1.LuaApp.Actions.Games.UpdateGameMedia
local SetAssetTextFilterSettingsModule = require(Modules.LuaApp.Actions.SetAssetTextFilterSettings)
local GameMediaEntry = Modules1.LuaApp.Models.GamesApi.GameMediaEntry
local CommunityInfo = require(CorePackages.Workspace.Packages.CommunityLinks).Models.CommunityInfo
local CommunityVisibility = require(CorePackages.Workspace.Packages.CommunityLinks).Enums.CommunityVisibility
local ApiFetchPassesThumbnailsModule = require(Modules.LuaApp.Thunks.ApiFetchPassesThumbnails)
local ProcessGameSocialLinksModule = require(Modules.LuaApp.Thunks.Games.ProcessGameSocialLinks)
local FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure
local FFlagLuaAppEdpBackendV2LogUniverseIdForEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogUniverseIdForEvents

local function _(p1, p2, p3, p4)
	-- upvalues: ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local Success, Result = pcall(p1, p2)
	
	if Success then
		return Result
	end
	if p4 then
		ApiFetchExperienceDetailsPageCountersModule.logParseFailure(p4, if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p3 else nil)
	end
	return nil
end

local function parseGameDetails(ExperienceDetails, UniverseId)
	-- upvalues: GameDetailModel (copy), ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local GameDetails = ExperienceDetails.gameDetails
	
	if GameDetails then
		local Success, Result = pcall(GameDetailModel.fromJsonData, GameDetails)
		local v1 = nil
		
		if Success then
			v1 = Result
		else
			ApiFetchExperienceDetailsPageCountersModule.logParseFailure("gameDetails", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
			v1 = nil
		end
		if v1 then
			return { [UniverseId] = v1 }
		end
	else
		ApiFetchExperienceDetailsPageCountersModule.logMissingData("gameDetails", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
	end
	return nil
end

local function parseGameMedia(ExperienceDetails, UniverseId)
	-- upvalues: GameMediaEntry (copy), ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local MediaGallery = ExperienceDetails.mediaGallery
	
	if not MediaGallery or type(MediaGallery) ~= "table" then
		ApiFetchExperienceDetailsPageCountersModule.logMissingData("mediaGallery", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
		
		return nil
	end
	local List = {}
	
	for _, value in MediaGallery do
		if type(value) ~= "table" then
			ApiFetchExperienceDetailsPageCountersModule.logInvalidData("mediaEntry", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
			continue
		end
		local Success, Result = pcall(GameMediaEntry.fromJsonData, {
			approved = true,
			id = value.id,
			assetTypeId = value.assetTypeId,
			imageId = value.imageId,
			videoId = value.videoId,
			videoHash = value.videoHash,
			videoTitle = value.videoTitle
		})
		local v1 = nil
		
		if Success then
			v1 = Result
		else
			ApiFetchExperienceDetailsPageCountersModule.logParseFailure("gameMedia", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
			v1 = nil
		end
		if v1 then
			table.insert(List, v1)
		end
	end
	return List
end

local function parseRecommendedGames(ExperienceDetails, p1, p2, UniverseId)
	-- upvalues: TopicContentsEntryModel (copy), ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy), CryoModule (copy), GameInfoModel (copy), ParseAndAddGameInfosFunction (copy)
	local RelatedGames = ExperienceDetails.relatedGames
	
	if RelatedGames and type(RelatedGames) == "table" then
		local JoinResults = {}
		ParseAndAddGameInfosFunction(p1, p2, RelatedGames, function(p3)
			-- upvalues: GameInfoModel (upval), ApiFetchExperienceDetailsPageCountersModule (upval), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (upval), UniverseId (copy)
			local Success, Result = pcall(function()
				-- upvalues: GameInfoModel (upval), p3 (copy)
				return GameInfoModel.fromGamesApi(p3)
			end)
			
			if Success then
				return Result
			else
				ApiFetchExperienceDetailsPageCountersModule.logParseFailure("recommendedGame", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
				
				return nil
			end
		end, function(p3, p4)
			-- upvalues: TopicContentsEntryModel (upval), UniverseId (copy), ApiFetchExperienceDetailsPageCountersModule (upval), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (upval), CryoModule (upval), JoinResults (copy)
			if type(p3) == "table" then
				local Success, Result = pcall(TopicContentsEntryModel.fromGamesApiData, p3)
				local v2 = nil
				
				if Success then
					v2 = Result
				else
					ApiFetchExperienceDetailsPageCountersModule.logParseFailure("recommendedGame", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
					v2 = nil
				end
				if v2 then
					v2:match(function(p5)
						-- upvalues: CryoModule (upval), p4 (copy), JoinResults (upval)
						table.insert(JoinResults, (CryoModule.Dictionary.join(p4, p5)))
					end):matchError(function(_)
						-- upvalues: ApiFetchExperienceDetailsPageCountersModule (upval), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (upval), UniverseId (upval)
						ApiFetchExperienceDetailsPageCountersModule.logParseFailure("recommendedGame", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
					end)
					
					return
				end
			else
				ApiFetchExperienceDetailsPageCountersModule.logInvalidData("relatedGameData", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
			end
		end)
		
		return JoinResults
	else
		ApiFetchExperienceDetailsPageCountersModule.logMissingData("relatedGames", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
		
		return nil
	end
end

local function parseGamePasses(ExperienceDetails, UniverseId)
	-- upvalues: ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local GamePassProducts = ExperienceDetails.gamePassProducts
	
	if not GamePassProducts or type(GamePassProducts) ~= "table" then
		return nil
	end
	local PassIds = {}
	
	if #GamePassProducts > 0 then
		for _, gamePassProduct in GamePassProducts do
			if type(gamePassProduct) == "table" and gamePassProduct.id then
				table.insert(PassIds, gamePassProduct.id)
			else
				ApiFetchExperienceDetailsPageCountersModule.logInvalidData("gamePass", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
			end
		end
	end
	return { passes = GamePassProducts, passIds = PassIds }
end

local function parseFollowingStatus(ExperienceDetails, UniverseId)
	-- upvalues: ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local FollowingStatus = ExperienceDetails.followingStatus
	
	if FollowingStatus and type(FollowingStatus) == "table" then
		return {
			canFollow = FollowingStatus.canFollow,
			isFollowing = FollowingStatus.isFollowing,
			count = FollowingStatus.followingCountByType,
			limit = FollowingStatus.followingLimitByType
		}
	else
		ApiFetchExperienceDetailsPageCountersModule.logMissingData("followingStatus", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
		
		return nil
	end
end

local _ = function(p1, p2)
	-- upvalues: CommunityInfo (copy), ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local CommunityLinks = p1.communityLinks
	
	if not CommunityLinks then
		return nil
	end
	local Success, Result = pcall(CommunityInfo.fromJsonData, CommunityLinks)
	
	if Success then
		return Result
	else
		ApiFetchExperienceDetailsPageCountersModule.logParseFailure("communityLinks", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p2 else nil)
		
		return nil
	end
end

local function parseAgeRecommendations(ExperienceDetails, UniverseId)
	-- upvalues: AgeRecommendationDetails (copy), ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	local AgeRecommendations = ExperienceDetails.ageRecommendations
	
	if AgeRecommendations and type(AgeRecommendations) == "table" then
		local AgeRecommendationsDetails = AgeRecommendations.ageRecommendationsDetails
		
		if AgeRecommendationsDetails then
			local Success, Result = pcall(AgeRecommendationDetails.fromJsonData, AgeRecommendationsDetails)
			local v2 = nil
			
			if Success then
				v2 = Result
			else
				ApiFetchExperienceDetailsPageCountersModule.logParseFailure("ageRecommendations", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
				v2 = nil
			end
			if not v2 then
				return nil
			end
			local UnwrapResult, UnwrapResult2 = v2:unwrap()
			
			if UnwrapResult == false then
				ApiFetchExperienceDetailsPageCountersModule.logParseFailure("ageRecommendations", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
				
				return nil
			else
				return {
					ageRecommendationDetailsData = UnwrapResult2,
					headerDisplayName = AgeRecommendations.headerDisplayName,
					headerDisplayNameShort = AgeRecommendations.headerDisplayNameShort
				}
			end
		end
	else
		ApiFetchExperienceDetailsPageCountersModule.logMissingData("ageRecommendations", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
	end
	return nil
end

local function extractSduiFeedItems(ResponseBody, _)
	-- upvalues: FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight (copy)
	if ResponseBody and ResponseBody.sdui and ResponseBody.sdui.feed and ResponseBody.sdui.feed.props and ResponseBody.sdui.feed.props.feedItems then
		local t = {}
		local Flag = not FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight and nil
		for _, feedItem in ResponseBody.sdui.feed.props.feedItems do
			if type(feedItem) == "table" and feedItem.feedItemKey then
				t[feedItem.feedItemKey] = {
					topicId = feedItem.topicId,
					sortIndex = feedItem.sortIndex,
					componentConfig = feedItem.componentConfig,
					analyticsData = feedItem.analyticsData
				}
				
				if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight and feedItem.topicId == "age-check-upsell" then
					Flag = true
				end
			end
		end
		if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight then
			return t, Flag
		else
			return t, nil
		end
	else
		local v2 = nil
		
		if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight then
			return v2, false
		else
			return v2, nil
		end
	end
end

local _ = function(p1)
	return if p1 and p1.sdui and p1.sdui.templates then p1.sdui.templates else nil
end

local function updateDataHydrationStores(UniverseId, ResponseBody)
	-- upvalues: DataHydrationModule (copy), FFlagLuaAppEdpBackendV2AddUserVote (copy), parseGameDetails (copy), FFlagLuaAppDataHydrationConnectionsPlayedStore (copy), FFlagSduiFavoritesHydrationStructured (copy), Players (copy), parseFollowingStatus (copy)
	local ExperienceDetails = if ResponseBody and ResponseBody.sdui and ResponseBody.sdui.feed and ResponseBody.sdui.feed.props and ResponseBody.sdui.feed.props.experienceDetails then ResponseBody.sdui.feed.props.experienceDetails else nil
	
	if not ExperienceDetails then return end
	local VotesStore = DataHydrationModule.Game.getVotesStore(false)
	VotesStore.updateVoteItem(UniverseId, ExperienceDetails.totalDownVotes or 0, ExperienceDetails.totalUpVotes or 0)
	
	if FFlagLuaAppEdpBackendV2AddUserVote then
		local UserVote = ExperienceDetails.userVote
		
		if UserVote ~= nil then
			VotesStore.updateUserVoteItem(UniverseId, UserVote)
		end
	end
	local GameInfoStore = DataHydrationModule.Game.getGameInfoStore(false)
	local ParseGameDetailsResult = parseGameDetails(ExperienceDetails, UniverseId)
	local ParseGameDetailsResultEntry = ParseGameDetailsResult and ParseGameDetailsResult[UniverseId]
	
	if ParseGameDetailsResultEntry then
		GameInfoStore.updateGameInfo(UniverseId, {
			rootPlaceId = ParseGameDetailsResultEntry.rootPlaceId,
			name = ParseGameDetailsResultEntry.name,
			description = ParseGameDetailsResultEntry.description,
			creator = ParseGameDetailsResultEntry.creator,
			universeId = UniverseId,
			playerCount = ParseGameDetailsResultEntry.playing
		})
	end
	local IsFavorited = ExperienceDetails.isFavorited
	local FavoritesStore = DataHydrationModule.Game.getFavoritesStore(false)
	
	if FFlagLuaAppDataHydrationConnectionsPlayedStore then
		local ConnectionsPlayed = ExperienceDetails.connectionsPlayed
		local ConnectionsPlayedStore = DataHydrationModule.Game.getConnectionsPlayedStore(false)
		
		if ConnectionsPlayed then
			ConnectionsPlayedStore.updateItems({ [UniverseId] = ConnectionsPlayed })
		end
	end
	if FFlagSduiFavoritesHydrationStructured then
		FavoritesStore.updateItem(UniverseId, { isFavorited = IsFavorited })
	else
		FavoritesStore.updateItem(UniverseId, IsFavorited)
	end
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId
	
	if UserId and UserId > 0 then
		local ParseFollowingStatusResult = parseFollowingStatus(ExperienceDetails, UniverseId)
		
		if ParseFollowingStatusResult then
			local FollowingsStore = DataHydrationModule.Game.getFollowingsStore(false)
			FollowingsStore.updateItem(UniverseId, {
				userId = tostring(UserId),
				universeId = UniverseId,
				isFollowing = ParseFollowingStatusResult.isFollowing,
				canFollow = ParseFollowingStatusResult.canFollow
			})
			FollowingsStore.updateUserFollowingLimits({
				followingCountByType = ParseFollowingStatusResult.count,
				followingLimitByType = ParseFollowingStatusResult.limit
			})
		end
	end
end

local function parseEdpServerIxpVariables(ResponseBody, _)
	-- upvalues: ApiFetchExperienceDetailsPageCountersModule (copy)
	if not ResponseBody or not ResponseBody.sdui or not ResponseBody.sdui.feed or not ResponseBody.sdui.feed.props or not ResponseBody.sdui.feed.props.visibilityVariables then
		return nil
	end
	local VisibilityVariables = ResponseBody.sdui.feed.props.visibilityVariables
	local config = {
		hideNotifyButton = VisibilityVariables.hideNotifyButton,
		hideGameRatings = VisibilityVariables.hideGameRatings,
		hideFavoritesInContextMenu = VisibilityVariables.hideFavoritesInContextMenu,
		hideNotifyInContextMenu = VisibilityVariables.hideNotifyInContextMenu,
		showVisitsInInfoList = VisibilityVariables.showVisitsInInfoList,
		showAgeMaturityInHeader = VisibilityVariables.showAgeMaturityInHeader,
		showContentDescriptorsInInfoList = VisibilityVariables.showContentDescriptorsInInfoList,
		hideStatsCarousel = VisibilityVariables.hideStatsCarousel
	}
	local List = {}
	
	for i, value in config do
		if value ~= nil then
			table.insert(List, tostring(i) .. ":" .. tostring(value))
		end
	end
	ApiFetchExperienceDetailsPageCountersModule.logVisibilityVariables((table.concat(List, ",")))
	
	return config
end

local function parseEdpServerVariables(ResponseBody, _)
	-- upvalues: ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppExtendPlayWithRewardPeekView (copy)
	if not ResponseBody or not ResponseBody.sdui or not ResponseBody.sdui.feed or not ResponseBody.sdui.feed.props or not ResponseBody.sdui.feed.props.visibilityVariables then
		return nil, nil
	end
	local VisibilityVariables = ResponseBody.sdui.feed.props.visibilityVariables
	local config = {
		hideNotifyButton = VisibilityVariables.hideNotifyButton,
		hideGameRatings = VisibilityVariables.hideGameRatings,
		hideFavoritesInContextMenu = VisibilityVariables.hideFavoritesInContextMenu,
		hideNotifyInContextMenu = VisibilityVariables.hideNotifyInContextMenu,
		showVisitsInInfoList = VisibilityVariables.showVisitsInInfoList,
		showAgeMaturityInHeader = VisibilityVariables.showAgeMaturityInHeader,
		showContentDescriptorsInInfoList = VisibilityVariables.showContentDescriptorsInInfoList,
		hideStatsCarousel = VisibilityVariables.hideStatsCarousel
	}
	local List = {}
	
	for i, value in config do
		if value ~= nil then
			table.insert(List, tostring(i) .. ":" .. tostring(value))
		end
	end
	ApiFetchExperienceDetailsPageCountersModule.logVisibilityVariables((table.concat(List, ",")))
	
	return config, {
		hidePlayWithReward = VisibilityVariables.hidePlayWithReward,
		extendPlayWithRewardPeekViewOffset = if FFlagLuaAppExtendPlayWithRewardPeekView then VisibilityVariables.extendPlayWithRewardPeekViewOffset else nil
	}
end

return {
	KeyMapper = function(Text): string
		return "luaapp.experience.details." .. Text
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.experience.details." .. Text)
	end,
	Fetch = function(p1, UniverseId: string, p2, p3)
		-- upvalues: PerformFetch (copy), GetExperienceDetailsPageFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), extractSduiFeedItems (copy), FFlagLuaAppDataHydrationUpdateItem (copy), updateDataHydrationStores (copy), EdpSduiUtilsModule (copy), ServerDrivenUiModule (copy), FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight (copy), AgeCheckUpsellRenderedData (copy), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (copy), parseEdpServerVariables (copy), GetEdpServerIxpVariablesStoreModule (copy), GetEdpPerUniverseVisibilityVariablesStoreModule (copy), parseEdpServerIxpVariables (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageCountersModule (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy), PromiseModule (copy), parseGameDetails (copy), AddGameDetailsV2Function (copy), parseGameMedia (copy), UpdateGameMediaFunction (copy), SetGameFavoriteModule (copy), SetGameVotesFunction (copy), SetAssetTextFilterSettingsModule (copy), parseRecommendedGames (copy), SetRecommendedGameEntriesModule (copy), parseGamePasses (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), DataHydrationModule (copy), SetGamePassesModule (copy), ApiFetchPassesThumbnailsModule (copy), parseFollowingStatus (copy), SetGameFollowingStatusModule (copy), SetExperienceNotificationsEnabledCountModule (copy), SetExperienceNotificationsEnabledLimitModule (copy), SetGameBadgesModule (copy), ProcessGameSocialLinksModule (copy), SetGameSocialLinksModule (copy), GetAppFeaturePoliciesFunction (copy), CommunityInfo (copy), CommunityVisibility (copy), SetExperienceCommunityLinkFunction (copy), parseAgeRecommendations (copy), SetAgeRecommendationFunction (copy), SetAgeRecommendationHeadersFunction (copy), FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure (copy), SetGameDetailErrorFunction (copy), EnumGameDetailErrorTypes (copy), LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2 (copy)
		if type(UniverseId) ~= "string" then
			error("ApiFetchExperienceDetailsPage thunk expects universeId to be a string")
		end
		return PerformFetch.Single("luaapp.experience.details." .. UniverseId, function(p4)
			-- upvalues: GetExperienceDetailsPageFunction (upval), p1 (copy), UniverseId (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p3 (copy), extractSduiFeedItems (upval), FFlagLuaAppDataHydrationUpdateItem (upval), updateDataHydrationStores (upval), EdpSduiUtilsModule (upval), ServerDrivenUiModule (upval), FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight (upval), AgeCheckUpsellRenderedData (upval), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (upval), parseEdpServerVariables (upval), GetEdpServerIxpVariablesStoreModule (upval), GetEdpPerUniverseVisibilityVariablesStoreModule (upval), parseEdpServerIxpVariables (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (copy), ApiFetchExperienceDetailsPageCountersModule (upval), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (upval), PromiseModule (upval), parseGameDetails (upval), AddGameDetailsV2Function (upval), parseGameMedia (upval), UpdateGameMediaFunction (upval), SetGameFavoriteModule (upval), SetGameVotesFunction (upval), SetAssetTextFilterSettingsModule (upval), parseRecommendedGames (upval), SetRecommendedGameEntriesModule (upval), parseGamePasses (upval), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), DataHydrationModule (upval), SetGamePassesModule (upval), ApiFetchPassesThumbnailsModule (upval), parseFollowingStatus (upval), SetGameFollowingStatusModule (upval), SetExperienceNotificationsEnabledCountModule (upval), SetExperienceNotificationsEnabledLimitModule (upval), SetGameBadgesModule (upval), ProcessGameSocialLinksModule (upval), SetGameSocialLinksModule (upval), GetAppFeaturePoliciesFunction (upval), CommunityInfo (upval), CommunityVisibility (upval), SetExperienceCommunityLinkFunction (upval), parseAgeRecommendations (upval), SetAgeRecommendationFunction (upval), SetAgeRecommendationHeadersFunction (upval), FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure (upval), SetGameDetailErrorFunction (upval), EnumGameDetailErrorTypes (upval), LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2 (upval)
			return GetExperienceDetailsPageFunction(p1, UniverseId):andThen(function(Result)
				-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), p3 (upval), extractSduiFeedItems (upval), UniverseId (upval), FFlagLuaAppDataHydrationUpdateItem (upval), updateDataHydrationStores (upval), EdpSduiUtilsModule (upval), ServerDrivenUiModule (upval), FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight (upval), AgeCheckUpsellRenderedData (upval), FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable (upval), parseEdpServerVariables (upval), GetEdpServerIxpVariablesStoreModule (upval), GetEdpPerUniverseVisibilityVariablesStoreModule (upval), parseEdpServerIxpVariables (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p2 (upval), ApiFetchExperienceDetailsPageCountersModule (upval), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (upval), PromiseModule (upval), parseGameDetails (upval), p4 (copy), AddGameDetailsV2Function (upval), parseGameMedia (upval), UpdateGameMediaFunction (upval), SetGameFavoriteModule (upval), SetGameVotesFunction (upval), SetAssetTextFilterSettingsModule (upval), parseRecommendedGames (upval), p1 (upval), SetRecommendedGameEntriesModule (upval), parseGamePasses (upval), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), DataHydrationModule (upval), SetGamePassesModule (upval), ApiFetchPassesThumbnailsModule (upval), parseFollowingStatus (upval), SetGameFollowingStatusModule (upval), SetExperienceNotificationsEnabledCountModule (upval), SetExperienceNotificationsEnabledLimitModule (upval), SetGameBadgesModule (upval), ProcessGameSocialLinksModule (upval), SetGameSocialLinksModule (upval), GetAppFeaturePoliciesFunction (upval), CommunityInfo (upval), CommunityVisibility (upval), SetExperienceCommunityLinkFunction (upval), parseAgeRecommendations (upval), SetAgeRecommendationFunction (upval), SetAgeRecommendationHeadersFunction (upval), FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure (upval)
				local ResponseBody = Result.responseBody
				
				if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p3 then
					local ExtractSduiFeedItemsResult, ExtractSduiFeedItemsResult2 = extractSduiFeedItems(ResponseBody, UniverseId)
					local Templates = if ResponseBody and ResponseBody.sdui and ResponseBody.sdui.templates then ResponseBody.sdui.templates else nil
					
					if ExtractSduiFeedItemsResult and next(ExtractSduiFeedItemsResult) then
						if FFlagLuaAppDataHydrationUpdateItem then
							updateDataHydrationStores(UniverseId, ResponseBody)
						end
						ServerDrivenUiModule.getSduiFeedStore((EdpSduiUtilsModule.getUnprocessedEdpStoreKey((tostring(UniverseId))))).updateData({
							itemCollections = ExtractSduiFeedItemsResult,
							templates = Templates,
							dataUpdatedTimestamp = os.time() * 1000
						})
					end
					if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight then
						AgeCheckUpsellRenderedData.setAgeCheckUpsellRendered(tostring(UniverseId), ExtractSduiFeedItemsResult2)
					end
					if FFlagLuaAppEdpUseHidePlayWithRewardVisibilityVariable then
						local ParseEdpServerVariablesResult, ParseEdpServerVariablesResult2 = parseEdpServerVariables(ResponseBody, UniverseId)
						
						if ParseEdpServerVariablesResult then
							GetEdpServerIxpVariablesStoreModule().setEdpServerIxpVariables(ParseEdpServerVariablesResult)
						end
						if ParseEdpServerVariablesResult2 then
							GetEdpPerUniverseVisibilityVariablesStoreModule(UniverseId).setVisibilityVariables(ParseEdpServerVariablesResult2)
						end
					else
						local ParseEdpServerIxpVariablesResult = parseEdpServerIxpVariables(ResponseBody, UniverseId)
						
						if ParseEdpServerIxpVariablesResult then
							GetEdpServerIxpVariablesStoreModule().setEdpServerIxpVariables(ParseEdpServerIxpVariablesResult)
						end
					end
				end
				if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2 then
					local ExperienceDetails = if ResponseBody and ResponseBody.sdui and ResponseBody.sdui.feed and ResponseBody.sdui.feed.props and ResponseBody.sdui.feed.props.experienceDetails then ResponseBody.sdui.feed.props.experienceDetails else nil
					
					if ExperienceDetails == nil then
						ApiFetchExperienceDetailsPageCountersModule.logMissingData("experienceDetailsProps", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
						
						return PromiseModule.reject({ HttpError = Enum.HttpError.InternalServerError })
					end
					local ParseGameDetailsResult = parseGameDetails(ExperienceDetails, UniverseId)
					
					if ParseGameDetailsResult then
						p4:dispatch(AddGameDetailsV2Function(ParseGameDetailsResult))
					end
					local ParseGameMediaResult = parseGameMedia(ExperienceDetails, UniverseId)
					
					if ParseGameMediaResult then
						p4:dispatch(UpdateGameMediaFunction(UniverseId, ParseGameMediaResult))
					end
					local IsFavorited = ExperienceDetails.isFavorited
					
					if IsFavorited ~= nil then
						p4:dispatch(SetGameFavoriteModule(UniverseId, IsFavorited))
					end
					local TotalUpVotes: number = ExperienceDetails.totalUpVotes
					local TotalDownVotes: number = ExperienceDetails.totalDownVotes
					
					if TotalUpVotes ~= nil and TotalDownVotes ~= nil then
						p4:dispatch(SetGameVotesFunction(UniverseId, if TotalUpVotes < 0 then 0 else TotalUpVotes, if TotalDownVotes < 0 then 0 else TotalDownVotes))
					end
					local TextFilterProfanity = ExperienceDetails.textFilterProfanity
					
					if TextFilterProfanity == nil then
						p4:dispatch(SetAssetTextFilterSettingsModule(UniverseId, false))
					else
						p4:dispatch(SetAssetTextFilterSettingsModule(UniverseId, TextFilterProfanity))
					end
					local ParseRecommendedGamesResult = parseRecommendedGames(ExperienceDetails, p1, p4, UniverseId)
					
					if ParseRecommendedGamesResult then
						p4:dispatch(SetRecommendedGameEntriesModule(UniverseId, ParseRecommendedGamesResult))
					end
					local ParseGamePassesResult = parseGamePasses(ExperienceDetails, UniverseId)
					
					if ParseGamePassesResult and ParseGamePassesResult.passes then
						if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
							if ParseGamePassesResult.passes then
								local t = {}
								local List = {}
								
								for _, pass in ParseGamePassesResult.passes do
									if pass.id then
										local Text = tostring(pass.id)
										t[Text] = pass
										table.insert(List, Text)
									end
								end
								local GamePassStore = DataHydrationModule.Game.getGamePassStore(false)
								GamePassStore.updateGamePassInfos(t)
								GamePassStore.updateUniversePasses({ [UniverseId] = List })
							end
						else
							p4:dispatch(SetGamePassesModule(UniverseId, ParseGamePassesResult.passes))
							
							if ParseGamePassesResult and ParseGamePassesResult.passIds then
								p4:dispatch(ApiFetchPassesThumbnailsModule(p1, ParseGamePassesResult.passIds))
							end
						end
					end
					local ParseFollowingStatusResult = parseFollowingStatus(ExperienceDetails, UniverseId)
					
					if ParseFollowingStatusResult and ParseFollowingStatusResult.canFollow ~= nil and ParseFollowingStatusResult.isFollowing ~= nil then
						p4:dispatch(SetGameFollowingStatusModule(UniverseId, ParseFollowingStatusResult.canFollow, ParseFollowingStatusResult.isFollowing))
					end
					if ParseFollowingStatusResult and ParseFollowingStatusResult.count ~= nil then
						p4:dispatch(SetExperienceNotificationsEnabledCountModule(ParseFollowingStatusResult.count))
					end
					if ParseFollowingStatusResult and ParseFollowingStatusResult.limit ~= nil then
						p4:dispatch(SetExperienceNotificationsEnabledLimitModule(ParseFollowingStatusResult.limit))
					end
					local Badges = ExperienceDetails.badges
					
					if Badges then
						p4:dispatch(SetGameBadgesModule(UniverseId, Badges))
					end
					local SocialLinks = ExperienceDetails.socialLinks
					
					if SocialLinks then
						local ProcessGameSocialLinksModuleResult = ProcessGameSocialLinksModule(SocialLinks, UniverseId)
						
						if ProcessGameSocialLinksModuleResult then
							p4:dispatch(SetGameSocialLinksModule(UniverseId, ProcessGameSocialLinksModuleResult))
						end
					end
					if GetAppFeaturePoliciesFunction().getCommunityLinksEnabled() then
						local CommunityLinks = ExperienceDetails.communityLinks
						local v3 = nil
						
						if CommunityLinks then
							local Success, Result1 = pcall(CommunityInfo.fromJsonData, CommunityLinks)
							local v4 = nil
							
							if Success then
								v4 = Result1
							else
								ApiFetchExperienceDetailsPageCountersModule.logParseFailure("communityLinks", if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
								v4 = nil
							end
							v3 = v4
						else
							v3 = nil
						end
						if v3 and v3.visibility == CommunityVisibility.Public then
							p4:dispatch(SetExperienceCommunityLinkFunction(UniverseId, v3))
						end
					end
					local ParseAgeRecommendationsResult = parseAgeRecommendations(ExperienceDetails, UniverseId)
					
					if ParseAgeRecommendationsResult then
						p4:dispatch(SetAgeRecommendationFunction(UniverseId, ParseAgeRecommendationsResult.ageRecommendationDetailsData))
						p4:dispatch(SetAgeRecommendationHeadersFunction(ParseAgeRecommendationsResult.headerDisplayName, ParseAgeRecommendationsResult.headerDisplayNameShort))
					end
				end
				if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then
					ApiFetchExperienceDetailsPageCountersModule.logFetchSuccess(if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then UniverseId else nil)
				end
				return ResponseBody
			end):catch(function(Err)
				-- upvalues: p4 (copy), SetGameDetailErrorFunction (upval), UniverseId (upval), EnumGameDetailErrorTypes (upval), FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure (upval), ApiFetchExperienceDetailsPageCountersModule (upval), LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2 (upval), PromiseModule (upval)
				if Err and Err.StatusCode == 404 then
					p4:dispatch(SetGameDetailErrorFunction(UniverseId, EnumGameDetailErrorTypes.ExperienceUnavailable))
				end
				if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then
					ApiFetchExperienceDetailsPageCountersModule.logFetchFailure(UniverseId, if LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2 and Err then Err.StatusCode else nil, if LuaAppEdpBackendV2LogFetchFailureErrorCodeAndMessage2 and Err then Err.StatusMessage else nil)
				end
				return PromiseModule.reject(Err)
			end)
		end)
	end
}