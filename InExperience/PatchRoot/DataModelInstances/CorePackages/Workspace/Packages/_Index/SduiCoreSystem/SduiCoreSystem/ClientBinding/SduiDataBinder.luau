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
local fFlagSduiSupportRatingNoPercent = sharedFlagsModule.FFlagSduiSupportRatingNoPercent
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local dataStatus = dataHydrationModule.DataHydrationTypes.DataStatus
local protobufTimestampToLocalTimeString = sduiDataBinderTransformUtilsModule.protobufTimestampToLocalTimeString

local function _(p0) --[[ line: 74 | named "updateBadgesInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p0)
end

local _ = function(p1) --[[ line: 78 | named "updateCreatorInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p1)
end

local _ = function(p2) --[[ line: 82 | named "updateGameInfos" ]]
	-- upvalues: fFlagMigrateGameInfoToStore (ref), dataHydrationModule (ref)
	if fFlagMigrateGameInfoToStore then
		dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p2, false)
		
		return
	end
	dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p2)
end

local _ = function(p3) --[[ line: 92 | named "updateAgeRecommendations" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p3)
end

local _ = function(p4) --[[ line: 96 | named "updateSocialLinkInfos" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p4)
end

local _ = function(value) --[[ line: 100 | named "updateMediaAssetStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(value)
end

local _ = function(p5) --[[ line: 104 | named "updateExperienceEventInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p5)
end

local _ = function(p6) --[[ line: 108 | named "updateMarketplaceCatalogCategoryStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p6)
end

local _ = function(p7) --[[ line: 114 | named "updateMarketplaceCatalogSortStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p7)
end

local _ = function(value) --[[ line: 118 | named "updateMarketplaceAssetInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(value)
end

local _ = function(p8) --[[ line: 122 | named "updateMarketplaceBundleInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p8)
end

local _ = function(p9) --[[ line: 126 | named "updateMarketplaceLookInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p9)
end

local _ = function(p10) --[[ line: 130 | named "updateGamePassStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p10)
end

local _ = function(p11) --[[ line: 134 | named "updatePlayabilityStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p11)
end

local _ = function(p12) --[[ line: 138 | named "updateGameDeveloperProductStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p12)
end

local _ = function(p13) --[[ line: 142 | named "updateGameSubscriptionStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p13)
end

local _ = function(p14) --[[ line: 146 | named "updateFavoritesStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getFavoritesStore(false).updateItems(p14)
end

local _ = function(p15) --[[ line: 150 | named "updateUserVoteStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p15)
end

local _ = function(p16) --[[ line: 154 | named "updateCommunityInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p16)
end

local _ = function(p17) --[[ line: 158 | named "updateCommunityUserMembershipStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p17)
end

local function calculateBadgeDerivedField(p18, p19, _) --[[ line: 170 ]]
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

local function calculateUniverseDerivedField(p20, p21, _) --[[ line: 193 ]]
	-- upvalues: dataHydrationModule (ref), fFlagSduiSupportRatingNoPercent (ref), fFlagSduiExperienceDetailsSupport (ref), localizationService (ref), getZendeskUrl (ref)
	if p20 == "rating_text_formatted_brief" then
		local totalUpVotes = tonumber(p21.totalUpVotes) or 0
		local totalDownVotes = tonumber(p21.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		})
	elseif fFlagSduiSupportRatingNoPercent and p20 == "rating_text_no_percent" then
		local totalUpVotes = tonumber(p21.totalUpVotes) or 0
		local totalDownVotes = tonumber(p21.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		}, true)
	end
	return if fFlagSduiExperienceDetailsSupport and p20 == "refund_policy_learn_more_url" then getZendeskUrl(nil, localizationService.RobloxLocaleId, p21 and p21.refund_article_id) else nil
end

local function calculateAgeRecommendationDerivedField(p22, p23, _) --[[ line: 237 ]]
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

local function getDataObjectSignal(value, _, p24, p25) --[[ line: 273 ]]
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

local function isClientContentType(p26) --[[ line: 393 ]]
	-- upvalues: t (ref)
	return t[p26] or false
end

local function getFieldValueForClientContentType(p27, p28, p29, p30) --[[ line: 397 ]]
	-- upvalues: fFlagSduiClientPageScope (ref), sduiDataBindingContentTypeModule (ref), getSduiClientPageScopeModule (ref), sduiDataBindingResponsiveFieldName (ref), displayModule (ref), responsiveModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppEdpKeepFullPageOnPortraitRotation (ref), fFlagSduiCapabilityBindings (ref), sduiCapabilitiesModule (ref), fFlagSduiAppPolicyBindings (ref), getSduiPolicyStoreModule (ref), resolveSduiPolicyFieldModule (ref), tryGetPathFromDataModule (ref)
	local var34
	if fFlagSduiClientPageScope and p27 == sduiDataBindingContentTypeModule.clientPageScope then
		var34 = if p30 then p30.configKey else nil
		
		if var34 and #p28 >= 2 then
			return getSduiClientPageScopeModule(var34).getSignal(p28[2])(p29), nil
		end
		return nil
	elseif p27 == sduiDataBindingContentTypeModule.responsive then
		if #p28 ~= 2 then
			return nil
		end
		var34 = p28[2]
		
		if var34 == sduiDataBindingResponsiveFieldName.screenWidth then
			return displayModule.GetDisplayStore(p29).getViewportSize(p29).X
		elseif var34 == sduiDataBindingResponsiveFieldName.screenHeight then
			return displayModule.GetDisplayStore(p29).getViewportSize(p29).Y
		elseif var34 == sduiDataBindingResponsiveFieldName.isPortrait then
			local viewportSize = displayModule.GetDisplayStore(p29).getViewportSize(p29)
			
			return viewportSize.X < viewportSize.Y
		elseif var34 == sduiDataBindingResponsiveFieldName.isSpatial then
			return displayModule.GetDisplayStore(p29).getIsSpatial(p29)
		elseif var34 == sduiDataBindingResponsiveFieldName.lastInput then
			return responsiveModule.GetInputModeStore(p29).getLastInputType(p29)
		elseif var34 == sduiDataBindingResponsiveFieldName.preferredInput then
			return responsiveModule.GetInputModeStore(p29).getPreferredInputType(p29)
		elseif fFlagSduiExperienceDetailsSupport and var34 == sduiDataBindingResponsiveFieldName.isCompactTouch then
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
			var34 = getSduiPolicyStoreModule().getAppPolicy(p29)
			
			if var34 == nil then
				error(`Failed to find policy table when binding value {table.concat(p28, ".")}`)
			end
			local var37, var38 = resolveSduiPolicyFieldModule(var34, p28[2])
			
			if var37 then
				return var38
			end
			local rawPolicy = var34.getRawPolicy()
			
			if rawPolicy then
				local var40, var41 = tryGetPathFromDataModule(rawPolicy, p28, 2)
				
				if var40 then
					return var41
				end
				error(`Failed to find policy value for '{table.concat(p28, ".")}'`)
			else
				error(`Failed to find rawPolicy table when binding value {table.concat(p28, ".")}`)
			end
		end
		return nil
	end
end

local function calculateDerivedFieldValue(p31, p32, p33, p34) --[[ line: 492 ]]
	-- upvalues: calculateBadgeDerivedField (ref), fFlagSduiExperienceDetailsSupport (ref), calculateUniverseDerivedField (ref), calculateAgeRecommendationDerivedField (ref), sduiDataBindingContentTypeModule (ref), dataHydrationModule (ref), fFlagSduiEventDetailsSupport (ref), getSduiServiceDependenciesStoreModule (ref)
	if p31 == "badge" then
		return calculateBadgeDerivedField(p32, p33, p34)
	elseif fFlagSduiExperienceDetailsSupport then
		return if p31 == "universe" then calculateUniverseDerivedField(p32, p33, p34) elseif p31 == "ageRecommendation" then calculateAgeRecommendationDerivedField(p32, p33, p34) elseif p31 == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p32, p33, p34) elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p31 == "event" then dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p32, p33, p34, getSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
	end
end

local function getUniverseIcon(p35, p36, p37) --[[ line: 543 ]]
	-- upvalues: dataHydrationModule (ref)
	local andFetchGameIcon = dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcon(tostring(p35), p37)
	local var43 = andFetchGameIcon.data(p36)
	local var44 = andFetchGameIcon.status(p36)
	
	if var43 and var43.url then
		return var43.url, var44
	end
	return nil, var44
end

local _ = function(p38, p39, p40, p41) --[[ line: 558 | named "resolveFieldFromData" ]]
	-- upvalues: tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if p40 == nil then
		return false, nil
	end
	local var45, var46 = tryGetPathFromDataModule(p40, p39, 2)
	
	if var45 then
		return true, var46
	elseif #p39 == 2 then
		local var47 = calculateDerivedFieldValue(p38, p39[2], p40, p41)
		
		return var47 ~= nil, var47
	end
	return false, nil
end

local function getDataHydrationField(p42, p43, p44, p45, p46) --[[ line: 581 ]]
	-- upvalues: fFlagMigrateGameInfoToStore (ref), fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getDataObjectSignal (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if #p43 < 2 then
		return nil, nil
	elseif not fFlagMigrateGameInfoToStore and fFlagSduiGameIconSupport and (p42 == "universe" and #p43 == 2) then
		if p43[2] == "icon" then
			return getUniverseIcon(p44, p45)
		elseif p43[2] == "largeIcon" then
			return getUniverseIcon(p44, p45, dataHydrationModule.Game.GameIconSize.Large)
		end
	end
	local var48 = getDataObjectSignal(p42, p43, p44, p46)
	
	if not var48 then
		error(`No available data object for {p42} {table.concat(p43, ".")} for id: {p44}`)
	end
	local var49 = var48.data(p45)
	local var50 = var48.status(p45)
	
	if not var49 then
		return nil, var50
	end
	local var51, var52 = tryGetPathFromDataModule(var49, p43, 2)
	
	if var51 then
		return var52, var50
	elseif #p43 == 2 then
		return calculateDerivedFieldValue(p42, p43[2], var49, p45), var50
	end
	return nil, var50
end

local t_1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = if fFlagMigrateGameInfoToStore then function(p47, p48, p49, p50, p51) --[[ line: 635 | named "resolveUniverseField" ]]
		-- upvalues: fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), fFlagSduiHydrationFetchIfMissing (ref), getDataHydrationField (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref), dataStatus (ref)
		if fFlagSduiGameIconSupport and #p48 == 2 then
			if p48[2] == "icon" then
				return getUniverseIcon(p49, p50)
			elseif p48[2] == "largeIcon" then
				return getUniverseIcon(p49, p50, dataHydrationModule.Game.GameIconSize.Large)
			elseif not fFlagSduiHydrationFetchIfMissing or not p51 then
				return getDataHydrationField(p47, p48, p49, p50, p51)
			end
			local var58, var59
			local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
			local gameInfo, gameInfo_1 = gameInfoStore.getGameInfo(p49)
			local var56 = gameInfo.data(p50)
			local var57 = gameInfo.status(p50)
			
			if var56 == nil then
				var58 = false
				var59 = nil
			else
				local var60, var61 = tryGetPathFromDataModule(var56, p48, 2)
				
				if var60 then
					var58 = true
					var59 = var61
				elseif #p48 == 2 then
					local var62 = calculateDerivedFieldValue(p47, p48[2], var56, p50)
					var58 = var62 ~= nil
					var59 = var62
				else
					var58 = false
					var59 = nil
				end
			end
			if var58 then
				return var59, var57
			elseif gameInfo_1 then
				gameInfoStore.getAndFetchGameInfo(p49)
				
				return nil, dataStatus.NotReady
			end
			return nil, var57
		end
	end else getDataHydrationField,
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
	updateDataStores = function(p52) --[[ line: 742 ]]
		-- upvalues: dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
		if p52.badge then
			dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p52.badge)
		end
		if p52.creator then
			dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p52.creator)
		end
		if p52.universe then
			local universe = p52.universe
			
			if fFlagMigrateGameInfoToStore then
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe, false)
			else
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe)
			end
		end
		if fFlagSduiExperienceDetailsSupport then
			if p52.ageRecommendation then
				dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p52.ageRecommendation)
			end
			if p52.socialLink then
				dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p52.socialLink)
			end
			if p52.mediaAsset then
				dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p52.mediaAsset)
			end
			if p52.playability then
				dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p52.playability)
			end
			if p52.universeUserFavorite then
				dataHydrationModule.Game.getFavoritesStore(false).updateItems(p52.universeUserFavorite)
			end
			if p52.universeUserVote then
				dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p52.universeUserVote)
			end
			if p52.userProfile then
				dataHydrationModule.UserProfile.updateFromHydration(p52.userProfile)
			end
		end
		if fFlagSduiCommunitySectionSupport then
			if p52.community then
				dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p52.community)
			end
			if p52.communityUserMembership then
				dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p52.communityUserMembership)
			end
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and p52.gamePass then
			dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p52.gamePass)
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p52.event then
			dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p52.event)
		end
		if fFlagSduiMarketplaceCatalogCategorySupport and p52.marketplaceCatalogCategory then
			dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p52.marketplaceCatalogCategory)
		end
		if fFlagSduiMarketplaceCatalogSortSupport and p52.catalogSort then
			dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p52.catalogSort)
		end
		if p52.song then
			dataHydrationModule.Song.getSongInfoStore(false).updateSongs(p52.song)
		end
		if fFlagSduiAddMarketplaceEntityDataHydration then
			if p52.marketplaceAsset then
				dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p52.marketplaceAsset)
			end
			if p52.marketplaceBundle then
				dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p52.marketplaceBundle)
			end
			if p52.marketplaceLook then
				dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p52.marketplaceLook)
			end
		end
		if fFlagSduiDevStoreSeeAllSupport then
			if p52.gameDeveloperProduct then
				dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p52.gameDeveloperProduct)
			end
			if p52.gameSubscription then
				dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p52.gameSubscription)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p53, p54, p55, p56, p57) --[[ line: 719 ]]
		-- upvalues: t_1 (ref)
		if #p54 < 2 then
			return nil, nil
		end
		local var63 = t_1[p53]
		
		if var63 == nil then
			return nil, nil
		end
		return var63(p53, p54, p55, p56, p57)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = isClientContentType,
	getFieldValueForClientContentType = getFieldValueForClientContentType,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}