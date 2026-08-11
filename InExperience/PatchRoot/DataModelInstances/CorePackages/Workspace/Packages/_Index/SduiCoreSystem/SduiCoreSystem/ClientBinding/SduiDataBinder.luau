local localizationService = game:GetService("LocalizationService")
local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.ServiceContractsProto)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local displayModule = require(parent.Display)
local responsiveModule = require(parent.Responsive)
local sduiDataBindingResponsiveFieldName = require(sduiCoreSystem.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName
local tryGetPathFromDataModule = require(sduiCoreSystem.ClientBinding.tryGetPathFromData)
local sduiDataBindingContentTypeModule = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local sduiDataBinderTransformUtilsModule = require(sduiCoreSystem.ClientBinding.SduiDataBinderTransformUtils)
local getZendeskUrl = require(parent.DiscoveryUtils).getZendeskUrl
local getSduiPolicyStoreModule = require(sduiCoreSystem.ClientBinding.getSduiPolicyStore)
local resolveSduiPolicyFieldModule = require(sduiCoreSystem.ClientBinding.resolveSduiPolicyField)
local getSduiServiceDependenciesStoreModule = require(sduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local getSduiClientPageScopeModule = require(sduiCoreSystem.ClientBinding.getSduiClientPageScope)
local sduiCapabilitiesModule = require(sduiCoreSystem.ClientBinding.SduiCapabilities)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiAppPolicyBindings = sharedFlagsModule.FFlagSduiAppPolicyBindings
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiCommunitySectionSupport = sharedFlagsModule.FFlagSduiCommunitySectionSupport
local fFlagLuaAppEdpKeepFullPageOnPortraitRotation = sharedFlagsModule.FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport
local fFlagSduiMarketplaceCatalogCategorySupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiAddMarketplaceEntityDataHydration = sharedFlagsModule.FFlagSduiAddMarketplaceEntityDataHydration
local fFlagSduiHydrationFetchIfMissing = sharedFlagsModule.FFlagSduiHydrationFetchIfMissing
local fFlagSduiGameIconSupport = sharedFlagsModule.FFlagSduiGameIconSupport
local fFlagLuaAppVoteOptimisticUpdateRaceFix = sharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local fFlagSduiClientPageScope = sharedFlagsModule.FFlagSduiClientPageScope
local fFlagSduiCapabilityBindings = sharedFlagsModule.FFlagSduiCapabilityBindings
local protobufTimestampToLocalTimeString = sduiDataBinderTransformUtilsModule.protobufTimestampToLocalTimeString

local function _(p0) --[[ line: 70 | named "updateBadgesInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p0)
end

local _ = function(p1) --[[ line: 74 | named "updateCreatorInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p1)
end

local _ = function(p2) --[[ line: 78 | named "updateGameInfos" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p2)
end

local _ = function(p3) --[[ line: 82 | named "updateAgeRecommendations" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p3)
end

local _ = function(p4) --[[ line: 86 | named "updateSocialLinkInfos" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p4)
end

local _ = function(value) --[[ line: 90 | named "updateMediaAssetStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(value)
end

local _ = function(p5) --[[ line: 94 | named "updateExperienceEventInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p5)
end

local _ = function(p6) --[[ line: 98 | named "updateMarketplaceCatalogCategoryStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p6)
end

local _ = function(p7) --[[ line: 104 | named "updateMarketplaceCatalogSortStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p7)
end

local _ = function(value) --[[ line: 108 | named "updateMarketplaceAssetInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(value)
end

local _ = function(p8) --[[ line: 112 | named "updateMarketplaceBundleInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p8)
end

local _ = function(p9) --[[ line: 116 | named "updateMarketplaceLookInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p9)
end

local _ = function(p10) --[[ line: 120 | named "updateGamePassStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p10)
end

local _ = function(p11) --[[ line: 124 | named "updatePlayabilityStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p11)
end

local _ = function(p12) --[[ line: 128 | named "updateGameDeveloperProductStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p12)
end

local _ = function(p13) --[[ line: 132 | named "updateGameSubscriptionStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p13)
end

local _ = function(p14) --[[ line: 136 | named "updateFavoritesStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getFavoritesStore(false).updateItems(p14)
end

local _ = function(p15) --[[ line: 140 | named "updateUserVoteStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p15)
end

local _ = function(p16) --[[ line: 144 | named "updateCommunityInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p16)
end

local _ = function(p17) --[[ line: 148 | named "updateCommunityUserMembershipStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p17)
end

local function calculateBadgeDerivedField(p18, p19, _) --[[ line: 160 ]]
	-- upvalues: protobufTimestampToLocalTimeString (ref)
	if p18 == "created_time_formatted" then
		local createdTime = p19 and (p19.created_time or p19.createdTime)
		
		return createdTime and protobufTimestampToLocalTimeString(createdTime)
	elseif p18 == "updated_time_formatted" then
		local updatedTime = p19 and (p19.updated_time or p19.updatedTime)
		
		return updatedTime and protobufTimestampToLocalTimeString(updatedTime)
	elseif p18 == "awarded_time_formatted" then
		local awardedTime = p19 and (p19.awarded_time or p19.awardedTime)
		
		return awardedTime and protobufTimestampToLocalTimeString(awardedTime)
	end
	return nil
end

local function calculateUniverseDerivedField(p20, p21, _) --[[ line: 183 ]]
	-- upvalues: dataHydrationModule (ref), fFlagSduiExperienceDetailsSupport (ref), localizationService (ref), getZendeskUrl (ref)
	if p20 == "rating_text_formatted_brief" then
		local totalUpVotes = tonumber(p21.totalUpVotes) or 0
		local totalDownVotes = tonumber(p21.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		})
	end
	return if fFlagSduiExperienceDetailsSupport and p20 == "refund_policy_learn_more_url" then getZendeskUrl(nil, localizationService.RobloxLocaleId, p21 and p21.refund_article_id) else nil
end

local function calculateAgeRecommendationDerivedField(p22, p23, _) --[[ line: 213 ]]
	-- upvalues: dataHydrationModule (ref)
	if p22 == "content_rating_image" then
		local igrsRating = p23 and p23.igrsRating
		
		return igrsRating and dataHydrationModule.Game.AgeRecommendationUtils.getIgrsImage(igrsRating)
	elseif p22 == "filtered_descriptors" then
		local t = {}
		
		if p23 and p23.descriptors then
			for i, v in p23.descriptors do
				if v.contains == true and v.displayName and v.displayName ~= "" then
					table.insert(t, { displayName = v.displayName })
				end
			end
		end
		return t
	elseif p22 ~= "contains_strong_language" then
		return nil
	elseif p23 and p23.descriptors then
		for i, v in p23.descriptors do
			if v.contains == true and v.name == "strong-language" then
				return true
			end
		end
	end
	return false
end

local function getDataObjectSignal(value, _, p24, p25) --[[ line: 249 ]]
	-- upvalues: dataHydrationModule (ref), fFlagSduiHydrationFetchIfMissing (ref), fFlagSduiExperienceDetailsSupport (ref), sduiDataBindingContentTypeModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
	if value == "badge" then
		return dataHydrationModule.Badges.getBadgeInfoStore(false).getBadgeInfo(tostring(p24))
	elseif value == "creator" then
		return dataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(p24)
	elseif value == "universe" then
		return if fFlagSduiHydrationFetchIfMissing and p25 then dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p24) else dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p24)
	elseif fFlagSduiExperienceDetailsSupport then
		if value == "ageRecommendation" then
			return if fFlagSduiHydrationFetchIfMissing and p25 then dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p24) else dataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(p24)
		elseif value == "socialLink" then
			return dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(p24)
		elseif value == "mediaAsset" then
			return dataHydrationModule.MediaAsset.getMediaAssetStore(false).getMediaAsset(p24)
		elseif value == "playability" then
			return if fFlagSduiHydrationFetchIfMissing and p25 then dataHydrationModule.Game.getPlayabilityStore(false).getAndFetchPlayability(tostring(p24)) else dataHydrationModule.Game.getPlayabilityStore(false).getPlayability(tostring(p24))
		elseif value == sduiDataBindingContentTypeModule.universeUserVote then
			return if p25 and not fFlagLuaAppVoteOptimisticUpdateRaceFix then dataHydrationModule.Game.getVotesStore(false).getAndFetchUserVote(p24) else dataHydrationModule.Game.getVotesStore(false).getUserVote(p24)
		elseif value == sduiDataBindingContentTypeModule.universeUserFavorite then
			return if p25 then dataHydrationModule.Game.getFavoritesStore(false).getAndFetchFavorite(p24) else dataHydrationModule.Game.getFavoritesStore(false).getFavorite(p24)
		elseif value == sduiDataBindingContentTypeModule.universeUserFollow then
			return if p25 then dataHydrationModule.Game.getFollowingsStore(false).getAndFetchFollowing(p24) else dataHydrationModule.Game.getFollowingsStore(false).getFollowing(p24)
		elseif value == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
			return if p25 then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(tostring(p24)) else dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(tostring(p24))
		elseif fFlagSduiCommunitySectionSupport then
			if value == sduiDataBindingContentTypeModule.community then
				return dataHydrationModule.Community.getCommunityInfoStore(false).getCommunityInfo(p24)
			elseif value == sduiDataBindingContentTypeModule.communityUserMembership then
				return dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).getMembership(p24)
			elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and value == "gamePass" then
				return dataHydrationModule.Game.getGamePassStore(false).getGamePassInfo(tostring(p24))
			elseif (fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport) and value == "event" then
				return dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(p24)
			elseif fFlagSduiMarketplaceCatalogCategorySupport and value == "marketplaceCatalogCategory" then
				return dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(p24)
			elseif fFlagSduiMarketplaceCatalogSortSupport and value == "marketplaceCatalogSort" then
				return dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p24)
			elseif value == "song" then
				return dataHydrationModule.Song.getSongInfoStore(false).getSongInfo(tostring(p24))
			elseif fFlagSduiAddMarketplaceEntityDataHydration then
				if value == "marketplaceAsset" then
					return dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(p24)
				elseif value == "marketplaceBundle" then
					return dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(p24)
				elseif value == "marketplaceLook" then
					return dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(p24)
				elseif fFlagSduiDevStoreSeeAllSupport then
					return if value == "gameDeveloperProduct" then dataHydrationModule.Game.getGameDeveloperProductStore(false).getGameDeveloperProductInfo(tostring(p24)) elseif value == "gameSubscription" then dataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo(tostring(p24)) else nil
				end
			end
		end
	end
end

local t = {
	responsive = true,
	policy = if fFlagSduiAppPolicyBindings then true else nil,
	clientPageScope = if fFlagSduiClientPageScope then true else nil,
	capability = if fFlagSduiCapabilityBindings then true else nil
}

local function isClientContentType(p26) --[[ line: 369 ]]
	-- upvalues: t (ref)
	return t[p26] or false
end

local function getFieldValueForClientContentType(p27, p28, p29, p30) --[[ line: 373 ]]
	-- upvalues: fFlagSduiClientPageScope (ref), sduiDataBindingContentTypeModule (ref), getSduiClientPageScopeModule (ref), sduiDataBindingResponsiveFieldName (ref), displayModule (ref), responsiveModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppEdpKeepFullPageOnPortraitRotation (ref), fFlagSduiCapabilityBindings (ref), sduiCapabilitiesModule (ref), fFlagSduiAppPolicyBindings (ref), getSduiPolicyStoreModule (ref), resolveSduiPolicyFieldModule (ref), tryGetPathFromDataModule (ref)
	local var32
	if fFlagSduiClientPageScope and p27 == sduiDataBindingContentTypeModule.clientPageScope then
		var32 = if p30 then p30.configKey else nil
		
		if var32 and #p28 >= 2 then
			return getSduiClientPageScopeModule(var32).getSignal(p28[2])(p29), nil
		end
		return nil
	elseif p27 == sduiDataBindingContentTypeModule.responsive then
		if #p28 ~= 2 then
			return nil
		end
		var32 = p28[2]
		
		if var32 == sduiDataBindingResponsiveFieldName.screenWidth then
			return displayModule.GetDisplayStore(p29).getViewportSize(p29).X
		elseif var32 == sduiDataBindingResponsiveFieldName.screenHeight then
			return displayModule.GetDisplayStore(p29).getViewportSize(p29).Y
		elseif var32 == sduiDataBindingResponsiveFieldName.isPortrait then
			local viewportSize = displayModule.GetDisplayStore(p29).getViewportSize(p29)
			
			return viewportSize.X < viewportSize.Y
		elseif var32 == sduiDataBindingResponsiveFieldName.isSpatial then
			return displayModule.GetDisplayStore(p29).getIsSpatial(p29)
		elseif var32 == sduiDataBindingResponsiveFieldName.lastInput then
			return responsiveModule.GetInputModeStore(p29).getLastInputType(p29)
		elseif var32 == sduiDataBindingResponsiveFieldName.preferredInput then
			return responsiveModule.GetInputModeStore(p29).getPreferredInputType(p29)
		elseif fFlagSduiExperienceDetailsSupport and var32 == sduiDataBindingResponsiveFieldName.isCompactTouch then
			if fFlagLuaAppEdpKeepFullPageOnPortraitRotation then
				return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(p29).getViewportSize(p29), responsiveModule.GetInputModeStore(p29).getPreferredInputType(p29))
			end
			local viewportSize = displayModule.GetDisplayStore(p29).getViewportSize(p29)
			
			return viewportSize.X <= responsiveModule.BreakpointConfig.sizes[responsiveModule.Keys.Small].maxWidth and (viewportSize.X < viewportSize.Y and responsiveModule.GetInputModeStore(p29).getPreferredInputType(p29) == responsiveModule.Input.Touch)
		elseif fFlagSduiCapabilityBindings and p27 == sduiDataBindingContentTypeModule.capability then
			return if #p28 < 2 then nil else sduiCapabilitiesModule.isEnabled(p28[2])
		elseif fFlagSduiAppPolicyBindings and p27 == sduiDataBindingContentTypeModule.policy then
			if #p28 < 2 then
				return nil
			end
			var32 = getSduiPolicyStoreModule().getAppPolicy(p29)
			
			if var32 == nil then
				error(`Failed to find policy table when binding value {table.concat(p28, ".")}`)
			end
			local var35, var36 = resolveSduiPolicyFieldModule(var32, p28[2])
			
			if var35 then
				return var36
			end
			local rawPolicy = var32.getRawPolicy()
			
			if rawPolicy then
				local var38, var39 = tryGetPathFromDataModule(rawPolicy, p28, 2)
				
				if var38 then
					return var39
				end
				error(`Failed to find policy value for '{table.concat(p28, ".")}'`)
			else
				error(`Failed to find rawPolicy table when binding value {table.concat(p28, ".")}`)
			end
		end
		return nil
	end
end

local function calculateDerivedFieldValue(p31, p32, p33, p34) --[[ line: 468 ]]
	-- upvalues: calculateBadgeDerivedField (ref), fFlagSduiExperienceDetailsSupport (ref), calculateUniverseDerivedField (ref), calculateAgeRecommendationDerivedField (ref), sduiDataBindingContentTypeModule (ref), dataHydrationModule (ref), fFlagSduiEventDetailsSupport (ref), getSduiServiceDependenciesStoreModule (ref)
	if p31 == "badge" then
		return calculateBadgeDerivedField(p32, p33, p34)
	elseif fFlagSduiExperienceDetailsSupport then
		return if p31 == "universe" then calculateUniverseDerivedField(p32, p33, p34) elseif p31 == "ageRecommendation" then calculateAgeRecommendationDerivedField(p32, p33, p34) elseif p31 == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p32, p33, p34) elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p31 == "event" then dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p32, p33, p34, getSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
	end
end

local function getUniverseIcon(p35, p36, p37) --[[ line: 519 ]]
	-- upvalues: dataHydrationModule (ref)
	local andFetchGameIcon = dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcon(tostring(p35), p37)
	local var41 = andFetchGameIcon.data(p36)
	local var42 = andFetchGameIcon.status(p36)
	
	if var41 and var41.url then
		return var41.url, var42
	end
	return nil, var42
end

local function getDataHydrationField(p38, p39, p40, p41, p42) --[[ line: 534 ]]
	-- upvalues: fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getDataObjectSignal (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if #p39 < 2 then
		return nil, nil
	elseif fFlagSduiGameIconSupport and p38 == "universe" and #p39 == 2 then
		if p39[2] == "icon" then
			return getUniverseIcon(p40, p41)
		elseif p39[2] == "largeIcon" then
			return getUniverseIcon(p40, p41, dataHydrationModule.Game.GameIconSize.Large)
		end
	end
	local var43 = getDataObjectSignal(p38, p39, p40, p42)
	
	if not var43 then
		error(`No available data object for {p38} {table.concat(p39, ".")} for id: {p40}`)
	end
	local var44 = var43.data(p41)
	local var45 = var43.status(p41)
	
	if not var44 then
		return nil, var45
	end
	local var46, var47 = tryGetPathFromDataModule(var44, p39, 2)
	
	if var46 then
		return var47, var45
	elseif #p39 == 2 then
		return calculateDerivedFieldValue(p38, p39[2], var44, p41), var45
	end
	return nil, var45
end

local t_1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = getDataHydrationField,
	ageRecommendation = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	mediaAsset = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	socialLink = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	event = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then getDataHydrationField else nil,
	marketplaceCatalogCategory = if fFlagSduiMarketplaceCatalogCategorySupport then getDataHydrationField else nil,
	marketplaceCatalogSort = if fFlagSduiMarketplaceCatalogSortSupport then getDataHydrationField else nil,
	marketplaceAsset = if fFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	marketplaceBundle = if fFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	marketplaceLook = if fFlagSduiAddMarketplaceEntityDataHydration then getDataHydrationField else nil,
	song = getDataHydrationField,
	gamePass = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameDeveloperProduct = if fFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameSubscription = if fFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	playability = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserVote = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserFavorite = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserFollow = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserVoteFeedbackMetadata = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	userProfile = if fFlagSduiExperienceDetailsSupport then dataHydrationModule.UserProfile and dataHydrationModule.UserProfile.resolveField else nil,
	community = if fFlagSduiCommunitySectionSupport then getDataHydrationField else nil,
	communityUserMembership = if fFlagSduiCommunitySectionSupport then getDataHydrationField else nil
}

return {
	updateDataStores = function(p43) --[[ line: 648 ]]
		-- upvalues: dataHydrationModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
		if p43.badge then
			dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p43.badge)
		end
		if p43.creator then
			dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p43.creator)
		end
		if p43.universe then
			dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p43.universe)
		end
		if fFlagSduiExperienceDetailsSupport then
			if p43.ageRecommendation then
				dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p43.ageRecommendation)
			end
			if p43.socialLink then
				dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p43.socialLink)
			end
			if p43.mediaAsset then
				dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p43.mediaAsset)
			end
			if p43.playability then
				dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p43.playability)
			end
			if p43.universeUserFavorite then
				dataHydrationModule.Game.getFavoritesStore(false).updateItems(p43.universeUserFavorite)
			end
			if p43.universeUserVote then
				dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p43.universeUserVote)
			end
			if p43.userProfile then
				dataHydrationModule.UserProfile.updateFromHydration(p43.userProfile)
			end
		end
		if fFlagSduiCommunitySectionSupport then
			if p43.community then
				dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p43.community)
			end
			if p43.communityUserMembership then
				dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p43.communityUserMembership)
			end
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and p43.gamePass then
			dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p43.gamePass)
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p43.event then
			dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p43.event)
		end
		if fFlagSduiMarketplaceCatalogCategorySupport and p43.marketplaceCatalogCategory then
			dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p43.marketplaceCatalogCategory)
		end
		if fFlagSduiMarketplaceCatalogSortSupport and p43.catalogSort then
			dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p43.catalogSort)
		end
		if p43.song then
			dataHydrationModule.Song.getSongInfoStore(false).updateSongs(p43.song)
		end
		if fFlagSduiAddMarketplaceEntityDataHydration then
			if p43.marketplaceAsset then
				dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p43.marketplaceAsset)
			end
			if p43.marketplaceBundle then
				dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p43.marketplaceBundle)
			end
			if p43.marketplaceLook then
				dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p43.marketplaceLook)
			end
		end
		if fFlagSduiDevStoreSeeAllSupport then
			if p43.gameDeveloperProduct then
				dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p43.gameDeveloperProduct)
			end
			if p43.gameSubscription then
				dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p43.gameSubscription)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p44, p45, p46, p47, p48) --[[ line: 625 ]]
		-- upvalues: t_1 (ref)
		if #p45 < 2 then
			return nil, nil
		end
		local var48 = t_1[p44]
		
		if var48 == nil then
			return nil, nil
		end
		return var48(p44, p45, p46, p47, p48)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = isClientContentType,
	getFieldValueForClientContentType = getFieldValueForClientContentType,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}