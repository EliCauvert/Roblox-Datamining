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
local fFlagLuaAppSduiBadgeDetailsComponents = sharedFlagsModule.FFlagLuaAppSduiBadgeDetailsComponents
local fFlagSduiAppPolicyBindings = sharedFlagsModule.FFlagSduiAppPolicyBindings
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppEdpKeepFullPageOnPortraitRotation = sharedFlagsModule.FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport
local fFlagSduiMarketplaceCatalogCategorySupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiAddMarketplaceEntityDataHydration = sharedFlagsModule.FFlagSduiAddMarketplaceEntityDataHydration
local fFlagSduiSongHydrationSupport = sharedFlagsModule.FFlagSduiSongHydrationSupport
local fFlagSduiHydrationFetchIfMissing = sharedFlagsModule.FFlagSduiHydrationFetchIfMissing
local fFlagLuaAppVoteOptimisticUpdateRaceFix = sharedFlagsModule.FFlagLuaAppVoteOptimisticUpdateRaceFix
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local fFlagSduiClientPageScope = sharedFlagsModule.FFlagSduiClientPageScope
local fFlagSduiCapabilityBindings = sharedFlagsModule.FFlagSduiCapabilityBindings
local protobufTimestampToLocalTimeString = sduiDataBinderTransformUtilsModule.protobufTimestampToLocalTimeString

local function _(p0) --[[ line: 68 | named "updateBadgesInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p0)
end

local _ = function(p1) --[[ line: 72 | named "updateCreatorInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p1)
end

local _ = function(p2) --[[ line: 76 | named "updateGameInfos" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p2)
end

local _ = function(p3) --[[ line: 80 | named "updateAgeRecommendations" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p3)
end

local _ = function(p4) --[[ line: 84 | named "updateSocialLinkInfos" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p4)
end

local _ = function(value) --[[ line: 88 | named "updateMediaAssetStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(value)
end

local _ = function(p5) --[[ line: 92 | named "updateExperienceEventInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p5)
end

local _ = function(p6) --[[ line: 96 | named "updateMarketplaceCatalogCategoryStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p6)
end

local _ = function(p7) --[[ line: 102 | named "updateMarketplaceCatalogSortStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p7)
end

local _ = function(value) --[[ line: 106 | named "updateMarketplaceAssetInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(value)
end

local _ = function(p8) --[[ line: 110 | named "updateMarketplaceBundleInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p8)
end

local _ = function(p9) --[[ line: 114 | named "updateMarketplaceLookInfoStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p9)
end

local _ = function(p10) --[[ line: 118 | named "updateGamePassStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p10)
end

local _ = function(p11) --[[ line: 122 | named "updatePlayabilityStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p11)
end

local _ = function(p12) --[[ line: 126 | named "updateGameDeveloperProductStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p12)
end

local _ = function(p13) --[[ line: 130 | named "updateGameSubscriptionStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p13)
end

local _ = function(p14) --[[ line: 134 | named "updateFavoritesStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getFavoritesStore(false).updateItems(p14)
end

local _ = function(p15) --[[ line: 138 | named "updateUserVoteStore" ]]
	-- upvalues: dataHydrationModule (ref)
	dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p15)
end

local function calculateBadgeDerivedField(p16, p17, _) --[[ line: 150 ]]
	-- upvalues: protobufTimestampToLocalTimeString (ref)
	if p16 == "created_time_formatted" then
		local createdTime = p17 and (p17.created_time or p17.createdTime)
		
		return createdTime and protobufTimestampToLocalTimeString(createdTime)
	elseif p16 == "updated_time_formatted" then
		local updatedTime = p17 and (p17.updated_time or p17.updatedTime)
		
		return updatedTime and protobufTimestampToLocalTimeString(updatedTime)
	elseif p16 == "awarded_time_formatted" then
		local awardedTime = p17 and (p17.awarded_time or p17.awardedTime)
		
		return awardedTime and protobufTimestampToLocalTimeString(awardedTime)
	end
	return nil
end

local function calculateUniverseDerivedField(p18, p19, _) --[[ line: 173 ]]
	-- upvalues: dataHydrationModule (ref), fFlagSduiExperienceDetailsSupport (ref), localizationService (ref), getZendeskUrl (ref)
	if p18 == "rating_text_formatted_brief" then
		local totalUpVotes = tonumber(p19.totalUpVotes) or 0
		local totalDownVotes = tonumber(p19.totalDownVotes) or 0
		
		return dataHydrationModule.Game.VotesUtils.getRatingDisplayText({
			upVotes = totalUpVotes,
			downVotes = totalDownVotes,
			rating = dataHydrationModule.Game.VotesUtils.calculateRating(totalUpVotes, totalDownVotes)
		})
	end
	return if fFlagSduiExperienceDetailsSupport and p18 == "refund_policy_learn_more_url" then getZendeskUrl(nil, localizationService.RobloxLocaleId, p19 and p19.refund_article_id) else nil
end

local function calculateAgeRecommendationDerivedField(p20, p21, _) --[[ line: 203 ]]
	-- upvalues: dataHydrationModule (ref)
	if p20 == "content_rating_image" then
		local igrsRating = p21 and p21.igrsRating
		
		return igrsRating and dataHydrationModule.Game.AgeRecommendationUtils.getIgrsImage(igrsRating)
	elseif p20 == "filtered_descriptors" then
		local t = {}
		
		if p21 and p21.descriptors then
			for i, v in p21.descriptors do
				if v.contains == true and v.displayName and v.displayName ~= "" then
					table.insert(t, { displayName = v.displayName })
				end
			end
		end
		return t
	elseif p20 ~= "contains_strong_language" then
		return nil
	elseif p21 and p21.descriptors then
		for i, v in p21.descriptors do
			if v.contains == true and v.name == "strong-language" then
				return true
			end
		end
	end
	return false
end

local function getDataObjectSignal(value, _, p22, p23) --[[ line: 239 ]]
	-- upvalues: dataHydrationModule (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), fFlagSduiHydrationFetchIfMissing (ref), fFlagSduiExperienceDetailsSupport (ref), sduiDataBindingContentTypeModule (ref), fFlagLuaAppVoteOptimisticUpdateRaceFix (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiSongHydrationSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
	if value == "badge" then
		return dataHydrationModule.Badges.getBadgeInfoStore(false).getBadgeInfo(tostring(p22))
	elseif fFlagLuaAppSduiBadgeDetailsComponents then
		if value == "creator" then
			return dataHydrationModule.Creator.getCreatorInfoStore(false).getCreatorInfo(p22)
		elseif value == "universe" then
			return if fFlagSduiHydrationFetchIfMissing and p23 then dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p22) else dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p22)
		elseif fFlagSduiExperienceDetailsSupport then
			if value == "ageRecommendation" then
				return if fFlagSduiHydrationFetchIfMissing and p23 then dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p22) else dataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(p22)
			elseif value == "socialLink" then
				return dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(p22)
			elseif value == "mediaAsset" then
				return dataHydrationModule.MediaAsset.getMediaAssetStore(false).getMediaAsset(p22)
			elseif value == "playability" then
				return if fFlagSduiHydrationFetchIfMissing and p23 then dataHydrationModule.Game.getPlayabilityStore(false).getAndFetchPlayability(tostring(p22)) else dataHydrationModule.Game.getPlayabilityStore(false).getPlayability(tostring(p22))
			elseif value == sduiDataBindingContentTypeModule.universeUserVote then
				return if p23 and not fFlagLuaAppVoteOptimisticUpdateRaceFix then dataHydrationModule.Game.getVotesStore(false).getAndFetchUserVote(p22) else dataHydrationModule.Game.getVotesStore(false).getUserVote(p22)
			elseif value == sduiDataBindingContentTypeModule.universeUserFavorite then
				return if p23 then dataHydrationModule.Game.getFavoritesStore(false).getAndFetchFavorite(p22) else dataHydrationModule.Game.getFavoritesStore(false).getFavorite(p22)
			elseif value == sduiDataBindingContentTypeModule.universeUserFollow then
				return if p23 then dataHydrationModule.Game.getFollowingsStore(false).getAndFetchFollowing(p22) else dataHydrationModule.Game.getFollowingsStore(false).getFollowing(p22)
			elseif value == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then
				return if p23 then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(tostring(p22)) else dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(tostring(p22))
			elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and value == "gamePass" then
				return dataHydrationModule.Game.getGamePassStore(false).getGamePassInfo(tostring(p22))
			elseif (fFlagSduiEventDetailsSupport or fFlagSduiExperienceDetailsSupport) and value == "event" then
				return dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(p22)
			elseif fFlagSduiMarketplaceCatalogCategorySupport and value == "marketplaceCatalogCategory" then
				return dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(p22)
			elseif fFlagSduiMarketplaceCatalogSortSupport and value == "marketplaceCatalogSort" then
				return dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p22)
			elseif fFlagSduiSongHydrationSupport and value == "song" then
				return dataHydrationModule.Song.getSongInfoStore(false).getSongInfo(tostring(p22))
			elseif fFlagSduiAddMarketplaceEntityDataHydration then
				if value == "marketplaceAsset" then
					return dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(p22)
				elseif value == "marketplaceBundle" then
					return dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(p22)
				elseif value == "marketplaceLook" then
					return dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(p22)
				elseif fFlagSduiDevStoreSeeAllSupport then
					return if value == "gameDeveloperProduct" then dataHydrationModule.Game.getGameDeveloperProductStore(false).getGameDeveloperProductInfo(tostring(p22)) elseif value == "gameSubscription" then dataHydrationModule.Game.getGameSubscriptionStore(false).getGameSubscriptionInfo(tostring(p22)) else nil
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

local function isClientContentType(p24) --[[ line: 354 ]]
	-- upvalues: t (ref)
	return t[p24] or false
end

local function getFieldValueForClientContentType(p25, p26, p27, p28) --[[ line: 358 ]]
	-- upvalues: fFlagSduiClientPageScope (ref), sduiDataBindingContentTypeModule (ref), getSduiClientPageScopeModule (ref), sduiDataBindingResponsiveFieldName (ref), displayModule (ref), responsiveModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppEdpKeepFullPageOnPortraitRotation (ref), fFlagSduiCapabilityBindings (ref), sduiCapabilitiesModule (ref), fFlagSduiAppPolicyBindings (ref), getSduiPolicyStoreModule (ref), resolveSduiPolicyFieldModule (ref), tryGetPathFromDataModule (ref)
	local var31
	if fFlagSduiClientPageScope and p25 == sduiDataBindingContentTypeModule.clientPageScope then
		var31 = if p28 then p28.configKey else nil
		
		if var31 and #p26 >= 2 then
			return getSduiClientPageScopeModule(var31).getSignal(p26[2])(p27), nil
		end
		return nil
	elseif p25 == sduiDataBindingContentTypeModule.responsive then
		if #p26 ~= 2 then
			return nil
		end
		var31 = p26[2]
		
		if var31 == sduiDataBindingResponsiveFieldName.screenWidth then
			return displayModule.GetDisplayStore(p27).getViewportSize(p27).X
		elseif var31 == sduiDataBindingResponsiveFieldName.screenHeight then
			return displayModule.GetDisplayStore(p27).getViewportSize(p27).Y
		elseif var31 == sduiDataBindingResponsiveFieldName.isPortrait then
			local viewportSize = displayModule.GetDisplayStore(p27).getViewportSize(p27)
			
			return viewportSize.X < viewportSize.Y
		elseif var31 == sduiDataBindingResponsiveFieldName.isSpatial then
			return displayModule.GetDisplayStore(p27).getIsSpatial(p27)
		elseif var31 == sduiDataBindingResponsiveFieldName.lastInput then
			return responsiveModule.GetInputModeStore(p27).getLastInputType(p27)
		elseif var31 == sduiDataBindingResponsiveFieldName.preferredInput then
			return responsiveModule.GetInputModeStore(p27).getPreferredInputType(p27)
		elseif fFlagSduiExperienceDetailsSupport and var31 == sduiDataBindingResponsiveFieldName.isCompactTouch then
			if fFlagLuaAppEdpKeepFullPageOnPortraitRotation then
				return responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(p27).getViewportSize(p27), responsiveModule.GetInputModeStore(p27).getPreferredInputType(p27))
			end
			local viewportSize = displayModule.GetDisplayStore(p27).getViewportSize(p27)
			
			return viewportSize.X <= responsiveModule.BreakpointConfig.sizes[responsiveModule.Keys.Small].maxWidth and (viewportSize.X < viewportSize.Y and responsiveModule.GetInputModeStore(p27).getPreferredInputType(p27) == responsiveModule.Input.Touch)
		elseif fFlagSduiCapabilityBindings and p25 == sduiDataBindingContentTypeModule.capability then
			return if #p26 < 2 then nil else sduiCapabilitiesModule.isEnabled(p26[2])
		elseif fFlagSduiAppPolicyBindings and p25 == sduiDataBindingContentTypeModule.policy then
			if #p26 < 2 then
				return nil
			end
			var31 = getSduiPolicyStoreModule().getAppPolicy(p27)
			
			if var31 == nil then
				error(`Failed to find policy table when binding value {table.concat(p26, ".")}`)
			end
			local var34, var35 = resolveSduiPolicyFieldModule(var31, p26[2])
			
			if var34 then
				return var35
			end
			local rawPolicy = var31.getRawPolicy()
			
			if rawPolicy then
				local var37, var38 = tryGetPathFromDataModule(rawPolicy, p26, 2)
				
				if var37 then
					return var38
				end
				error(`Failed to find policy value for '{table.concat(p26, ".")}'`)
			else
				error(`Failed to find rawPolicy table when binding value {table.concat(p26, ".")}`)
			end
		end
		return nil
	end
end

local function calculateDerivedFieldValue(p29, p30, p31, p32) --[[ line: 453 ]]
	-- upvalues: calculateBadgeDerivedField (ref), fFlagSduiExperienceDetailsSupport (ref), calculateUniverseDerivedField (ref), calculateAgeRecommendationDerivedField (ref), sduiDataBindingContentTypeModule (ref), dataHydrationModule (ref), fFlagSduiEventDetailsSupport (ref), getSduiServiceDependenciesStoreModule (ref)
	if p29 == "badge" then
		return calculateBadgeDerivedField(p30, p31, p32)
	elseif fFlagSduiExperienceDetailsSupport then
		return if p29 == "universe" then calculateUniverseDerivedField(p30, p31, p32) elseif p29 == "ageRecommendation" then calculateAgeRecommendationDerivedField(p30, p31, p32) elseif p29 == sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata then dataHydrationModule.Game.getUserVoteFeedbackMetadataStore(false).calculateDerivedField(p30, p31, p32) elseif (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p29 == "event" then dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).calculateDerivedField(p30, p31, p32, getSduiServiceDependenciesStoreModule().getDependencies("SduiDataBinder").localization) else nil
	end
end

local function getDataHydrationField(p33, p34, p35, p36, p37) --[[ line: 497 ]]
	-- upvalues: getDataObjectSignal (ref), tryGetPathFromDataModule (ref), calculateDerivedFieldValue (ref)
	if #p34 < 2 then
		return nil, nil
	end
	local var39 = getDataObjectSignal(p33, p34, p35, p37)
	
	if not var39 then
		error(`No available data object for {p33} {table.concat(p34, ".")} for id: {p35}`)
	end
	local var40 = var39.data(p36)
	local var41 = var39.status(p36)
	
	if not var40 then
		return nil, var41
	end
	local var42, var43 = tryGetPathFromDataModule(var40, p34, 2)
	
	if var42 then
		return var43, var41
	elseif #p34 == 2 then
		return calculateDerivedFieldValue(p33, p34[2], var40, p36), var41
	end
	return nil, var41
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
	song = if fFlagSduiSongHydrationSupport then getDataHydrationField else nil,
	gamePass = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameDeveloperProduct = if fFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	gameSubscription = if fFlagSduiDevStoreSeeAllSupport then getDataHydrationField else nil,
	playability = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserVote = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserFavorite = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserFollow = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	universeUserVoteFeedbackMetadata = if fFlagSduiExperienceDetailsSupport then getDataHydrationField else nil,
	userProfile = if fFlagSduiExperienceDetailsSupport then dataHydrationModule.UserProfile and dataHydrationModule.UserProfile.resolveField else nil
}

return {
	updateDataStores = function(p38) --[[ line: 601 ]]
		-- upvalues: dataHydrationModule (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiMarketplaceCatalogCategorySupport (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), fFlagSduiSongHydrationSupport (ref), fFlagSduiAddMarketplaceEntityDataHydration (ref)
		if p38.badge then
			dataHydrationModule.Badges.getBadgeInfoStore(false).updateBadges(p38.badge)
		end
		if fFlagLuaAppSduiBadgeDetailsComponents then
			if p38.creator then
				dataHydrationModule.Creator.getCreatorInfoStore(false).updateCreatorInfos(p38.creator)
			end
			if p38.universe then
				dataHydrationModule.Game.getGameInfoStore(false).updateGameInfos(p38.universe)
			end
		end
		if fFlagSduiExperienceDetailsSupport then
			if p38.ageRecommendation then
				dataHydrationModule.Game.getAgeRecommendationStore(false).updateAgeRecommendations(p38.ageRecommendation)
			end
			if p38.socialLink then
				dataHydrationModule.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(p38.socialLink)
			end
			if p38.mediaAsset then
				dataHydrationModule.MediaAsset.getMediaAssetStore(false).updateMediaAssets(p38.mediaAsset)
			end
			if p38.playability then
				dataHydrationModule.Game.getPlayabilityStore(false).updatePlayabilities(p38.playability)
			end
			if p38.universeUserFavorite then
				dataHydrationModule.Game.getFavoritesStore(false).updateItems(p38.universeUserFavorite)
			end
			if p38.universeUserVote then
				dataHydrationModule.Game.getVotesStore(false).updateUserVoteItems(p38.universeUserVote)
			end
			if p38.userProfile then
				dataHydrationModule.UserProfile.updateFromHydration(p38.userProfile)
			end
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport) and p38.gamePass then
			dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfos(p38.gamePass)
		end
		if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and p38.event then
			dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(p38.event)
		end
		if fFlagSduiMarketplaceCatalogCategorySupport and p38.marketplaceCatalogCategory then
			dataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(p38.marketplaceCatalogCategory)
		end
		if fFlagSduiMarketplaceCatalogSortSupport and p38.catalogSort then
			dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(p38.catalogSort)
		end
		if fFlagSduiSongHydrationSupport and p38.song then
			dataHydrationModule.Song.getSongInfoStore(false).updateSongs(p38.song)
		end
		if fFlagSduiAddMarketplaceEntityDataHydration then
			if p38.marketplaceAsset then
				dataHydrationModule.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(p38.marketplaceAsset)
			end
			if p38.marketplaceBundle then
				dataHydrationModule.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(p38.marketplaceBundle)
			end
			if p38.marketplaceLook then
				dataHydrationModule.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(p38.marketplaceLook)
			end
		end
		if fFlagSduiDevStoreSeeAllSupport then
			if p38.gameDeveloperProduct then
				dataHydrationModule.Game.getGameDeveloperProductStore(false).updateGameDeveloperProductInfos(p38.gameDeveloperProduct)
			end
			if p38.gameSubscription then
				dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfos(p38.gameSubscription)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p39, p40, p41, p42, p43) --[[ line: 578 ]]
		-- upvalues: t_1 (ref)
		if #p40 < 2 then
			return nil, nil
		end
		local var44 = t_1[p39]
		
		if var44 == nil then
			return nil, nil
		end
		return var44(p39, p40, p41, p42, p43)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = isClientContentType,
	getFieldValueForClientContentType = getFieldValueForClientContentType,
	calculateAgeRecommendationDerivedField = calculateAgeRecommendationDerivedField
}