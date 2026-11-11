local CorePackages = game:GetService("CorePackages")
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Url = require(CorePackages.Workspace.Packages.Http).Url
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local UseGameProductInfoSelectorFunction = require(CorePackages.Workspace.Packages.GameProductInfoRodux).useGameProductInfoSelector
local GameMediaImageType = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameMediaImageType
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local GameIconRoduxModule = require(CorePackages.Workspace.Packages.GameIconRodux)
local GameIconReducer = GameIconRoduxModule.GameIcons.GameIconReducer
local UseGameIconSelectorFunction = GameIconRoduxModule.GameIcons.useGameIconSelector
local BigGameIconReducer = GameIconRoduxModule.BigGameIcons.BigGameIconReducer
local UseGameInfosSelectorFunction = require(CorePackages.Workspace.Packages.GameInfosRodux).useGameInfosSelector
local ApiFetchGameMedia = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.ApiFetchGameMedia
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local GetFFlagRemoveVerifiedBadgeReducerModule = require(Modules.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer)
local GetFFlagLuaAppLaunchConnectorFixModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix)
local GetFFlagEnableBigGameIconInDetailsPageModule = require(Modules.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage)
local FFlagLuaAppEdpFixDefaultBanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

local function _(p1)
	-- upvalues: GameMediaImageType (copy), Url (copy)
	return {
		mediaType = GameMediaImageType.Image,
		imageId = Url:getPlaceDefaultThumbnailUrl(p1, 768, 432)
	}
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List, p1, Done)
	-- upvalues: GameMediaImageType (copy), FFlagLuaAppEdpFixDefaultBanner (copy), RetrievalStatus (copy), Url (copy)
	local v1 = nil
	
	if List then
		for _, value in pairs(List) do
			if value.assetTypeId == GameMediaImageType.Image then
				v1 = value
				break
			end
		end
	end
	return if FFlagLuaAppEdpFixDefaultBanner or v1 ~= nil then v1 elseif Done == RetrievalStatus.Done then {
		mediaType = GameMediaImageType.Image,
		imageId = Url:getPlaceDefaultThumbnailUrl(p1, 768, 432)
	} else nil
end)

return function(p2, p3)
	-- upvalues: GetFFlagEnableBigGameIconInDetailsPageModule (copy), GetFFlagLuaAppLaunchConnectorFixModule (copy), UseUiModeInfoFunction (copy), UseSelectorFunction (copy), UiMode (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), BigGameIconReducer (copy), GameIconReducer (copy), UseGameIconSelectorFunction (copy), FFlagLuaAppEdpFixDefaultBanner (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameMedia (copy), MemoizeResult (copy), UseGameInfosSelectorFunction (copy), RetrievalStatus (copy), Url (copy), GetFFlagRemoveVerifiedBadgeReducerModule (copy), VerifiedBadgesModule (copy), ApiFetchGameDetails (copy), UseGameProductInfoSelectorFunction (copy)
	local UseSelectorResult = nil
	if GetFFlagEnableBigGameIconInDetailsPageModule() and GetFFlagLuaAppLaunchConnectorFixModule() then
		local UseUiModeInfoResult = UseUiModeInfoFunction()
		UseSelectorResult = UseSelectorFunction(function(p4)
			-- upvalues: UseUiModeInfoResult (copy), UiMode (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), BigGameIconReducer (upval), p2 (copy), GameIconReducer (upval)
			if UseUiModeInfoResult and UseUiModeInfoResult.uiMode == UiMode.TenFoot then
				if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then
					local v2 = p4[BigGameIconReducer.key][p2.universeId]
					
					return if v2 == nil then {
						imageSize = "512x512",
						url = string.format("rbxthumb://type=GameIcon&id=%s&w=512&h=512", p2.universeId)
					} else v2
				else
					return p4[BigGameIconReducer.key][p2.universeId] or p4[GameIconReducer.key][p2.universeId]
				end
			elseif FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then
				local v3 = p4[GameIconReducer.key][p2.universeId]
				
				return if v3 == nil then {
					imageSize = "150x150",
					url = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", p2.universeId)
				} else v3
			else
				return p4[GameIconReducer.key][p2.universeId]
			end
		end)
	elseif FFlagLuaAppEdpBackendV2HydrateLegacyIxp or FFlagLuaAppEdpBackendV2HydrateLegacyDefault then
		local UseGameIconSelectorResult = UseGameIconSelectorFunction(p2.universeId)
		UseSelectorResult = if (FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3) and UseGameIconSelectorResult == nil then {
			imageSize = "150x150",
			url = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", p2.universeId)
		} else UseGameIconSelectorResult
	else
		UseSelectorResult = UseGameIconSelectorFunction(p2.universeId)
	end
	local UseSelectorResult1 = if FFlagLuaAppEdpFixDefaultBanner then nil else UseSelectorFunction(function(p4)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), ApiFetchExperienceDetailsPageModule (upval), p2 (copy), ApiFetchGameMedia (upval), MemoizeResult (upval)
		local MemoizeResultResult = MemoizeResult(p4.GameMedia[p2.universeId], p2.placeId, if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p4, p2.universeId) else ApiFetchGameMedia.GetFetchingStatus(p4, p2.universeId))
		
		return if MemoizeResultResult then MemoizeResultResult.imageId else nil
	end)
	local UseGameInfosSelectorResult = UseGameInfosSelectorFunction(p2.universeId)
	local UseSelectorResult2 = UseSelectorFunction(function(p4)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), p2 (copy)
		return if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then p4.GameDetailsV2[p2.universeId] else p4.GameDetails[p2.universeId]
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p4)
		-- upvalues: p2 (copy)
		return p4.GameDetailErrors[p2.universeId]
	end)
	local v2 = nil
	
	if FFlagLuaAppEdpFixDefaultBanner then
		UseSelectorResult1 = UseSelectorFunction(function(p4)
			-- upvalues: MemoizeResult (upval), p2 (copy)
			local MemoizeResultResult = MemoizeResult(p4.GameMedia[p2.universeId])
			
			return if MemoizeResultResult then MemoizeResultResult.imageId else nil
		end)
		v2 = UseSelectorFunction(function(p4)
			-- upvalues: UseSelectorResult2 (copy), UseGameInfosSelectorResult (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), ApiFetchExperienceDetailsPageModule (upval), p2 (copy), ApiFetchGameMedia (upval), UseSelectorResult1 (ref), RetrievalStatus (upval), Url (upval)
			local RootPlaceId = UseSelectorResult2 and UseSelectorResult2.rootPlaceId or (UseGameInfosSelectorResult and UseGameInfosSelectorResult.placeId or nil)
			local FetchingStatus = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p4, p2.universeId) else ApiFetchGameMedia.GetFetchingStatus(p4, p2.universeId)
			
			return if UseSelectorResult1 == nil and RootPlaceId and FetchingStatus == RetrievalStatus.Done then Url:getPlaceDefaultThumbnailUrl(RootPlaceId, 768, 432) else nil
		end)
	end
	return {
		thumbnail = UseSelectorResult,
		bannerImageId = UseSelectorResult1,
		defaultBannerUrl = if FFlagLuaAppEdpFixDefaultBanner then v2 else nil,
		gameInfo = UseGameInfosSelectorResult,
		gameDetail = UseSelectorResult2,
		gameDetailError = UseSelectorResult3,
		creatorVerified = UseSelectorFunction(function(p4)
			-- upvalues: GetFFlagRemoveVerifiedBadgeReducerModule (upval), VerifiedBadgesModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), p2 (copy)
			return if GetFFlagRemoveVerifiedBadgeReducerModule() then nil else VerifiedBadgesModule.isCreatorOfGameVerified(p4, if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then {
				shouldUseV2GameDetails = true,
				universeId = p2.universeId
			} else p2)
		end),
		gameDetailsPageDataStatus = UseSelectorFunction(function(p4)
			-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p3 (copy), ApiFetchExperienceDetailsPageModule (upval), p2 (copy), ApiFetchGameDetails (upval)
			return if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p4, p2.universeId) else ApiFetchGameDetails.GetFetchingStatus(p4, p2.universeId)
		end),
		gameProductInfo = UseGameProductInfoSelectorFunction(p2.universeId),
		socialLinks = UseSelectorFunction(function(p4)
			-- upvalues: p2 (copy)
			local GameSocialLink = p4.GameSocialLinks[p2.universeId]
			
			return if GameSocialLink then GameSocialLink.externalLinks else nil
		end),
		ageRecommendations = UseSelectorFunction(function(p4)
			-- upvalues: p2 (copy)
			return p4.AgeRecommendations[p2.universeId]
		end),
		communityLink = UseSelectorFunction(function(p4)
			-- upvalues: p2 (copy)
			return p4.CommunityLinks.ExperienceCommunityLinks[p2.universeId] or nil
		end),
		gameFollowings = UseSelectorFunction(function(p4)
			-- upvalues: p2 (copy)
			return p4.GameFollowings[p2.universeId]
		end),
		notificationsEnabled = UseSelectorFunction(function(p4)
			return p4.ExperienceNotificationsEnabled
		end)
	}
end