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
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local fFlagSduiSupportRatingNoPercent = sharedFlagsModule.FFlagSduiSupportRatingNoPercent
local dataStatus = dataHydrationModule.DataHydrationTypes.DataStatus
local protobufTimestampToLocalTimeString = sduiDataBinderTransformUtilsModule.protobufTimestampToLocalTimeString

local function _(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p1)
end

local _ = function(p1)
	-- upvalues: fFlagMigrateGameInfoToStore (ref), dataHydrationModule (ref)
	if fFlagMigrateGameInfoToStore then
		dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p1, false)
		
		return
	end
	dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p1)
end

local _ = function(value)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(value)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p1)
end

local _ = function(value)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(value)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getFavoritesStore(false).updateItems(p1)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p1)
end

local function updateVoteCountsFromUniverses(p1)
	-- upvalues: dataHydrationModule (ref)
	local t = {}
	local var1 = false
	
	for i, v in p1 do
		local var2 = tonumber(v.totalUpVotes)
		local var3 = tonumber(v.totalDownVotes)
		
		if var2 and var3 then
			t[i] = { upVotes = var2, downVotes = var3 }
			var1 = true
		end
	end
	if var1 then
		dataHydrationModule.Game.getVotesStore(false).updateVoteItems(t)
	end
end

local _ = function(p2)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p2)
end

local _ = function(p2)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p2)
end

local function calculateBadgeDerivedField(p2, p3, _)
	-- upvalues: protobufTimestampToLocalTimeString (ref)
	if p2 == "created_time_formatted" then
		local createdTime = p3 and (p3.created_time or p3.createdTime)
		
		return createdTime and protobufTimestampToLocalTimeString(createdTime)
	elseif p2 == "updated_time_formatted" then
		local updatedTime = p3 and (p3.updated_time or p3.updatedTime)
		
		return updatedTime and protobufTimestampToLocalTimeString(updatedTime)
	elseif p2 == "awarded_time_formatted" then
		local awardedTime = p3 and (p3.awarded_time or p3.awardedTime)
		
		return awardedTime and protobufTimestampToLocalTimeString(awardedTime)
	end
	return nil
end

local function calculateUniverseDerivedField(p2, p3, _)
	-- upvalues: dataHydrationModule (ref), fFlagSduiSupportRatingNoPercent (ref), fFlagSduiExperienceDetailsSupport (ref), localizationService (ref), getZendeskUrl (ref)
	if p2 == "rating_text_formatted_brief" then
		local totalUpVotes = tonumber(p3.totalUpVotes) or 0
		local totalDownVotes = tonumber(p3.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		})
	elseif fFlagSduiSupportRatingNoPercent and p2 == "rating_text_no_percent" then
		local totalUpVotes = tonumber(p3.totalUpVotes) or 0
		local totalDownVotes = tonumber(p3.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		}, true)
	end
	return if fFlagSduiExperienceDetailsSupport and p2 == "refund_policy_learn_more_url" then getZendeskUrl(nil, localizationService.RobloxLocaleId, p3 and p3.refund_article_id) else nil
end

local function calculateAgeRecommendationDerivedField(p2, p3, _)
	-- upvalues: dataHydrationModule (ref)
	if p2 == "content_rating_image" then
		local igrsRating = p3 and p3.igrsRating
		
		return igrsRating and dataHydrationModule.Game.AgeRecommendationUtils.getIgrsImage(igrsRating)
	elseif p2 == "filtered_descriptors" then
		local t = {}
		
		if p3 and p3.descriptors then
			for i, v in p3.descriptors do
				if v.contains == true and v.displayName and v.displayName ~= "" then
					table.insert(t, { displayName = v.displayName })
				end
			end
		end
		return t
	elseif p2 ~= "contains_strong_language" then
		return nil
	elseif p3 and p3.descriptors then
		for i, v in p3.descriptors do
			if v.contains == true and v.name == "strong-language" then
				return true
			end
		end
	end
	return false
end

local function getDataObjectSignal(value, _, p4, p5)
	-- upvalues: dataHydrationModule (ref), fFlagSduiHydrationFetchIfMissing (ref), fFlagSduiExperienceDetailsSupport (ref), sduiDataBindingContentTypeModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
	if value == "badge" then
		return dataHydrationModule.Badges.getBadgeInfoStore(false).getBadgeInfo(tostring(p4))
	elseif value == "creator" then
		return dataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(p4)
	elseif value == "universe" then
		return if fFlagSduiHydrationFetchIfMissing and p5 then dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p4) else dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p4)
	elseif fFlagSduiExperienceDetailsSupport then
		if value == "ageRecommendation" then
			return if fFlagSduiHydrationFetchIfMissing and p5 then dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p4) else dataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(p4)
		elseif value == "socialLink" then
			return dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(p4)
		elseif value == "mediaAsset" then
			return dataHydrationModule.MediaAsset.getMediaAssetStore(false).getMediaAsset(p4)
		elseif value == "playability" then
			return if fFlagSduiHydrationFetchIfMissing and p5 then dataHydrationModule.Game.getPlayabilityStore(false).getAndFetchPlayability(tostring(p4)) else dataHydrationModule.Game.getPlayabilityStore(false).getPlayability(tostring(p4))
		elseif value == sduiDataBindingContentTypeModule.universeUserVote then
			return if p5 and not fFlagLuaAppVoteOptimisticUpdateRaceFix then dataHydrationModule.Game.getVotesStore(false).getAndFetchUserVote(p4) else dataHydrationModule.Game.getVotesStore(false).getUserVote(p4)
		elseif value == sduiDataBindingContentTypeModule.universeUserFavorite then
			return if p5 then dataHydrationModule.Game.getFavoritesStore(false).getAndFetchFavorite(p4) else dataHydrationModule.Game.getFavoritesStore(false).getFavorite(p4)
		elseif value == sduiDataBindingContentTypeModule.universeUserFollow then
			return if p5 then dataHydrationModule.Game.getFollowingsStore(false).getAndFetchFollowing(p4) else dataHydrationModule.Game.getFollowingsStore(false).getFollowing(p4)
		elseif value == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
			return if p5 then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(tostring(p4)) else dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(tostring(p4))
		elseif fFlagSduiCommunitySectionSupport then
			if value == sduiDataBindingContentTypeModule.community then
				return dataHydrationModule.Community.getCommunityInfoStore(false).getCommunityInfo(p4)
			elseif value == sduiDataBindingContentTypeModule.communityUserMembership then
				return dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).getMembership(p4)
			elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and value == "gamePass" then
				return dataHydrationModule.Game.getGamePassStore(false).getGamePassInfo(tostring(p4))
			elseif (fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport) and value == "event" then
				return dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(p4)
			elseif fFlagSduiMarketplaceCatalogCategorySupport and value == "marketplaceCatalogCategory" then
				return dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(p4)
			elseif fFlagSduiMarketplaceCatalogSortSupport and value == "marketplaceCatalogSort" then
				return dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p4)
			elseif value == "song" then
				return dataHydrationModule.Song.getSongInfoStore(false).getSongInfo(tostring(p4))
			elseif fFlagSduiAddMarketplaceEntityDataHydration then
				if value == "marketplaceAsset" then
					return dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(p4)
				elseif value == "marketplaceBundle" then
					return dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(p4)
				elseif value == "marketplaceLook" then
					return dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(p4)
				elseif fFlagSduiDevStoreSeeAllSupport then
					return if value == "gameDeveloperProduct" then dataHydrationModule.Game.getGameDeveloperProductStore(false).getGameDeveloperProductInfo(tostring(p4)) elseif value == "gameSubscription" then dataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo(tostring(p4)) else nil
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

local function isClientContentType(p4)
	-- upvalues: t (ref)
	return t[p4] or false
end

local function getFieldValueForClientContentType(p4, p5, p6, p7)
	-- upvalues: fFlagSduiClientPageScope (ref), sduiDataBindingContentTypeModule (ref), getSduiClientPageScopeModule (ref), sduiDataBindingResponsiveFieldName (ref), displayModule (ref), responsiveModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppEdpKeepFullPageOnPortraitRotation (ref), fFlagSduiCapabilityBindings (ref), sduiCapabilitiesModule (ref), fFlagSduiAppPolicyBindings (ref), getSduiPolicyStoreModule (ref), resolveSduiPolicyFieldModule (ref), tryGetPathFromDataModule (ref)
	local var4
	if fFlagSduiClientPageScope and p4 == sduiDataBindingContentTypeModule.clientPageScope then
		var4 = if p7 then p7.configKey else nil
		
		if var4 and #p5 >= 2 then
			return getSduiClientPageScopeModule(var4).getSignal(p5[2])(p6), nil
		end
		return nil
	elseif p4 == sduiDataBindingContentTypeModule.responsive then
		if #p5 ~= 2 then
			return nil
		end
		var4 = p5[2]
		
		if var4 == sduiDataBindingResponsiveFieldName.screenWidth then
			return displayModule.GetDisplayStore(p6).getViewportSize(p6).X
		elseif var4 == sduiDataBindingResponsiveFieldName.screenHeight then
			return displayModule.GetDisplayStore(p6).getViewportSize(p6).Y
		elseif var4 == sduiDataBindingResponsiveFieldName.isPortrait then
			local viewportSize = displayModule.GetDisplayStore(p6).getViewportSize(p6)
			
			return viewportSize.X < viewportSize.Y
		elseif var4 == sduiDataBindingResponsiveFieldName.isSpatial then
			return displayModule.GetDisplayStore(p6).getIsSpatial(p6)
		elseif var4 == sduiDataBindingResponsiveFieldName.lastInput then
			return responsiveModule.GetInputModeStore(p6).getLastInputType(p6)
		elseif var4 == sduiDataBindingResponsiveFieldName.preferredInput then
			return responsiveModule.GetInputModeStore(p6).getPreferredInputType(p6)
		elseif fFlagSduiExperienceDetailsSupport and var4 == sduiDataBindingResponsiveFieldName.isCompactTouch then
			if fFlagLuaAppEdpKeepFullPageOnPortraitRotation then
				return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(p6).getViewportSize(p6), responsiveModule.GetInputModeStore(p6).getPreferredInputType(p6))
			end
			local viewportSize = displayModule.GetDisplayStore(p6).getViewportSize(p6)
			
			return viewportSize.X <= responsiveModule.BreakpointConfig.sizes[responsiveModule.Keys.Small].maxWidth and (viewportSize.X < viewportSize.Y and responsiveModule.GetInputModeStore(p6).getPreferredInputType(p6) == responsiveModule.Input.Touch)
		elseif fFlagSduiCapabilityBindings and p4 == sduiDataBindingContentTypeModule.capability then
			return if #p5 < 2 then nil else sduiCapabilitiesModule.isEnabled(p5[2])
		elseif fFlagSduiAppPolicyBindings and p4 == sduiDataBindingContentTypeModule.policy then
			if #p5 < 2 then
				return nil
			end
			var4 = getSduiPolicyStoreModule().getAppPolicy(p6)
			
			if var4 == nil then
				error(`Failed to find policy table when binding value {table.concat(p5, ".")}`)
			end
			local var5, var6 = resolveSduiPolicyFieldModule(var4, p5[2])
			
			if var5 then
				return var6
			end
			local rawPolicy = var4.getRawPolicy()
			
			if rawPolicy then
				local var7, var8 = tryGetPathFromDataModule(rawPolicy, p5, 2)
				
				if var7 then
					return var8
				end
				error(`Failed to find policy value for '{table.concat(p29, ".")}'`)
			else
				error(`Failed to find rawPolicy table when binding value {table.concat(p5, ".")}`)
			end
		end
		return nil
	end
end

local function calculateDerivedFieldValue(p8, p9, p10, p11)
	-- upvalues: calculateBadgeDerivedField (ref), fFlagSduiExperienceDetailsSupport (ref), calculateUniverseDerivedField (ref), calculateAgeRecommendationDerivedField (ref), sduiDataBindingContentTypeModule (ref), dataHydrationModule (ref), fFlagSduiEventDetailsSupport (ref), getSduiServiceDependenciesStoreModule (ref)
	if p8 == "badge" then
		return calculateBadgeDerivedField(p9, p10, p11)
	elseif fFlagSduiExperienceDetailsSupport then
		return if p8 == "universe" then calculateUniverseDerivedField(p9, p10, p11) elseif p8 == "ageRecommendation" then calculateAgeRecommendationDerivedField(p9, p10, p11) elseif p8 == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p9, p10, p11) elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p8 == "event" then dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p9, p10, p11, getSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
	end
end

local function getUniverseIcon(p8, p9, p10)
	-- upvalues: dataHydrationModule (ref)
	local andFetchGameIcon = dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcon(tostring(p8), p10)
	local var9 = andFetchGameIcon.data(p9)
	local var10 = andFetchGameIcon.status(p9)
	
	if var9 and var9.url then
		return var9.url, var10
	end
	return nil, var10
end

local function getUniverseVoteRatingText(p8, p9, p10)
	-- upvalues: dataHydrationModule (ref)
	local vote = dataHydrationModule.Game.getVotesStore(false).getVote(p8)
	local var9 = vote.data(p9)
	local var10 = vote.status(p9)
	local var11 = if var9 then var9.upVotes else 0
	local var12 = if var9 then var9.downVotes else 0
	
	return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
		upVotes = var11,
		downVotes = var12,
		rating = dataHydrationModule.Game.VotesUtils.calculateRating(var11, var12)
	}, p10), var10
end

local _ = function(p8, p9, p10, p11)
	-- upvalues: tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if p10 == nil then
		return false, nil
	end
	local var9, var10 = tryGetPathFromDataModule(p10, p9, 2)
	
	if var9 then
		return true, var10
	elseif #p9 == 2 then
		local var11 = calculateDerivedFieldValue(p8, p9[2], p10, p11)
		
		return var11 ~= nil, var11
	end
	return false, nil
end

local function getDataHydrationField(p8, p9, p10, p11, p12)
	-- upvalues: fFlagMigrateGameInfoToStore (ref), fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getDataObjectSignal (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if #p9 < 2 then
		return nil, nil
	elseif not fFlagMigrateGameInfoToStore and fFlagSduiGameIconSupport and (p8 == "universe" and #p9 == 2) then
		if p9[2] == "icon" then
			return getUniverseIcon(p10, p11)
		elseif p9[2] == "largeIcon" then
			return getUniverseIcon(p10, p11, dataHydrationModule.Game.GameIconSize.Large)
		end
	end
	local var9 = getDataObjectSignal(p8, p9, p10, p12)
	
	if not var9 then
		error(`No available data object for {p8} {table.concat(p9, ".")} for id: {p10}`)
	end
	local var10 = var9.data(p11)
	local var11 = var9.status(p11)
	
	if not var10 then
		return nil, var11
	end
	local var12, var13 = tryGetPathFromDataModule(var10, p9, 2)
	
	if var12 then
		return var13, var11
	elseif #p9 == 2 then
		return calculateDerivedFieldValue(p8, p9[2], var10, p11), var11
	end
	return nil, var11
end

local t_1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = if fFlagMigrateGameInfoToStore then function(p13, p14, p15, p16, p17)
		-- upvalues: fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getUniverseVoteRatingText (ref), fFlagSduiSupportRatingNoPercent (ref), fFlagSduiHydrationFetchIfMissing (ref), getDataHydrationField (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref), dataStatus (ref)
		if #p14 == 2 then
			if fFlagSduiGameIconSupport then
				if p14[2] == "icon" then
					return getUniverseIcon(p15, p16)
				elseif p14[2] == "largeIcon" then
					return getUniverseIcon(p15, p16, dataHydrationModule.Game.GameIconSize.Large)
				elseif p14[2] == "rating_text_formatted_brief" then
					return getUniverseVoteRatingText(p15, p16)
				elseif fFlagSduiSupportRatingNoPercent and p14[2] == "rating_text_no_percent" then
					return getUniverseVoteRatingText(p15, p16, true)
				elseif not fFlagSduiHydrationFetchIfMissing or not p17 then
					return getDataHydrationField(p13, p14, p15, p16, p17)
				end
				local var14, var15
				local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
				local gameInfo, gameInfo_1 = gameInfoStore.getGameInfo(p15)
				local var16 = gameInfo.data(p16)
				local var17 = gameInfo.status(p16)
				
				if var16 == nil then
					var14 = false
					var15 = nil
				else
					local var18, var19 = tryGetPathFromDataModule(var16, p14, 2)
					
					if var18 then
						var14 = true
						var15 = var19
					elseif #p14 == 2 then
						local var20 = calculateDerivedFieldValue(p13, p14[2], var16, p16)
						var14 = var20 ~= nil
						var15 = var20
					else
						var14 = false
						var15 = nil
					end
				end
				if var14 then
					return var15, var17
				elseif gameInfo_1 then
					gameInfoStore.getAndFetchGameInfo(p15)
					
					return nil, dataStatus.NotReady
				end
				return nil, var17
			end
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
	updateDataStores = function(p13)
		-- upvalues: dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), updateVoteCountsFromUniverses (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
		if p13.badge then
			dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p13.badge)
		end
		if p13.creator then
			dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p13.creator)
		end
		if p13.universe then
			local universe = p13.universe
			
			if fFlagMigrateGameInfoToStore then
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe, false)
			else
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe)
			end
			if fFlagMigrateGameInfoToStore then
				updateVoteCountsFromUniverses(p13.universe)
			end
		end
		if fFlagSduiExperienceDetailsSupport then
			if p13.ageRecommendation then
				dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p13.ageRecommendation)
			end
			if p13.socialLink then
				dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p13.socialLink)
			end
			if p13.mediaAsset then
				dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p13.mediaAsset)
			end
			if p13.playability then
				dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p13.playability)
			end
			if p13.universeUserFavorite then
				dataHydrationModule.Game.getFavoritesStore(false).updateItems(p13.universeUserFavorite)
			end
			if p13.universeUserVote then
				dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p13.universeUserVote)
			end
			if p13.userProfile then
				dataHydrationModule.UserProfile.updateFromHydration(p13.userProfile)
			end
		end
		if fFlagSduiCommunitySectionSupport then
			if p13.community then
				dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p13.community)
			end
			if p13.communityUserMembership then
				dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p13.communityUserMembership)
			end
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and p13.gamePass then
			dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p13.gamePass)
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p13.event then
			dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p13.event)
		end
		if fFlagSduiMarketplaceCatalogCategorySupport and p13.marketplaceCatalogCategory then
			dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p13.marketplaceCatalogCategory)
		end
		if fFlagSduiMarketplaceCatalogSortSupport and p13.catalogSort then
			dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p13.catalogSort)
		end
		if p13.song then
			dataHydrationModule.Song.getSongInfoStore(false).updateSongs(p13.song)
		end
		if fFlagSduiAddMarketplaceEntityDataHydration then
			if p13.marketplaceAsset then
				dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p13.marketplaceAsset)
			end
			if p13.marketplaceBundle then
				dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p13.marketplaceBundle)
			end
			if p13.marketplaceLook then
				dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p13.marketplaceLook)
			end
		end
		if fFlagSduiDevStoreSeeAllSupport then
			if p13.gameDeveloperProduct then
				dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p13.gameDeveloperProduct)
			end
			if p13.gameSubscription then
				dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p13.gameSubscription)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p13, p14, p15, p16, p17)
		-- upvalues: t_1 (ref)
		if #p14 < 2 then
			return nil, nil
		end
		local var14 = t_1[p13]
		
		if var14 == nil then
			return nil, nil
		end
		return var14(p13, p14, p15, p16, p17)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = isClientContentType,
	getFieldValueForClientContentType = getFieldValueForClientContentType,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}