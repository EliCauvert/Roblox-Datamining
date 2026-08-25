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

local function _(p0)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p0)
end

local _ = function(p1)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p1)
end

local _ = function(p2)
	-- upvalues: fFlagMigrateGameInfoToStore (ref), dataHydrationModule (ref)
	if fFlagMigrateGameInfoToStore then
		dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p2, false)
		
		return
	end
	dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p2)
end

local _ = function(p3)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p3)
end

local _ = function(p4)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p4)
end

local _ = function(value)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(value)
end

local _ = function(p5)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p5)
end

local _ = function(p6)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p6)
end

local _ = function(p7)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p7)
end

local _ = function(value)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(value)
end

local _ = function(p8)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p8)
end

local _ = function(p9)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p9)
end

local _ = function(p10)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p10)
end

local _ = function(p11)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p11)
end

local _ = function(p12)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p12)
end

local _ = function(p13)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p13)
end

local _ = function(p14)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getFavoritesStore(false).updateItems(p14)
end

local _ = function(p15)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p15)
end

local function updateVoteCountsFromUniverses(p16)
	-- upvalues: dataHydrationModule (ref)
	local t = {}
	local var28 = false
	
	for i, v in p16 do
		local var29 = tonumber(v.totalUpVotes)
		local var30 = tonumber(v.totalDownVotes)
		
		if var29 and var30 then
			t[i] = { upVotes = var29, downVotes = var30 }
			var28 = true
		end
	end
	if var28 then
		dataHydrationModule.Game.getVotesStore(false).updateVoteItems(t)
	end
end

local _ = function(p17)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p17)
end

local _ = function(p18)
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p18)
end

local function calculateBadgeDerivedField(p19, p20, _)
	-- upvalues: protobufTimestampToLocalTimeString (ref)
	if p19 == "created_time_formatted" then
		local createdTime = p20 and (p20.created_time or p20.createdTime)
		
		return createdTime and protobufTimestampToLocalTimeString(createdTime)
	elseif p19 == "updated_time_formatted" then
		local updatedTime = p20 and (p20.updated_time or p20.updatedTime)
		
		return updatedTime and protobufTimestampToLocalTimeString(updatedTime)
	elseif p19 == "awarded_time_formatted" then
		local awardedTime = p20 and (p20.awarded_time or p20.awardedTime)
		
		return awardedTime and protobufTimestampToLocalTimeString(awardedTime)
	end
	return nil
end

local function calculateUniverseDerivedField(p21, p22, _)
	-- upvalues: dataHydrationModule (ref), fFlagSduiSupportRatingNoPercent (ref), fFlagSduiExperienceDetailsSupport (ref), localizationService (ref), getZendeskUrl (ref)
	if p21 == "rating_text_formatted_brief" then
		local totalUpVotes = tonumber(p22.totalUpVotes) or 0
		local totalDownVotes = tonumber(p22.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		})
	elseif fFlagSduiSupportRatingNoPercent and p21 == "rating_text_no_percent" then
		local totalUpVotes = tonumber(p22.totalUpVotes) or 0
		local totalDownVotes = tonumber(p22.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		}, true)
	end
	return if fFlagSduiExperienceDetailsSupport and p21 == "refund_policy_learn_more_url" then getZendeskUrl(nil, localizationService.RobloxLocaleId, p22 and p22.refund_article_id) else nil
end

local function calculateAgeRecommendationDerivedField(p23, p24, _)
	-- upvalues: dataHydrationModule (ref)
	if p23 == "content_rating_image" then
		local igrsRating = p24 and p24.igrsRating
		
		return igrsRating and dataHydrationModule.Game.AgeRecommendationUtils.getIgrsImage(igrsRating)
	elseif p23 == "filtered_descriptors" then
		local t = {}
		
		if p24 and p24.descriptors then
			for i, v in p24.descriptors do
				if v.contains == true and v.displayName and v.displayName ~= "" then
					table.insert(t, { displayName = v.displayName })
				end
			end
		end
		return t
	elseif p23 ~= "contains_strong_language" then
		return nil
	elseif p24 and p24.descriptors then
		for i, v in p24.descriptors do
			if v.contains == true and v.name == "strong-language" then
				return true
			end
		end
	end
	return false
end

local function getDataObjectSignal(value, _, p25, p26)
	-- upvalues: dataHydrationModule (ref), fFlagSduiHydrationFetchIfMissing (ref), fFlagSduiExperienceDetailsSupport (ref), sduiDataBindingContentTypeModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
	if value == "badge" then
		return dataHydrationModule.Badges.getBadgeInfoStore(false).getBadgeInfo(tostring(p25))
	elseif value == "creator" then
		return dataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(p25)
	elseif value == "universe" then
		return if fFlagSduiHydrationFetchIfMissing and p26 then dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p25) else dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p25)
	elseif fFlagSduiExperienceDetailsSupport then
		if value == "ageRecommendation" then
			return if fFlagSduiHydrationFetchIfMissing and p26 then dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p25) else dataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(p25)
		elseif value == "socialLink" then
			return dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(p25)
		elseif value == "mediaAsset" then
			return dataHydrationModule.MediaAsset.getMediaAssetStore(false).getMediaAsset(p25)
		elseif value == "playability" then
			return if fFlagSduiHydrationFetchIfMissing and p26 then dataHydrationModule.Game.getPlayabilityStore(false).getAndFetchPlayability(tostring(p25)) else dataHydrationModule.Game.getPlayabilityStore(false).getPlayability(tostring(p25))
		elseif value == sduiDataBindingContentTypeModule.universeUserVote then
			return if p26 and not fFlagLuaAppVoteOptimisticUpdateRaceFix then dataHydrationModule.Game.getVotesStore(false).getAndFetchUserVote(p25) else dataHydrationModule.Game.getVotesStore(false).getUserVote(p25)
		elseif value == sduiDataBindingContentTypeModule.universeUserFavorite then
			return if p26 then dataHydrationModule.Game.getFavoritesStore(false).getAndFetchFavorite(p25) else dataHydrationModule.Game.getFavoritesStore(false).getFavorite(p25)
		elseif value == sduiDataBindingContentTypeModule.universeUserFollow then
			return if p26 then dataHydrationModule.Game.getFollowingsStore(false).getAndFetchFollowing(p25) else dataHydrationModule.Game.getFollowingsStore(false).getFollowing(p25)
		elseif value == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
			return if p26 then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(tostring(p25)) else dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(tostring(p25))
		elseif fFlagSduiCommunitySectionSupport then
			if value == sduiDataBindingContentTypeModule.community then
				return dataHydrationModule.Community.getCommunityInfoStore(false).getCommunityInfo(p25)
			elseif value == sduiDataBindingContentTypeModule.communityUserMembership then
				return dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).getMembership(p25)
			elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and value == "gamePass" then
				return dataHydrationModule.Game.getGamePassStore(false).getGamePassInfo(tostring(p25))
			elseif (fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport) and value == "event" then
				return dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(p25)
			elseif fFlagSduiMarketplaceCatalogCategorySupport and value == "marketplaceCatalogCategory" then
				return dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(p25)
			elseif fFlagSduiMarketplaceCatalogSortSupport and value == "marketplaceCatalogSort" then
				return dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p25)
			elseif value == "song" then
				return dataHydrationModule.Song.getSongInfoStore(false).getSongInfo(tostring(p25))
			elseif fFlagSduiAddMarketplaceEntityDataHydration then
				if value == "marketplaceAsset" then
					return dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(p25)
				elseif value == "marketplaceBundle" then
					return dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(p25)
				elseif value == "marketplaceLook" then
					return dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(p25)
				elseif fFlagSduiDevStoreSeeAllSupport then
					return if value == "gameDeveloperProduct" then dataHydrationModule.Game.getGameDeveloperProductStore(false).getGameDeveloperProductInfo(tostring(p25)) elseif value == "gameSubscription" then dataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo(tostring(p25)) else nil
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

local function isClientContentType(p27)
	-- upvalues: t (ref)
	return t[p27] or false
end

local function getFieldValueForClientContentType(p28, p29, p30, p31)
	-- upvalues: fFlagSduiClientPageScope (ref), sduiDataBindingContentTypeModule (ref), getSduiClientPageScopeModule (ref), sduiDataBindingResponsiveFieldName (ref), displayModule (ref), responsiveModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppEdpKeepFullPageOnPortraitRotation (ref), fFlagSduiCapabilityBindings (ref), sduiCapabilitiesModule (ref), fFlagSduiAppPolicyBindings (ref), getSduiPolicyStoreModule (ref), resolveSduiPolicyFieldModule (ref), tryGetPathFromDataModule (ref)
	local var40
	if fFlagSduiClientPageScope and p28 == sduiDataBindingContentTypeModule.clientPageScope then
		var40 = if p31 then p31.configKey else nil
		
		if var40 and #p29 >= 2 then
			return getSduiClientPageScopeModule(var40).getSignal(p29[2])(p30), nil
		end
		return nil
	elseif p28 == sduiDataBindingContentTypeModule.responsive then
		if #p29 ~= 2 then
			return nil
		end
		var40 = p29[2]
		
		if var40 == sduiDataBindingResponsiveFieldName.screenWidth then
			return displayModule.GetDisplayStore(p30).getViewportSize(p30).X
		elseif var40 == sduiDataBindingResponsiveFieldName.screenHeight then
			return displayModule.GetDisplayStore(p30).getViewportSize(p30).Y
		elseif var40 == sduiDataBindingResponsiveFieldName.isPortrait then
			local viewportSize = displayModule.GetDisplayStore(p30).getViewportSize(p30)
			
			return viewportSize.X < viewportSize.Y
		elseif var40 == sduiDataBindingResponsiveFieldName.isSpatial then
			return displayModule.GetDisplayStore(p30).getIsSpatial(p30)
		elseif var40 == sduiDataBindingResponsiveFieldName.lastInput then
			return responsiveModule.GetInputModeStore(p30).getLastInputType(p30)
		elseif var40 == sduiDataBindingResponsiveFieldName.preferredInput then
			return responsiveModule.GetInputModeStore(p30).getPreferredInputType(p30)
		elseif fFlagSduiExperienceDetailsSupport and var40 == sduiDataBindingResponsiveFieldName.isCompactTouch then
			if fFlagLuaAppEdpKeepFullPageOnPortraitRotation then
				return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(p30).getViewportSize(p30), responsiveModule.GetInputModeStore(p30).getPreferredInputType(p30))
			end
			local viewportSize = displayModule.GetDisplayStore(p30).getViewportSize(p30)
			
			return viewportSize.X <= responsiveModule.BreakpointConfig.sizes[responsiveModule.Keys.Small].maxWidth and (viewportSize.X < viewportSize.Y and responsiveModule.GetInputModeStore(p30).getPreferredInputType(p30) == responsiveModule.Input.Touch)
		elseif fFlagSduiCapabilityBindings and p28 == sduiDataBindingContentTypeModule.capability then
			return if #p29 < 2 then nil else sduiCapabilitiesModule.isEnabled(p29[2])
		elseif fFlagSduiAppPolicyBindings and p28 == sduiDataBindingContentTypeModule.policy then
			if #p29 < 2 then
				return nil
			end
			var40 = getSduiPolicyStoreModule().getAppPolicy(p30)
			
			if var40 == nil then
				error(`Failed to find policy table when binding value {table.concat(p29, ".")}`)
			end
			local var43, var44 = resolveSduiPolicyFieldModule(var40, p29[2])
			
			if var43 then
				return var44
			end
			local rawPolicy = var40.getRawPolicy()
			
			if rawPolicy then
				local var46, var47 = tryGetPathFromDataModule(rawPolicy, p29, 2)
				
				if var46 then
					return var47
				end
				error(`Failed to find policy value for '{table.concat(p29, ".")}'`)
			else
				error(`Failed to find rawPolicy table when binding value {table.concat(p29, ".")}`)
			end
		end
		return nil
	end
end

local function calculateDerivedFieldValue(p32, p33, p34, p35)
	-- upvalues: calculateBadgeDerivedField (ref), fFlagSduiExperienceDetailsSupport (ref), calculateUniverseDerivedField (ref), calculateAgeRecommendationDerivedField (ref), sduiDataBindingContentTypeModule (ref), dataHydrationModule (ref), fFlagSduiEventDetailsSupport (ref), getSduiServiceDependenciesStoreModule (ref)
	if p32 == "badge" then
		return calculateBadgeDerivedField(p33, p34, p35)
	elseif fFlagSduiExperienceDetailsSupport then
		return if p32 == "universe" then calculateUniverseDerivedField(p33, p34, p35) elseif p32 == "ageRecommendation" then calculateAgeRecommendationDerivedField(p33, p34, p35) elseif p32 == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p33, p34, p35) elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p32 == "event" then dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p33, p34, p35, getSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
	end
end

local function getUniverseIcon(p36, p37, p38)
	-- upvalues: dataHydrationModule (ref)
	local andFetchGameIcon = dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcon(tostring(p36), p38)
	local var49 = andFetchGameIcon.data(p37)
	local var50 = andFetchGameIcon.status(p37)
	
	if var49 and var49.url then
		return var49.url, var50
	end
	return nil, var50
end

local function getUniverseVoteRatingText(p39, p40, p41)
	-- upvalues: dataHydrationModule (ref)
	local vote = dataHydrationModule.Game.getVotesStore(false).getVote(p39)
	local var52 = vote.data(p40)
	local var53 = vote.status(p40)
	local var54 = if var52 then var52.upVotes else 0
	local var55 = if var52 then var52.downVotes else 0
	
	return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
		upVotes = var54,
		downVotes = var55,
		rating = dataHydrationModule.Game.VotesUtils.calculateRating(var54, var55)
	}, p41), var53
end

local _ = function(p42, p43, p44, p45)
	-- upvalues: tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if p44 == nil then
		return false, nil
	end
	local var56, var57 = tryGetPathFromDataModule(p44, p43, 2)
	
	if var56 then
		return true, var57
	elseif #p43 == 2 then
		local var58 = calculateDerivedFieldValue(p42, p43[2], p44, p45)
		
		return var58 ~= nil, var58
	end
	return false, nil
end

local function getDataHydrationField(p46, p47, p48, p49, p50)
	-- upvalues: fFlagMigrateGameInfoToStore (ref), fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getDataObjectSignal (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if #p47 < 2 then
		return nil, nil
	elseif not fFlagMigrateGameInfoToStore and fFlagSduiGameIconSupport and (p46 == "universe" and #p47 == 2) then
		if p47[2] == "icon" then
			return getUniverseIcon(p48, p49)
		elseif p47[2] == "largeIcon" then
			return getUniverseIcon(p48, p49, dataHydrationModule.Game.GameIconSize.Large)
		end
	end
	local var59 = getDataObjectSignal(p46, p47, p48, p50)
	
	if not var59 then
		error(`No available data object for {p46} {table.concat(p47, ".")} for id: {p48}`)
	end
	local var60 = var59.data(p49)
	local var61 = var59.status(p49)
	
	if not var60 then
		return nil, var61
	end
	local var62, var63 = tryGetPathFromDataModule(var60, p47, 2)
	
	if var62 then
		return var63, var61
	elseif #p47 == 2 then
		return calculateDerivedFieldValue(p46, p47[2], var60, p49), var61
	end
	return nil, var61
end

local t_1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = if fFlagMigrateGameInfoToStore then function(p51, p52, p53, p54, p55)
		-- upvalues: fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getUniverseVoteRatingText (ref), fFlagSduiSupportRatingNoPercent (ref), fFlagSduiHydrationFetchIfMissing (ref), getDataHydrationField (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref), dataStatus (ref)
		if #p52 == 2 then
			if fFlagSduiGameIconSupport then
				if p52[2] == "icon" then
					return getUniverseIcon(p53, p54)
				elseif p52[2] == "largeIcon" then
					return getUniverseIcon(p53, p54, dataHydrationModule.Game.GameIconSize.Large)
				elseif p52[2] == "rating_text_formatted_brief" then
					return getUniverseVoteRatingText(p53, p54)
				elseif fFlagSduiSupportRatingNoPercent and p52[2] == "rating_text_no_percent" then
					return getUniverseVoteRatingText(p53, p54, true)
				elseif not fFlagSduiHydrationFetchIfMissing or not p55 then
					return getDataHydrationField(p51, p52, p53, p54, p55)
				end
				local var69, var70
				local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
				local gameInfo, gameInfo_1 = gameInfoStore.getGameInfo(p53)
				local var67 = gameInfo.data(p54)
				local var68 = gameInfo.status(p54)
				
				if var67 == nil then
					var69 = false
					var70 = nil
				else
					local var71, var72 = tryGetPathFromDataModule(var67, p52, 2)
					
					if var71 then
						var69 = true
						var70 = var72
					elseif #p52 == 2 then
						local var73 = calculateDerivedFieldValue(p51, p52[2], var67, p54)
						var69 = var73 ~= nil
						var70 = var73
					else
						var69 = false
						var70 = nil
					end
				end
				if var69 then
					return var70, var68
				elseif gameInfo_1 then
					gameInfoStore.getAndFetchGameInfo(p53)
					
					return nil, dataStatus.NotReady
				end
				return nil, var68
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
	updateDataStores = function(p56)
		-- upvalues: dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), updateVoteCountsFromUniverses (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
		if p56.badge then
			dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p56.badge)
		end
		if p56.creator then
			dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p56.creator)
		end
		if p56.universe then
			local universe = p56.universe
			
			if fFlagMigrateGameInfoToStore then
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe, false)
			else
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe)
			end
			if fFlagMigrateGameInfoToStore then
				updateVoteCountsFromUniverses(p56.universe)
			end
		end
		if fFlagSduiExperienceDetailsSupport then
			if p56.ageRecommendation then
				dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p56.ageRecommendation)
			end
			if p56.socialLink then
				dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p56.socialLink)
			end
			if p56.mediaAsset then
				dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p56.mediaAsset)
			end
			if p56.playability then
				dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p56.playability)
			end
			if p56.universeUserFavorite then
				dataHydrationModule.Game.getFavoritesStore(false).updateItems(p56.universeUserFavorite)
			end
			if p56.universeUserVote then
				dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p56.universeUserVote)
			end
			if p56.userProfile then
				dataHydrationModule.UserProfile.updateFromHydration(p56.userProfile)
			end
		end
		if fFlagSduiCommunitySectionSupport then
			if p56.community then
				dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p56.community)
			end
			if p56.communityUserMembership then
				dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p56.communityUserMembership)
			end
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and p56.gamePass then
			dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p56.gamePass)
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p56.event then
			dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p56.event)
		end
		if fFlagSduiMarketplaceCatalogCategorySupport and p56.marketplaceCatalogCategory then
			dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p56.marketplaceCatalogCategory)
		end
		if fFlagSduiMarketplaceCatalogSortSupport and p56.catalogSort then
			dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p56.catalogSort)
		end
		if p56.song then
			dataHydrationModule.Song.getSongInfoStore(false).updateSongs(p56.song)
		end
		if fFlagSduiAddMarketplaceEntityDataHydration then
			if p56.marketplaceAsset then
				dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p56.marketplaceAsset)
			end
			if p56.marketplaceBundle then
				dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p56.marketplaceBundle)
			end
			if p56.marketplaceLook then
				dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p56.marketplaceLook)
			end
		end
		if fFlagSduiDevStoreSeeAllSupport then
			if p56.gameDeveloperProduct then
				dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p56.gameDeveloperProduct)
			end
			if p56.gameSubscription then
				dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p56.gameSubscription)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p57, p58, p59, p60, p61)
		-- upvalues: t_1 (ref)
		if #p58 < 2 then
			return nil, nil
		end
		local var74 = t_1[p57]
		
		if var74 == nil then
			return nil, nil
		end
		return var74(p57, p58, p59, p60, p61)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = isClientContentType,
	getFieldValueForClientContentType = getFieldValueForClientContentType,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}