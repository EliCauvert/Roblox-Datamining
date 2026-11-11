local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ApiFetchGameMedia = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.ApiFetchGameMedia
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local FetchGamePlayabilityAndProductInfo = require(CorePackages.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local GameMediaImageType = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameMediaImageType
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local Url = require(CorePackages.Workspace.Packages.Http).Url
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UseIsVideoEligibleFunction = require(CorePackages.Workspace.Packages.GameTile).useIsVideoEligible
local UseCanDevicePlayVideoPreviewFunction = require(CorePackages.Workspace.Packages.VideoUtils).useCanDevicePlayVideoPreview
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ApiFetchExperienceDetailsPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppShareEdpVideoBlockingConfig = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppShareEdpVideoBlockingConfig
local LuaAppEdpVideoManufacturerDeny2 = nil
local LuaAppEdpVideoDeviceDeny = nil
local LuaAppEdpVideoMaxMemoryDeny = nil
local LuaAppEdpVideoMaxMemoryThresholdMb = nil
local LuaAppEdpVideoAvailableRamDeny = nil
local LuaAppEdpVideoAvailableRamThresholdMb = nil
local LuaAppEdpVideoDevicePipeDenyList = nil
local LuaAppEdpVideoManufacturerPipeDenyList = nil

if not FFlagLuaAppShareEdpVideoBlockingConfig then
	LuaAppEdpVideoManufacturerDeny2 = game:DefineFastFlag("LuaAppEdpVideoManufacturerDeny2", false)
	LuaAppEdpVideoDeviceDeny = game:DefineFastFlag("LuaAppEdpVideoDeviceDeny", false)
	LuaAppEdpVideoMaxMemoryDeny = game:DefineFastFlag("LuaAppEdpVideoMaxMemoryDeny", false)
	LuaAppEdpVideoMaxMemoryThresholdMb = game:DefineFastInt("LuaAppEdpVideoMaxMemoryThresholdMb", -1)
	LuaAppEdpVideoAvailableRamDeny = game:DefineFastFlag("LuaAppEdpVideoAvailableRamDeny", false)
	LuaAppEdpVideoAvailableRamThresholdMb = game:DefineFastInt("LuaAppEdpVideoAvailableRamThresholdMb", -1)
	LuaAppEdpVideoDevicePipeDenyList = game:DefineFastString("LuaAppEdpVideoDevicePipeDenyList", "")
	LuaAppEdpVideoManufacturerPipeDenyList = game:DefineFastString("LuaAppEdpVideoManufacturerPipeDenyList", "")
end
local EdpVideoBlockingConfig = nil
EdpVideoBlockingConfig = if FFlagLuaAppShareEdpVideoBlockingConfig then require(CorePackages.Workspace.Packages.VideoUtils).EdpVideoBlockingConfig else {
	enableManufacturerDeny = LuaAppEdpVideoManufacturerDeny2,
	enableDeviceDeny = LuaAppEdpVideoDeviceDeny,
	enableMaxMemoryDeny = LuaAppEdpVideoMaxMemoryDeny,
	enableAvailableRamDeny = LuaAppEdpVideoAvailableRamDeny,
	manufacturerDenyList = LuaAppEdpVideoManufacturerPipeDenyList,
	deviceDenyList = LuaAppEdpVideoDevicePipeDenyList,
	maxMemoryThresholdMb = LuaAppEdpVideoMaxMemoryThresholdMb,
	availableRamThresholdMb = LuaAppEdpVideoAvailableRamThresholdMb
}

local function _(p1)
	-- upvalues: GameMediaImageType (copy), Url (copy)
	return {
		mediaType = GameMediaImageType.Image,
		imageId = Url:getPlaceDefaultThumbnailUrl(p1, 640, 360)
	}
end

local function processedMediaEntry(p1, p2, p3)
	-- upvalues: GameMediaImageType (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy)
	local AssetTypeId = p1.assetTypeId
	local Text = nil
	
	if AssetTypeId == GameMediaImageType.YouTubeVideo then
		if not p2 then
			return nil
		end
		Text = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", p1.youTubeVideoHash)
	else
		Text = "http://www.roblox.com/asset/?id=" .. tostring(p1.imageId)
	end
	local AssetId = if FFlagLuaAppEdpMediaGalleryVideoPreview and p3 and (AssetTypeId == GameMediaImageType.Video or AssetTypeId == GameMediaImageType.GamePreviewVideo) and p1.videoId then `rbxassetid://{p1.videoId}` else nil
	
	return {
		mediaType = p1.assetTypeId,
		imageId = Text,
		youTubeVideoHash = p1.youTubeVideoHash,
		youTubeVideoTitle = p1.youTubeVideoTitle,
		videoId = if FFlagLuaAppEdpMediaGalleryVideoPreview and p3 then AssetId else nil
	}
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), UseAppPolicyFunction (copy), UseSelectorFunction (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameInfosReducer (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameMedia (copy), FetchGamePlayabilityAndProductInfo (copy), UseIsVideoEligibleFunction (copy), UseCanDevicePlayVideoPreviewFunction (copy), EdpVideoBlockingConfig (ref), AppPage (copy), ReactModule (copy), RetrievalStatus (copy), GameMediaImageType (copy), Url (copy), processedMediaEntry (copy), ArgCheckModule (copy)
	local NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp = if FFlagLuaAppEdpMediaGalleryVideoPreview then not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp or p4 else nil
	local UseAppPolicyResult = UseAppPolicyFunction(function(p6)
		return p6.getShowVideoThumbnails()
	end)
	local UseSelectorResult = if FFlagLuaAppEdpMediaGalleryVideoPreview then nil else UseSelectorFunction(function(p6)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p5 (copy), p1 (copy), GameInfosReducer (upval)
		local GameDetailsVEntry = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5 then p6.GameDetailsV2[p1] else p6.GameDetails[p1]
		local PersonalizationEntry = p6.Personalization[GameInfosReducer.key][p1]
		
		return GameDetailsVEntry and GameDetailsVEntry.rootPlaceId or PersonalizationEntry and PersonalizationEntry.placeId
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p6)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), p5 (copy), ApiFetchExperienceDetailsPageModule (upval), p1 (copy), ApiFetchGameMedia (upval)
		return if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p5 then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p6, p1) else ApiFetchGameMedia.GetFetchingStatus(p6, p1)
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p6)
		-- upvalues: p1 (copy)
		return p6.GameMedia[p1]
	end)
	local Done = nil
	local v1 = nil
	
	if FFlagLuaAppEdpMediaGalleryVideoPreview then
		Done = UseSelectorFunction(function(p6)
			-- upvalues: FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
			return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p6, p1)
		end)
		v1 = UseIsVideoEligibleFunction(p1)
	end
	local UseCanDevicePlayVideoPreviewResult = UseCanDevicePlayVideoPreviewFunction(EdpVideoBlockingConfig, p1, AppPage.ExperienceDetail)
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult2 (copy), UseSelectorResult1 (copy), RetrievalStatus (upval), FFlagLuaAppEdpMediaGalleryVideoPreview (upval), p2 (copy), UseSelectorResult (copy), GameMediaImageType (upval), Url (upval), NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), processedMediaEntry (upval), UseAppPolicyResult (copy), ArgCheckModule (upval), Done (ref), v1 (ref), UseCanDevicePlayVideoPreviewResult (copy), p3 (copy)
		if not UseSelectorResult2 then
			return if UseSelectorResult1 == RetrievalStatus.Done then {
				[1] = {
					mediaType = GameMediaImageType.Image,
					imageId = Url:getPlaceDefaultThumbnailUrl(if FFlagLuaAppEdpMediaGalleryVideoPreview then p2 else UseSelectorResult, 640, 360)
				}
			} else {}
		end
		local List = {}
		
		if FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp then
			local Flag: boolean? = nil
			
			for _, value in ipairs(UseSelectorResult2) do
				if value.assetTypeId == GameMediaImageType.Video or value.assetTypeId == GameMediaImageType.GamePreviewVideo then
					Flag = true
					break
				end
			end
			local Flag1: boolean? = nil
			
			for _, value1 in ipairs(UseSelectorResult2) do
				local ProcessedMediaEntryResult = processedMediaEntry(value1, UseAppPolicyResult, true)
				
				if ProcessedMediaEntryResult then
					if ProcessedMediaEntryResult.mediaType == GameMediaImageType.Video or ProcessedMediaEntryResult.mediaType == GameMediaImageType.GamePreviewVideo then
						ArgCheckModule.assert(Flag)
						
						if Done == RetrievalStatus.Done and v1 and UseCanDevicePlayVideoPreviewResult() then
							ArgCheckModule.assert(not Flag1)
							table.insert(List, 1, ProcessedMediaEntryResult)
							Flag1 = true
						end
					elseif ProcessedMediaEntryResult.mediaType == GameMediaImageType.YouTubeVideo then
						if not Flag or Done == RetrievalStatus.Done and not v1 then
							if p3 then
								table.insert(List, 1, ProcessedMediaEntryResult)
							else
								table.insert(List, ProcessedMediaEntryResult)
							end
						end
					elseif ProcessedMediaEntryResult.mediaType == GameMediaImageType.Image then
						table.insert(List, ProcessedMediaEntryResult)
					else
						warn("Unknown media type: " .. tostring(ProcessedMediaEntryResult.mediaType))
					end
				end
			end
		else
			for _, value2 in ipairs(UseSelectorResult2) do
				local ProcessedMediaEntryResult = processedMediaEntry(value2, UseAppPolicyResult)
				
				if ProcessedMediaEntryResult then
					if ProcessedMediaEntryResult.mediaType == GameMediaImageType.YouTubeVideo then
						if p3 then
							table.insert(List, 1, ProcessedMediaEntryResult)
						else
							table.insert(List, ProcessedMediaEntryResult)
						end
					elseif ProcessedMediaEntryResult.mediaType == GameMediaImageType.Image then
						table.insert(List, ProcessedMediaEntryResult)
					else
						warn("Unknown media type: " .. tostring(ProcessedMediaEntryResult.mediaType))
					end
				end
			end
		end
		return { unpack(List, 1, 10) }
	end, {
		UseAppPolicyResult, p3,
		if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p4 else nil,
		if FFlagLuaAppEdpMediaGalleryVideoPreview then NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp else nil,
		p1, if FFlagLuaAppEdpMediaGalleryVideoPreview then p2 else UseSelectorResult,
		UseSelectorResult1, UseSelectorResult2,
		if FFlagLuaAppEdpMediaGalleryVideoPreview then Done else nil,
		if FFlagLuaAppEdpMediaGalleryVideoPreview then v1 else nil,
		UseCanDevicePlayVideoPreviewResult
	}))
end