local LocalizationService = game:GetService("LocalizationService")
local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.ServiceContractsProto)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local DisplayModule = require(Parent.Display)
local ResponsiveModule = require(Parent.Responsive)
local SduiDataBindingResponsiveFieldName = require(SduiCoreSystem.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName
local TryGetPathFromDataModule = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local SduiDataBindingContentTypeModule = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local GetZendeskUrlFunction = require(Parent.DiscoveryUtils).getZendeskUrl
local GetSduiPolicyStoreModule = require(SduiCoreSystem.ClientBinding.getSduiPolicyStore)
local ResolveSduiPolicyFieldModule = require(SduiCoreSystem.ClientBinding.resolveSduiPolicyField)
local GetSduiServiceDependenciesStoreModule = require(SduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local GetSduiClientPageScopeModule = require(SduiCoreSystem.ClientBinding.getSduiClientPageScope)
local SduiCapabilitiesModule = require(SduiCoreSystem.ClientBinding.SduiCapabilities)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagSduiCommunitySectionSupport = SharedFlagsModule.FFlagSduiCommunitySectionSupport
local FFlagLuaAppEdpKeepFullPageOnPortraitRotation = SharedFlagsModule.FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local FFlagSduiMarketplaceCatalogCategorySupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiAddMarketplaceEntityDataHydration = SharedFlagsModule.FFlagSduiAddMarketplaceEntityDataHydration
local FFlagSduiAddCollectibleItemDataHydration = SharedFlagsModule.FFlagSduiAddCollectibleItemDataHydration
local FFlagSduiLeaderboardComponent = SharedFlagsModule.FFlagSduiLeaderboardComponent
local FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local FFlagSduiCapabilityBindings = SharedFlagsModule.FFlagSduiCapabilityBindings
local FFlagMigrateGameInfoToStore = SharedFlagsModule.FFlagMigrateGameInfoToStore
local FFlagSduiSupportRatingNoPercent = SharedFlagsModule.FFlagSduiSupportRatingNoPercent
local FFlagSduiNotificationBadgeHydration = SharedFlagsModule.FFlagSduiNotificationBadgeHydration
local DataStatus = DataHydrationModule.DataHydrationTypes.DataStatus
local ProtobufTimestampToLocalTimeStringFunction = require(SduiCoreSystem.ClientBinding.SduiDataBinderTransformUtils).protobufTimestampToLocalTimeString

local function _(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p1)
end

local _ = function(p1)
	-- upvalues: FFlagMigrateGameInfoToStore (copy), DataHydrationModule (copy)
	if FFlagMigrateGameInfoToStore then
		DataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p1, false)
		
		return
	else
		DataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p1)
	end
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.CollectibleItem.getCollectibleItemStore(false).updateCollectibleItemInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.LeaderboardStats.getLeaderboardStatsStore(false).updateLeaderboardStatsBatch(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.NotificationBadge.getNotificationBadgeStore(false).updateNotificationBadges(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getFavoritesStore(false).updateItems(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p1)
end

local function updateVoteCountsFromUniverses(Universe)
	-- upvalues: DataHydrationModule (copy)
	local t = {}
	local Flag = false
	
	for i, value in Universe do
		local Number: number? = tonumber(value.totalUpVotes)
		local Number1: number? = tonumber(value.totalDownVotes)
		
		if Number and Number1 then
			t[i] = { upVotes = Number, downVotes = Number1 }
			Flag = true
		end
	end
	if Flag then
		DataHydrationModule.Game.getVotesStore(false).updateVoteItems(t)
	end
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p1)
end

local function calculateBadgeDerivedField(p1, p2, _)
	-- upvalues: ProtobufTimestampToLocalTimeStringFunction (copy)
	if p1 == "created_time_formatted" then
		local CreatedTime = p2 and (p2.created_time or p2.createdTime)
		
		return CreatedTime and ProtobufTimestampToLocalTimeStringFunction(CreatedTime)
	elseif p1 == "updated_time_formatted" then
		local UpdatedTime = p2 and (p2.updated_time or p2.updatedTime)
		
		return UpdatedTime and ProtobufTimestampToLocalTimeStringFunction(UpdatedTime)
	elseif p1 == "awarded_time_formatted" then
		local AwardedTime = p2 and (p2.awarded_time or p2.awardedTime)
		
		return AwardedTime and ProtobufTimestampToLocalTimeStringFunction(AwardedTime)
	else
		return nil
	end
end

local function calculateUniverseDerivedField(p1, p2, _)
	-- upvalues: DataHydrationModule (copy), FFlagSduiSupportRatingNoPercent (copy), LocalizationService (copy), GetZendeskUrlFunction (copy)
	if p1 == "rating_text_formatted_brief" then
		local Number: number = tonumber(p2.totalUpVotes) or 0
		local Number1: number = tonumber(p2.totalDownVotes) or 0
		
		return DataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = Number,
			downVotes = Number1,
			rating = DataHydrationModule.Game.VotesUtils.calculateRating(Number, Number1)
		})
	elseif FFlagSduiSupportRatingNoPercent and p1 == "rating_text_no_percent" then
		local Number: number = tonumber(p2.totalUpVotes) or 0
		local Number2: number = tonumber(p2.totalDownVotes) or 0
		
		return DataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = Number,
			downVotes = Number2,
			rating = DataHydrationModule.Game.VotesUtils.calculateRating(Number, Number2)
		}, true)
	else
		return if p1 == "refund_policy_learn_more_url" then GetZendeskUrlFunction(nil, LocalizationService.RobloxLocaleId, p2 and p2.refund_article_id) else nil
	end
end

local function calculateAgeRecommendationDerivedField(p1, p2, _)
	-- upvalues: DataHydrationModule (copy)
	if p1 == "content_rating_image" then
		local IgrsRating = p2 and p2.igrsRating
		
		return IgrsRating and DataHydrationModule.Game.AgeRecommendationUtils.getIgrsImage(IgrsRating)
	end
	if p1 == "filtered_descriptors" then
		local List = {}
		
		if p2 and p2.descriptors then
			for _, descriptor in p2.descriptors do
				if descriptor.contains == true and descriptor.displayName and descriptor.displayName ~= "" then
					table.insert(List, { displayName = descriptor.displayName })
				end
			end
		end
		return List
	else
		if p1 ~= "contains_strong_language" then
			return nil
		end
		if p2 and p2.descriptors then
			for _, descriptor1 in p2.descriptors do
				if descriptor1.contains == true and descriptor1.name == "strong-language" then
					return true
				end
			end
		end
		return false
	end
end

local function getDataObjectSignal(Community, _, p3, p4)
	-- upvalues: DataHydrationModule (copy), SduiDataBindingContentTypeModule (copy), FFlagSduiCommunitySectionSupport (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), FFlagSduiAddMarketplaceEntityDataHydration (copy), FFlagSduiAddCollectibleItemDataHydration (copy), FFlagSduiLeaderboardComponent (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiNotificationBadgeHydration (copy)
	if Community == "badge" then
		return DataHydrationModule.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(p3)))
	elseif Community == "creator" then
		return DataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(p3)
	elseif Community == "universe" then
		return if p4 then DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p3) else DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p3)
	elseif Community == "ageRecommendation" then
		return if p4 then DataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p3) else DataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(p3)
	elseif Community == "socialLink" then
		return DataHydrationModule.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(p3)
	elseif Community == "mediaAsset" then
		return DataHydrationModule.MediaAsset.getMediaAssetStore(false).getMediaAsset(p3)
	elseif Community == "playability" then
		return if p4 then DataHydrationModule.Game.getPlayabilityStore(false).getAndFetchPlayability((tostring(p3))) else DataHydrationModule.Game.getPlayabilityStore(false).getPlayability((tostring(p3)))
	elseif Community == SduiDataBindingContentTypeModule.universeUserVote then
		return DataHydrationModule.Game.getVotesStore(false).getUserVote(p3)
	elseif Community == SduiDataBindingContentTypeModule.universeUserFavorite then
		return if p4 then DataHydrationModule.Game.getFavoritesStore(false).getAndFetchFavorite(p3) else DataHydrationModule.Game.getFavoritesStore(false).getFavorite(p3)
	elseif Community == SduiDataBindingContentTypeModule.universeUserFollow then
		return if p4 then DataHydrationModule.Game.getFollowingsStore(false).getAndFetchFollowing(p3) else DataHydrationModule.Game.getFollowingsStore(false).getFollowing(p3)
	elseif Community == SduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
		return if p4 then DataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata((tostring(p3))) else DataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata((tostring(p3)))
	elseif FFlagSduiCommunitySectionSupport then
		if Community == SduiDataBindingContentTypeModule.community then
			return DataHydrationModule.Community.getCommunityInfoStore(false).getCommunityInfo(p3)
		elseif Community == SduiDataBindingContentTypeModule.communityUserMembership then
			return DataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).getMembership(p3)
		end
	end
	if Community == "gamePass" then
		return DataHydrationModule.Game.getGamePassStore(false).getGamePassInfo((tostring(p3)))
	elseif Community == "event" then
		return DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(p3)
	elseif FFlagSduiMarketplaceCatalogCategorySupport and Community == "marketplaceCatalogCategory" then
		return DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(p3)
	elseif FFlagSduiMarketplaceCatalogSortSupport and Community == "marketplaceCatalogSort" then
		return DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p3)
	elseif Community == "song" then
		return DataHydrationModule.Song.getSongInfoStore(false).getSongInfo((tostring(p3)))
	elseif FFlagSduiAddMarketplaceEntityDataHydration then
		if Community == "marketplaceAsset" then
			return DataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(p3)
		elseif Community == "marketplaceBundle" then
			return DataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(p3)
		elseif Community == "marketplaceLook" then
			return DataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(p3)
		end
	end
	if FFlagSduiAddCollectibleItemDataHydration and Community == "collectibleItem" then
		return DataHydrationModule.CollectibleItem.getCollectibleItemStore(false).getCollectibleItemInfo(p3)
	elseif FFlagSduiLeaderboardComponent and Community == "leaderboardStats" then
		return DataHydrationModule.LeaderboardStats.getLeaderboardStatsStore(false).getLeaderboardStats((tostring(p3)))
	elseif FFlagSduiDevStoreSeeAllSupport then
		if Community == "gameDeveloperProduct" then
			return DataHydrationModule.Game.getGameDeveloperProductStore(false).getGameDeveloperProductInfo((tostring(p3)))
		elseif Community == "gameSubscription" then
			return DataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo((tostring(p3)))
		end
	end
	return if FFlagSduiNotificationBadgeHydration and Community == "notificationBadge" then DataHydrationModule.NotificationBadge.getNotificationBadgeStore(false).getNotificationBadge((tostring(p3))) else nil
end

local config = {
	responsive = true,
	policy = true,
	clientPageScope = true,
	capability = if FFlagSduiCapabilityBindings then true else nil
}

local function calculateDerivedFieldValue(UniverseUserVoteFeedbackMetadata, p3, DataResult, p4)
	-- upvalues: calculateBadgeDerivedField (copy), calculateUniverseDerivedField (copy), calculateAgeRecommendationDerivedField (copy), SduiDataBindingContentTypeModule (copy), DataHydrationModule (copy), GetSduiServiceDependenciesStoreModule (copy)
	return if UniverseUserVoteFeedbackMetadata == "badge" then calculateBadgeDerivedField(p3, DataResult, p4) elseif UniverseUserVoteFeedbackMetadata == "universe" then calculateUniverseDerivedField(p3, DataResult, p4) elseif UniverseUserVoteFeedbackMetadata == "ageRecommendation" then calculateAgeRecommendationDerivedField(p3, DataResult, p4) elseif UniverseUserVoteFeedbackMetadata == SduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then DataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p3, DataResult, p4) elseif UniverseUserVoteFeedbackMetadata == "event" then DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p3, DataResult, p4, GetSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
end

local function getUniverseIcon(p3, p4, Large)
	-- upvalues: DataHydrationModule (copy)
	local AndFetchGameIcon = DataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcon(tostring(p3), Large)
	local DataResult = AndFetchGameIcon.data(p4)
	local StatusResult = AndFetchGameIcon.status(p4)
	
	if DataResult and DataResult.url then
		return DataResult.url, StatusResult
	else
		return nil, StatusResult
	end
end

local function getUniverseVoteRatingText(p3, p4, p5)
	-- upvalues: DataHydrationModule (copy)
	local Vote = DataHydrationModule.Game.getVotesStore(false).getVote(p3)
	local DataResult = Vote.data(p4)
	local UpVotes = if DataResult then DataResult.upVotes else 0
	local DownVotes = if DataResult then DataResult.downVotes else 0
	
	return DataHydrationModule.Game.VotesUtils.getRatingDisplayText({
		upVotes = UpVotes,
		downVotes = DownVotes,
		rating = DataHydrationModule.Game.VotesUtils.calculateRating(UpVotes, DownVotes)
	}, p5), (Vote.status(p4))
end

local _ = function(p3, Entry, p4, p5)
	-- upvalues: TryGetPathFromDataModule (copy), calculateDerivedFieldValue (copy)
	if p4 == nil then
		return false, nil
	end
	local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(p4, Entry, 2)
	
	if TryGetPathFromDataModuleResult then
		return true, TryGetPathFromDataModuleResult2
	elseif #Entry == 2 then
		local DerivedFieldValue = calculateDerivedFieldValue(p3, Entry[2], p4, p5)
		
		return DerivedFieldValue ~= nil, DerivedFieldValue
	else
		return false, nil
	end
end

local function getDataHydrationField(p3, Entry, p4, p5, p6)
	-- upvalues: FFlagMigrateGameInfoToStore (copy), getUniverseIcon (copy), DataHydrationModule (copy), getDataObjectSignal (copy), TryGetPathFromDataModule (copy), calculateDerivedFieldValue (copy)
	if #Entry < 2 then
		return nil, nil
	end
	if not FFlagMigrateGameInfoToStore and p3 == "universe" and #Entry == 2 then
		if Entry[2] == "icon" then
			return getUniverseIcon(p4, p5)
		end
		if Entry[2] == "largeIcon" then
			return getUniverseIcon(p4, p5, DataHydrationModule.Game.GameIconSize.Large)
		end
	end
	local DataObjectSignal = getDataObjectSignal(p3, Entry, p4, p6)
	
	if not DataObjectSignal then
		error(`No available data object for {p3} {table.concat(Entry, ".")} for id: {p4}`)
	end
	local DataResult = DataObjectSignal.data(p5)
	local StatusResult = DataObjectSignal.status(p5)
	
	if not DataResult then
		return nil, StatusResult
	end
	local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(DataResult, Entry, 2)
	
	if TryGetPathFromDataModuleResult then
		return TryGetPathFromDataModuleResult2, StatusResult
	elseif #Entry == 2 then
		return calculateDerivedFieldValue(p3, Entry[2], DataResult, p5), StatusResult
	else
		return nil, StatusResult
	end
end

local function resolveUniverseField(p7, Entry, p8, p9, p10)
	-- upvalues: getUniverseIcon (copy), DataHydrationModule (copy), getUniverseVoteRatingText (copy), FFlagSduiSupportRatingNoPercent (copy), getDataHydrationField (copy), TryGetPathFromDataModule (copy), calculateDerivedFieldValue (copy), DataStatus (copy)
	if #Entry == 2 then
		if Entry[2] == "icon" then
			return getUniverseIcon(p8, p9)
		end
		if Entry[2] == "largeIcon" then
			return getUniverseIcon(p8, p9, DataHydrationModule.Game.GameIconSize.Large)
		end
		if Entry[2] == "rating_text_formatted_brief" then
			return getUniverseVoteRatingText(p8, p9)
		end
		if FFlagSduiSupportRatingNoPercent and Entry[2] == "rating_text_no_percent" then
			return getUniverseVoteRatingText(p8, p9, true)
		end
	end
	if not p10 then
		return getDataHydrationField(p7, Entry, p8, p9, p10)
	end
	local GameInfoStore = DataHydrationModule.Game.getGameInfoStore(false)
	local GameInfo, GameInfo2 = GameInfoStore.getGameInfo(p8)
	local DataResult = GameInfo.data(p9)
	local StatusResult = GameInfo.status(p9)
	local Flag = nil
	local v1 = nil
	
	if DataResult == nil then
		Flag = false
		v1 = nil
	else
		local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(DataResult, Entry, 2)
		
		if TryGetPathFromDataModuleResult then
			Flag = true
			v1 = TryGetPathFromDataModuleResult2
		elseif #Entry == 2 then
			local DerivedFieldValue = calculateDerivedFieldValue(p7, Entry[2], DataResult, p9)
			Flag = DerivedFieldValue ~= nil
			v1 = DerivedFieldValue
		else
			Flag = false
			v1 = nil
		end
	end
	if Flag then
		return v1, StatusResult
	elseif GameInfo2 then
		GameInfoStore.getAndFetchGameInfo(p8)
		
		return nil, DataStatus.NotReady
	else
		return nil, StatusResult
	end
end

local config1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = if FFlagMigrateGameInfoToStore then resolveUniverseField else getDataHydrationField,
	ageRecommendation = getDataHydrationField,
	mediaAsset = getDataHydrationField,
	socialLink = getDataHydrationField,
	event = getDataHydrationField,
	marketplaceCatalogCategory = if FFlagSduiMarketplaceCatalogCategorySupport then getDataHydrationField else nil,
	marketplaceCatalogSort = if FFlagSduiMarketplaceCatalogSortSupport then getDataHydrationField else nil,
	marketplaceAsset = if FFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	marketplaceBundle = if FFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	marketplaceLook = if FFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	collectibleItem = if FFlagSduiAddCollectibleItemDataHydration then getDataHydrationField else nil,
	leaderboardStats = if FFlagSduiLeaderboardComponent then getDataHydrationField else nil,
	song = getDataHydrationField,
	gamePass = getDataHydrationField,
	gameDeveloperProduct = if FFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameSubscription = if FFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	playability = getDataHydrationField,
	universeUserVote = getDataHydrationField,
	universeUserFavorite = getDataHydrationField,
	universeUserFollow = getDataHydrationField,
	universeUserVoteFeedbackMetadata = getDataHydrationField,
	userProfile = DataHydrationModule.UserProfile and DataHydrationModule.UserProfile.resolveField,
	community = if FFlagSduiCommunitySectionSupport then getDataHydrationField else nil,
	communityUserMembership = if FFlagSduiCommunitySectionSupport then getDataHydrationField else nil,
	notificationBadge = if FFlagSduiNotificationBadgeHydration then getDataHydrationField else nil
}

return {
	updateDataStores = function(p7)
		-- upvalues: DataHydrationModule (copy), FFlagMigrateGameInfoToStore (copy), updateVoteCountsFromUniverses (copy), FFlagSduiCommunitySectionSupport (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), FFlagSduiAddMarketplaceEntityDataHydration (copy), FFlagSduiAddCollectibleItemDataHydration (copy), FFlagSduiLeaderboardComponent (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiNotificationBadgeHydration (copy)
		if p7.badge then
			DataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p7.badge)
		end
		if p7.creator then
			DataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p7.creator)
		end
		if p7.universe then
			local Universe = p7.universe
			
			if FFlagMigrateGameInfoToStore then
				DataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(Universe, false)
			else
				DataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(Universe)
			end
			if FFlagMigrateGameInfoToStore then
				updateVoteCountsFromUniverses(p7.universe)
			end
		end
		if p7.ageRecommendation then
			DataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p7.ageRecommendation)
		end
		if p7.socialLink then
			DataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p7.socialLink)
		end
		if p7.mediaAsset then
			DataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p7.mediaAsset)
		end
		if p7.playability then
			DataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p7.playability)
		end
		if p7.universeUserFavorite then
			DataHydrationModule.Game.getFavoritesStore(false).updateItems(p7.universeUserFavorite)
		end
		if p7.universeUserVote then
			DataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p7.universeUserVote)
		end
		if p7.userProfile then
			DataHydrationModule.UserProfile.updateFromHydration(p7.userProfile)
		end
		if FFlagSduiCommunitySectionSupport then
			if p7.community then
				DataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p7.community)
			end
			if p7.communityUserMembership then
				DataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p7.communityUserMembership)
			end
		end
		if p7.gamePass then
			DataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p7.gamePass)
		end
		if p7.event then
			DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p7.event)
		end
		if FFlagSduiMarketplaceCatalogCategorySupport and p7.marketplaceCatalogCategory then
			DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p7.marketplaceCatalogCategory)
		end
		if FFlagSduiMarketplaceCatalogSortSupport and p7.catalogSort then
			DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p7.catalogSort)
		end
		if p7.song then
			DataHydrationModule.Song.getSongInfoStore(false).updateSongs(p7.song)
		end
		if FFlagSduiAddMarketplaceEntityDataHydration then
			if p7.marketplaceAsset then
				DataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p7.marketplaceAsset)
			end
			if p7.marketplaceBundle then
				DataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p7.marketplaceBundle)
			end
			if p7.marketplaceLook then
				DataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p7.marketplaceLook)
			end
		end
		if FFlagSduiAddCollectibleItemDataHydration and p7.collectibleItem then
			DataHydrationModule.CollectibleItem.getCollectibleItemStore(false).updateCollectibleItemInfos(p7.collectibleItem)
		end
		if FFlagSduiLeaderboardComponent and p7.leaderboardStats then
			DataHydrationModule.LeaderboardStats.getLeaderboardStatsStore(false).updateLeaderboardStatsBatch(p7.leaderboardStats)
		end
		if FFlagSduiDevStoreSeeAllSupport then
			if p7.gameDeveloperProduct then
				DataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p7.gameDeveloperProduct)
			end
			if p7.gameSubscription then
				DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p7.gameSubscription)
			end
		end
		if FFlagSduiNotificationBadgeHydration and p7.notificationBadge then
			DataHydrationModule.NotificationBadge.getNotificationBadgeStore(false).updateNotificationBadges(p7.notificationBadge)
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p7, p8, p9, p10, p11)
		-- upvalues: config1 (copy)
		if #p8 < 2 then
			return nil, nil
		end
		local Entry = config1[p7]
		
		if Entry == nil then
			return nil, nil
		else
			return Entry(p7, p8, p9, p10, p11)
		end
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = function(p7)
		-- upvalues: config (copy)
		return config[p7] or false
	end,
	getFieldValueForClientContentType = function(Capability, Entry, p7, p8)
		-- upvalues: SduiDataBindingContentTypeModule (copy), GetSduiClientPageScopeModule (copy), SduiDataBindingResponsiveFieldName (copy), DisplayModule (copy), ResponsiveModule (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), FFlagSduiCapabilityBindings (copy), SduiCapabilitiesModule (copy), GetSduiPolicyStoreModule (copy), ResolveSduiPolicyFieldModule (copy), TryGetPathFromDataModule (copy)
		if Capability == SduiDataBindingContentTypeModule.clientPageScope then
			local ConfigKey = if p8 then p8.configKey else nil
			
			if ConfigKey and #Entry >= 2 then
				return GetSduiClientPageScopeModule(ConfigKey).getSignal(Entry[2])(p7), nil
			else
				return nil
			end
		else
			if Capability == SduiDataBindingContentTypeModule.responsive then
				if #Entry ~= 2 then
					return nil
				end
				local Entry1 = Entry[2]
				
				if Entry1 == SduiDataBindingResponsiveFieldName.screenWidth then
					return DisplayModule.GetDisplayStore(p7).getViewportSize(p7).X
				end
				if Entry1 == SduiDataBindingResponsiveFieldName.screenHeight then
					return DisplayModule.GetDisplayStore(p7).getViewportSize(p7).Y
				end
				if Entry1 == SduiDataBindingResponsiveFieldName.isPortrait then
					local ViewportSize = DisplayModule.GetDisplayStore(p7).getViewportSize(p7)
					
					return ViewportSize.X < ViewportSize.Y
				end
				if Entry1 == SduiDataBindingResponsiveFieldName.isSpatial then
					return DisplayModule.GetDisplayStore(p7).getIsSpatial(p7)
				end
				if Entry1 == SduiDataBindingResponsiveFieldName.lastInput then
					return ResponsiveModule.GetInputModeStore(p7).getLastInputType(p7)
				end
				if Entry1 == SduiDataBindingResponsiveFieldName.preferredInput then
					return ResponsiveModule.GetInputModeStore(p7).getPreferredInputType(p7)
				end
				if Entry1 ~= SduiDataBindingResponsiveFieldName.isCompactTouch then
					if FFlagLuaAppMediaGalleryGamepadSupport and Entry1 == SduiDataBindingResponsiveFieldName.isDirectional then
						return ResponsiveModule.GetInputModeStore(p7).getLastInputType(p7) == ResponsiveModule.Input.Directional
					end
				elseif FFlagLuaAppEdpKeepFullPageOnPortraitRotation then
					return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(p7).getViewportSize(p7), (ResponsiveModule.GetInputModeStore(p7).getPreferredInputType(p7)))
				else
					local ViewportSize = DisplayModule.GetDisplayStore(p7).getViewportSize(p7)
					local PreferredInputType = ResponsiveModule.GetInputModeStore(p7).getPreferredInputType(p7)
					local IsXBelow = ViewportSize.X < ViewportSize.Y
					
					return ViewportSize.X <= ResponsiveModule.BreakpointConfig.sizes[ResponsiveModule.Keys.Small].maxWidth and (IsXBelow and PreferredInputType == ResponsiveModule.Input.Touch)
				end
			end
			if FFlagSduiCapabilityBindings and Capability == SduiDataBindingContentTypeModule.capability then
				return if #Entry < 2 then nil else SduiCapabilitiesModule.isEnabled(Entry[2])
			end
			if Capability == SduiDataBindingContentTypeModule.policy then
				if #Entry < 2 then
					return nil
				end
				local AppPolicy = GetSduiPolicyStoreModule().getAppPolicy(p7)
				
				if AppPolicy == nil then
					error(`Failed to find policy table when binding value {table.concat(Entry, ".")}`)
				end
				local ResolveSduiPolicyFieldModuleResult, ResolveSduiPolicyFieldModuleResult2 = ResolveSduiPolicyFieldModule(AppPolicy, Entry[2])
				
				if ResolveSduiPolicyFieldModuleResult then
					return ResolveSduiPolicyFieldModuleResult2
				end
				local RawPolicy = AppPolicy.getRawPolicy()
				
				if RawPolicy then
					local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(RawPolicy, Entry, 2)
					
					if TryGetPathFromDataModuleResult then
						return TryGetPathFromDataModuleResult2
					end
					error(`Failed to find policy value for '{table.concat(Entry, ".")}'`)
				else
					error(`Failed to find rawPolicy table when binding value {table.concat(Entry, ".")}`)
				end
			end
			return nil
		end
	end,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}