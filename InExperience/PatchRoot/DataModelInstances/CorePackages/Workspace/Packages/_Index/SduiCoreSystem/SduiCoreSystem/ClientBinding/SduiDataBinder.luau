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

local function updateVoteCountsFromUniverses(p16) --[[ line: 157 ]]
	-- upvalues: dataHydrationModule (ref)
	local t = {}
	local var27 = false
	
	for i, v in p16 do
		local var28 = tonumber(v.totalUpVotes)
		local var29 = tonumber(v.totalDownVotes)
		
		if var28 and var29 then
			t[i] = { upVotes = var28, downVotes = var29 }
			var27 = true
		end
	end
	if var27 then
		dataHydrationModule.Game.getVotesStore(false).updateVoteItems(t)
	end
end

local _ = function(p17) --[[ line: 176 | named "updateCommunityInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p17)
end

local _ = function(p18) --[[ line: 180 | named "updateCommunityUserMembershipStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p18)
end

local function calculateBadgeDerivedField(p19, p20, _) --[[ line: 192 ]]
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

local function calculateUniverseDerivedField(p21, p22, _) --[[ line: 215 ]]
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

local function calculateAgeRecommendationDerivedField(p23, p24, _) --[[ line: 259 ]]
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

local function getDataObjectSignal(value, _, p25, p26) --[[ line: 295 ]]
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

local function isClientContentType(p27) --[[ line: 415 ]]
	-- upvalues: t (ref)
	return t[p27] or false
end

local function getFieldValueForClientContentType(p28, p29, p30, p31) --[[ line: 419 ]]
	-- upvalues: fFlagSduiClientPageScope (ref), sduiDataBindingContentTypeModule (ref), getSduiClientPageScopeModule (ref), sduiDataBindingResponsiveFieldName (ref), displayModule (ref), responsiveModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppEdpKeepFullPageOnPortraitRotation (ref), fFlagSduiCapabilityBindings (ref), sduiCapabilitiesModule (ref), fFlagSduiAppPolicyBindings (ref), getSduiPolicyStoreModule (ref), resolveSduiPolicyFieldModule (ref), tryGetPathFromDataModule (ref)
	local var39
	if fFlagSduiClientPageScope and p28 == sduiDataBindingContentTypeModule.clientPageScope then
		var39 = if p31 then p31.configKey else nil
		
		if var39 and #p29 >= 2 then
			return getSduiClientPageScopeModule(var39).getSignal(p29[2])(p30), nil
		end
		return nil
	elseif p28 == sduiDataBindingContentTypeModule.responsive then
		if #p29 ~= 2 then
			return nil
		end
		var39 = p29[2]
		
		if var39 == sduiDataBindingResponsiveFieldName.screenWidth then
			return displayModule.GetDisplayStore(p30).getViewportSize(p30).X
		elseif var39 == sduiDataBindingResponsiveFieldName.screenHeight then
			return displayModule.GetDisplayStore(p30).getViewportSize(p30).Y
		elseif var39 == sduiDataBindingResponsiveFieldName.isPortrait then
			local viewportSize = displayModule.GetDisplayStore(p30).getViewportSize(p30)
			
			return viewportSize.X < viewportSize.Y
		elseif var39 == sduiDataBindingResponsiveFieldName.isSpatial then
			return displayModule.GetDisplayStore(p30).getIsSpatial(p30)
		elseif var39 == sduiDataBindingResponsiveFieldName.lastInput then
			return responsiveModule.GetInputModeStore(p30).getLastInputType(p30)
		elseif var39 == sduiDataBindingResponsiveFieldName.preferredInput then
			return responsiveModule.GetInputModeStore(p30).getPreferredInputType(p30)
		elseif fFlagSduiExperienceDetailsSupport and var39 == sduiDataBindingResponsiveFieldName.isCompactTouch then
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
			var39 = getSduiPolicyStoreModule().getAppPolicy(p30)
			
			if var39 == nil then
				error(`Failed to find policy table when binding value {table.concat(p29, ".")}`)
			end
			local var42, var43 = resolveSduiPolicyFieldModule(var39, p29[2])
			
			if var42 then
				return var43
			end
			local rawPolicy = var39.getRawPolicy()
			
			if rawPolicy then
				local var45, var46 = tryGetPathFromDataModule(rawPolicy, p29, 2)
				
				if var45 then
					return var46
				end
				error(`Failed to find policy value for '{table.concat(p29, ".")}'`)
			else
				error(`Failed to find rawPolicy table when binding value {table.concat(p29, ".")}`)
			end
		end
		return nil
	end
end

local function calculateDerivedFieldValue(p32, p33, p34, p35) --[[ line: 514 ]]
	-- upvalues: calculateBadgeDerivedField (ref), fFlagSduiExperienceDetailsSupport (ref), calculateUniverseDerivedField (ref), calculateAgeRecommendationDerivedField (ref), sduiDataBindingContentTypeModule (ref), dataHydrationModule (ref), fFlagSduiEventDetailsSupport (ref), getSduiServiceDependenciesStoreModule (ref)
	if p32 == "badge" then
		return calculateBadgeDerivedField(p33, p34, p35)
	elseif fFlagSduiExperienceDetailsSupport then
		return if p32 == "universe" then calculateUniverseDerivedField(p33, p34, p35) elseif p32 == "ageRecommendation" then calculateAgeRecommendationDerivedField(p33, p34, p35) elseif p32 == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p33, p34, p35) elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p32 == "event" then dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p33, p34, p35, getSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
	end
end

local function getUniverseIcon(p36, p37, p38) --[[ line: 565 ]]
	-- upvalues: dataHydrationModule (ref)
	local andFetchGameIcon = dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcon(tostring(p36), p38)
	local var48 = andFetchGameIcon.data(p37)
	local var49 = andFetchGameIcon.status(p37)
	
	if var48 and var48.url then
		return var48.url, var49
	end
	return nil, var49
end

local _ = function(p39, p40, p41, p42) --[[ line: 580 | named "resolveFieldFromData" ]]
	-- upvalues: tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if p41 == nil then
		return false, nil
	end
	local var50, var51 = tryGetPathFromDataModule(p41, p40, 2)
	
	if var50 then
		return true, var51
	elseif #p40 == 2 then
		local var52 = calculateDerivedFieldValue(p39, p40[2], p41, p42)
		
		return var52 ~= nil, var52
	end
	return false, nil
end

local function getDataHydrationField(p43, p44, p45, p46, p47) --[[ line: 603 ]]
	-- upvalues: fFlagMigrateGameInfoToStore (ref), fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), getDataObjectSignal (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if #p44 < 2 then
		return nil, nil
	elseif not fFlagMigrateGameInfoToStore and fFlagSduiGameIconSupport and (p43 == "universe" and #p44 == 2) then
		if p44[2] == "icon" then
			return getUniverseIcon(p45, p46)
		elseif p44[2] == "largeIcon" then
			return getUniverseIcon(p45, p46, dataHydrationModule.Game.GameIconSize.Large)
		end
	end
	local var53 = getDataObjectSignal(p43, p44, p45, p47)
	
	if not var53 then
		error(`No available data object for {p43} {table.concat(p44, ".")} for id: {p45}`)
	end
	local var54 = var53.data(p46)
	local var55 = var53.status(p46)
	
	if not var54 then
		return nil, var55
	end
	local var56, var57 = tryGetPathFromDataModule(var54, p44, 2)
	
	if var56 then
		return var57, var55
	elseif #p44 == 2 then
		return calculateDerivedFieldValue(p43, p44[2], var54, p46), var55
	end
	return nil, var55
end

local t_1 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = if fFlagMigrateGameInfoToStore then function(p48, p49, p50, p51, p52) --[[ line: 657 | named "resolveUniverseField" ]]
		-- upvalues: fFlagSduiGameIconSupport (ref), getUniverseIcon (ref), dataHydrationModule (ref), fFlagSduiHydrationFetchIfMissing (ref), getDataHydrationField (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref), dataStatus (ref)
		if fFlagSduiGameIconSupport and #p49 == 2 then
			if p49[2] == "icon" then
				return getUniverseIcon(p50, p51)
			elseif p49[2] == "largeIcon" then
				return getUniverseIcon(p50, p51, dataHydrationModule.Game.GameIconSize.Large)
			elseif not fFlagSduiHydrationFetchIfMissing or not p52 then
				return getDataHydrationField(p48, p49, p50, p51, p52)
			end
			local var63, var64
			local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
			local gameInfo, gameInfo_1 = gameInfoStore.getGameInfo(p50)
			local var61 = gameInfo.data(p51)
			local var62 = gameInfo.status(p51)
			
			if var61 == nil then
				var63 = false
				var64 = nil
			else
				local var65, var66 = tryGetPathFromDataModule(var61, p49, 2)
				
				if var65 then
					var63 = true
					var64 = var66
				elseif #p49 == 2 then
					local var67 = calculateDerivedFieldValue(p48, p49[2], var61, p51)
					var63 = var67 ~= nil
					var64 = var67
				else
					var63 = false
					var64 = nil
				end
			end
			if var63 then
				return var64, var62
			elseif gameInfo_1 then
				gameInfoStore.getAndFetchGameInfo(p50)
				
				return nil, dataStatus.NotReady
			end
			return nil, var62
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
	updateDataStores = function(p53) --[[ line: 764 ]]
		-- upvalues: dataHydrationModule (ref), fFlagMigrateGameInfoToStore (ref), updateVoteCountsFromUniverses (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCommunitySectionSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
		if p53.badge then
			dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p53.badge)
		end
		if p53.creator then
			dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p53.creator)
		end
		if p53.universe then
			local universe = p53.universe
			
			if fFlagMigrateGameInfoToStore then
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe, false)
			else
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(universe)
			end
			if fFlagMigrateGameInfoToStore then
				updateVoteCountsFromUniverses(p53.universe)
			end
		end
		if fFlagSduiExperienceDetailsSupport then
			if p53.ageRecommendation then
				dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p53.ageRecommendation)
			end
			if p53.socialLink then
				dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p53.socialLink)
			end
			if p53.mediaAsset then
				dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p53.mediaAsset)
			end
			if p53.playability then
				dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p53.playability)
			end
			if p53.universeUserFavorite then
				dataHydrationModule.Game.getFavoritesStore(false).updateItems(p53.universeUserFavorite)
			end
			if p53.universeUserVote then
				dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p53.universeUserVote)
			end
			if p53.userProfile then
				dataHydrationModule.UserProfile.updateFromHydration(p53.userProfile)
			end
		end
		if fFlagSduiCommunitySectionSupport then
			if p53.community then
				dataHydrationModule.Community.getCommunityInfoStore(false).updateCommunityInfos(p53.community)
			end
			if p53.communityUserMembership then
				dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).updateMemberships(p53.communityUserMembership)
			end
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and p53.gamePass then
			dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p53.gamePass)
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p53.event then
			dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p53.event)
		end
		if fFlagSduiMarketplaceCatalogCategorySupport and p53.marketplaceCatalogCategory then
			dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p53.marketplaceCatalogCategory)
		end
		if fFlagSduiMarketplaceCatalogSortSupport and p53.catalogSort then
			dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p53.catalogSort)
		end
		if p53.song then
			dataHydrationModule.Song.getSongInfoStore(false).updateSongs(p53.song)
		end
		if fFlagSduiAddMarketplaceEntityDataHydration then
			if p53.marketplaceAsset then
				dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p53.marketplaceAsset)
			end
			if p53.marketplaceBundle then
				dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p53.marketplaceBundle)
			end
			if p53.marketplaceLook then
				dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p53.marketplaceLook)
			end
		end
		if fFlagSduiDevStoreSeeAllSupport then
			if p53.gameDeveloperProduct then
				dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p53.gameDeveloperProduct)
			end
			if p53.gameSubscription then
				dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p53.gameSubscription)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p54, p55, p56, p57, p58) --[[ line: 741 ]]
		-- upvalues: t_1 (ref)
		if #p55 < 2 then
			return nil, nil
		end
		local var68 = t_1[p54]
		
		if var68 == nil then
			return nil, nil
		end
		return var68(p54, p55, p56, p57, p58)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = isClientContentType,
	getFieldValueForClientContentType = getFieldValueForClientContentType,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}