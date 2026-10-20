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
local FFlagSduiAppPolicyBindings = SharedFlagsModule.FFlagSduiAppPolicyBindings
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local FFlagLuaAppEdpKeepFullPageOnPortraitRotation = SharedFlagsModule.FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local FFlagSduiEventDetailsSupport = SharedFlagsModule.FFlagSduiEventDetailsSupport
local FFlagSduiMarketplaceCatalogCategorySupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiAddMarketplaceEntityDataHydration = SharedFlagsModule.FFlagSduiAddMarketplaceEntityDataHydration
local FFlagSduiHydrationFetchIfMissing = SharedFlagsModule.FFlagSduiHydrationFetchIfMissing
local FFlagLuaAppVoteOptimisticUpdateRaceFix = SharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix
local FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local FFlagSduiClientPageScope = SharedFlagsModule.FFlagSduiClientPageScope
local FFlagSduiCapabilityBindings = SharedFlagsModule.FFlagSduiCapabilityBindings
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
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p1)
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
	DataHydrationModule.Game.getFavoritesStore(false).updateItems(p1)
end

local _ = function(p1)
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p1)
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
	-- upvalues: DataHydrationModule (copy), FFlagSduiExperienceDetailsSupport (copy), LocalizationService (copy), GetZendeskUrlFunction (copy)
	if p1 == "rating_text_formatted_brief" then
		local Number: number = tonumber(p2.totalUpVotes) or 0
		local Number1: number = tonumber(p2.totalDownVotes) or 0
		
		return DataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = Number,
			downVotes = Number1,
			rating = DataHydrationModule.Game.VotesUtils.calculateRating(Number, Number1)
		})
	else
		return if FFlagSduiExperienceDetailsSupport and p1 == "refund_policy_learn_more_url" then GetZendeskUrlFunction(nil, LocalizationService.RobloxLocaleId, p2 and p2.refund_article_id) else nil
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

local function getDataObjectSignal(UniverseUserFavorite, _, p3, p4)
	-- upvalues: DataHydrationModule (copy), FFlagSduiHydrationFetchIfMissing (copy), FFlagSduiExperienceDetailsSupport (copy), SduiDataBindingContentTypeModule (copy), FFlagLuaAppVoteOptimisticUpdateRaceFix (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), FFlagSduiAddMarketplaceEntityDataHydration (copy)
	if UniverseUserFavorite == "badge" then
		return DataHydrationModule.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(p3)))
	elseif UniverseUserFavorite == "creator" then
		return DataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(p3)
	elseif UniverseUserFavorite == "universe" then
		return if FFlagSduiHydrationFetchIfMissing and p4 then DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p3) else DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p3)
	elseif FFlagSduiExperienceDetailsSupport then
		if UniverseUserFavorite == "ageRecommendation" then
			return if FFlagSduiHydrationFetchIfMissing and p4 then DataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p3) else DataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(p3)
		elseif UniverseUserFavorite == "socialLink" then
			return DataHydrationModule.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(p3)
		elseif UniverseUserFavorite == "mediaAsset" then
			return DataHydrationModule.MediaAsset.getMediaAssetStore(false).getMediaAsset(p3)
		elseif UniverseUserFavorite == "playability" then
			return if FFlagSduiHydrationFetchIfMissing and p4 then DataHydrationModule.Game.getPlayabilityStore(false).getAndFetchPlayability((tostring(p3))) else DataHydrationModule.Game.getPlayabilityStore(false).getPlayability((tostring(p3)))
		elseif UniverseUserFavorite == SduiDataBindingContentTypeModule.universeUserVote then
			return if p4 and not FFlagLuaAppVoteOptimisticUpdateRaceFix then DataHydrationModule.Game.getVotesStore(false).getAndFetchUserVote(p3) else DataHydrationModule.Game.getVotesStore(false).getUserVote(p3)
		elseif UniverseUserFavorite == SduiDataBindingContentTypeModule.universeUserFavorite then
			return if p4 then DataHydrationModule.Game.getFavoritesStore(false).getAndFetchFavorite(p3) else DataHydrationModule.Game.getFavoritesStore(false).getFavorite(p3)
		elseif UniverseUserFavorite == SduiDataBindingContentTypeModule.universeUserFollow then
			return if p4 then DataHydrationModule.Game.getFollowingsStore(false).getAndFetchFollowing(p3) else DataHydrationModule.Game.getFollowingsStore(false).getFollowing(p3)
		elseif UniverseUserFavorite == SduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
			return if p4 then DataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata((tostring(p3))) else DataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata((tostring(p3)))
		end
	end
	if (FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport) and UniverseUserFavorite == "gamePass" then
		return DataHydrationModule.Game.getGamePassStore(false).getGamePassInfo((tostring(p3)))
	elseif (FFlagSduiEventDetailsSupport or FFlagSduiExperienceDetailsSupport) and UniverseUserFavorite == "event" then
		return DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(p3)
	elseif FFlagSduiMarketplaceCatalogCategorySupport and UniverseUserFavorite == "marketplaceCatalogCategory" then
		return DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(p3)
	elseif FFlagSduiMarketplaceCatalogSortSupport and UniverseUserFavorite == "marketplaceCatalogSort" then
		return DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p3)
	elseif UniverseUserFavorite == "song" then
		return DataHydrationModule.Song.getSongInfoStore(false).getSongInfo((tostring(p3)))
	elseif FFlagSduiAddMarketplaceEntityDataHydration then
		if UniverseUserFavorite == "marketplaceAsset" then
			return DataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(p3)
		elseif UniverseUserFavorite == "marketplaceBundle" then
			return DataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(p3)
		elseif UniverseUserFavorite == "marketplaceLook" then
			return DataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(p3)
		end
	end
	if FFlagSduiDevStoreSeeAllSupport then
		if UniverseUserFavorite == "gameDeveloperProduct" then
			return DataHydrationModule.Game.getGameDeveloperProductStore(false).getGameDeveloperProductInfo((tostring(p3)))
		elseif UniverseUserFavorite == "gameSubscription" then
			return DataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo((tostring(p3)))
		end
	end
	return nil
end

local config = {
	responsive = true,
	policy = if FFlagSduiAppPolicyBindings then true else nil,
	clientPageScope = if FFlagSduiClientPageScope then true else nil,
	capability = if FFlagSduiCapabilityBindings then true else nil
}

local function calculateDerivedFieldValue(UniverseUserVoteFeedbackMetadata, p3, DataResult, p4)
	-- upvalues: calculateBadgeDerivedField (copy), FFlagSduiExperienceDetailsSupport (copy), calculateUniverseDerivedField (copy), calculateAgeRecommendationDerivedField (copy), SduiDataBindingContentTypeModule (copy), DataHydrationModule (copy), FFlagSduiEventDetailsSupport (copy), GetSduiServiceDependenciesStoreModule (copy)
	if UniverseUserVoteFeedbackMetadata == "badge" then
		return (calculateBadgeDerivedField(p3, DataResult, p4))
	elseif FFlagSduiExperienceDetailsSupport then
		if UniverseUserVoteFeedbackMetadata == "universe" then
			return calculateUniverseDerivedField(p3, DataResult, p4)
		elseif UniverseUserVoteFeedbackMetadata == "ageRecommendation" then
			return (calculateAgeRecommendationDerivedField(p3, DataResult, p4))
		elseif UniverseUserVoteFeedbackMetadata == SduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
			return DataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p3, DataResult, p4)
		end
	end
	return if (FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport) and UniverseUserVoteFeedbackMetadata == "event" then DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p3, DataResult, p4, GetSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
end

local function getDataHydrationField(p3, Entry, p4, p5, p6)
	-- upvalues: getDataObjectSignal (copy), TryGetPathFromDataModule (copy), calculateDerivedFieldValue (copy)
	if #Entry < 2 then
		return nil, nil
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

local config1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = getDataHydrationField,
	ageRecommendation = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	mediaAsset = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	socialLink = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	event = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then getDataHydrationField else nil,
	marketplaceCatalogCategory = if FFlagSduiMarketplaceCatalogCategorySupport then getDataHydrationField else nil,
	marketplaceCatalogSort = if FFlagSduiMarketplaceCatalogSortSupport then getDataHydrationField else nil,
	marketplaceAsset = if FFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	marketplaceBundle = if FFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	marketplaceLook = if FFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	song = getDataHydrationField,
	gamePass = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameDeveloperProduct = if FFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameSubscription = if FFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	playability = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserVote = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserFavorite = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserFollow = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserVoteFeedbackMetadata = if FFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	userProfile = if FFlagSduiExperienceDetailsSupport then DataHydrationModule.UserProfile and DataHydrationModule.UserProfile.resolveField else nil
}

return {
	updateDataStores = function(p7)
		-- upvalues: DataHydrationModule (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), FFlagSduiAddMarketplaceEntityDataHydration (copy)
		if p7.badge then
			DataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p7.badge)
		end
		if p7.creator then
			DataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p7.creator)
		end
		if p7.universe then
			DataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p7.universe)
		end
		if FFlagSduiExperienceDetailsSupport then
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
		end
		if (FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport) and p7.gamePass then
			DataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p7.gamePass)
		end
		if (FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport) and p7.event then
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
		if FFlagSduiDevStoreSeeAllSupport then
			if p7.gameDeveloperProduct then
				DataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p7.gameDeveloperProduct)
			end
			if p7.gameSubscription then
				DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p7.gameSubscription)
			end
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
		-- upvalues: FFlagSduiClientPageScope (copy), SduiDataBindingContentTypeModule (copy), GetSduiClientPageScopeModule (copy), SduiDataBindingResponsiveFieldName (copy), DisplayModule (copy), ResponsiveModule (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), FFlagSduiCapabilityBindings (copy), SduiCapabilitiesModule (copy), FFlagSduiAppPolicyBindings (copy), GetSduiPolicyStoreModule (copy), ResolveSduiPolicyFieldModule (copy), TryGetPathFromDataModule (copy)
		if FFlagSduiClientPageScope and Capability == SduiDataBindingContentTypeModule.clientPageScope then
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
				if FFlagSduiExperienceDetailsSupport and Entry1 == SduiDataBindingResponsiveFieldName.isCompactTouch then
					if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then
						return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(p7).getViewportSize(p7), (ResponsiveModule.GetInputModeStore(p7).getPreferredInputType(p7)))
					else
						local ViewportSize = DisplayModule.GetDisplayStore(p7).getViewportSize(p7)
						local PreferredInputType = ResponsiveModule.GetInputModeStore(p7).getPreferredInputType(p7)
						local IsXBelow = ViewportSize.X < ViewportSize.Y
						
						return ViewportSize.X <= ResponsiveModule.BreakpointConfig.sizes[ResponsiveModule.Keys.Small].maxWidth and (IsXBelow and PreferredInputType == ResponsiveModule.Input.Touch)
					end
				end
			end
			if FFlagSduiCapabilityBindings and Capability == SduiDataBindingContentTypeModule.capability then
				return if #Entry < 2 then nil else SduiCapabilitiesModule.isEnabled(Entry[2])
			end
			if FFlagSduiAppPolicyBindings and Capability == SduiDataBindingContentTypeModule.policy then
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