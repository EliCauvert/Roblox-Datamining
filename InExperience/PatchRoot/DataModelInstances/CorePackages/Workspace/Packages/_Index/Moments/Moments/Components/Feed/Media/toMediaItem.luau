local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpService = game:GetService("HttpService")
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.MomentsTypes)
local FFlagMomentsOptimisticProfilePending = require(Parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local TutilsModule = require(Parent.tutils)
local _ = require(Moments.Components.Feed.FeedTypes)
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local FFlagMomentsTTSFeedPlaybackModule = require(Moments.Flags.FFlagMomentsTTSFeedPlayback)
local FFlagMomentsTTSPendingPreviewPlaybackModule = require(Moments.Flags.FFlagMomentsTTSPendingPreviewPlayback)
local GetFFlagMomentsRenderPostAssetsModule = require(Parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local DeriveMomentFromPostModule = require(Moments.Utils.deriveMomentFromPost)
local MomentsGetPostAssetStoreModule = require(Parent.DataHydration.MomentsGetPostAssetStore)
local FFlagMomentsVideoPermissionContextFix = require(Parent.MomentsCommon).Flags.FFlagMomentsVideoPermissionContextFix
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType

local function _(p1, CaptureType, p2): string
	local AssetId: string = `rbxassetid://{p1}`
	
	return if CaptureType == Enum.CaptureType.Video and p2 ~= nil then `{AssetId}&accessContext={p2}&permissionContext=ignoreUniverse` else AssetId
end

local function getMediaContents(AssetId, CaptureType, p1)
	-- upvalues: FFlagMomentsVideoPermissionContextFix (copy)
	local AssetId1: string = `rbxassetid://{AssetId}`
	local Content1 = Content.fromUri(if CaptureType == Enum.CaptureType.Video and p1 ~= nil then `{AssetId1}&accessContext={p1}&permissionContext=ignoreUniverse` else AssetId1)
	
	if FFlagMomentsVideoPermissionContextFix and game.GameId == 0 and CaptureType == Enum.CaptureType.Video and p1 ~= nil then
		return Content.fromUri(`rbxassetid://{AssetId}&accessContext={p1}`), Content1
	else
		return Content1, nil
	end
end

local _ = function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	else
		local Tts = p2.tts
		
		return if Tts == nil or Tts.text == nil or Tts.text == "" then nil else Tts
	end
end

return function(p1, p2)
	-- upvalues: GetFFlagMomentsRenderPostAssetsModule (copy), FFlagMomentsOptimisticProfilePending (copy), FFlagMomentsServeEDPVideos (copy), HttpService (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), FFlagMomentsTTSFeedPlaybackModule (copy), getMediaContents (copy), FFlagMomentsTTSPendingPreviewPlaybackModule (copy), MomentsGetPostAssetStoreModule (copy), DeriveMomentFromPostModule (copy), TutilsModule (copy)
	local IsIncludeLocalTts: boolean = p2 ~= nil and p2.includeLocalTts == true
	
	if p1.kind ~= "moment" then
		return nil
	end
	local Moment = p1.moment
	
	if Moment == nil or Moment.metadata == nil then
		return nil
	end
	if GetFFlagMomentsRenderPostAssetsModule() then
		local function createMediaItem(Moment, SourceKey)
			-- upvalues: FFlagMomentsOptimisticProfilePending (upval), FFlagMomentsServeEDPVideos (upval), HttpService (upval), GetRbxThumbFunction (upval), ThumbnailType (upval), FFlagMomentsTTSFeedPlaybackModule (upval), getMediaContents (upval), FFlagMomentsTTSPendingPreviewPlaybackModule (upval), IsIncludeLocalTts (copy)
			local LocalContent = if FFlagMomentsOptimisticProfilePending then Moment.localContent else nil
			local AssetId: number = Moment.assetId
			local AssetAccessContext = if FFlagMomentsServeEDPVideos and Moment.entityType == "edpVideo" then nil else Moment.metadata.assetAccessContext
			local v1 = if AssetAccessContext == nil or AssetAccessContext == "" then nil else HttpService:UrlEncode(AssetAccessContext)
			local Content1 = if LocalContent == nil then if AssetId > 0 then Content.fromUri(if v1 == nil then GetRbxThumbFunction(ThumbnailType.Asset, AssetId) else `{GetRbxThumbFunction(ThumbnailType.Asset, AssetId)}&accessContext={v1}`) else nil else LocalContent
			local Edits = Moment.metadata.edits
			
			if not FFlagMomentsTTSFeedPlaybackModule and Edits ~= nil and Edits.ttsAudios ~= nil then
				local Copy = table.clone(Edits)
				Copy.ttsAudios = nil
				Edits = Copy
			end
			local MediaContents, MediaContents2 = getMediaContents(AssetId, Moment.metadata.captureType, v1)
			local config = {
				momentId = Moment.momentId,
				sourceKey = SourceKey,
				content = LocalContent or MediaContents,
				preloadContent = if LocalContent == nil then MediaContents2 else nil,
				posterContent = Content1,
				captureType = Moment.metadata.captureType,
				edits = Edits
			}
			local LocalTts = nil
			
			if FFlagMomentsTTSPendingPreviewPlaybackModule and FFlagMomentsTTSFeedPlaybackModule and IsIncludeLocalTts then
				local Edits1 = Edits
				
				if LocalContent == nil or Edits1 == nil then
					LocalTts = nil
				else
					local Tts = Edits1.tts
					LocalTts = if Tts == nil or Tts.text == nil or Tts.text == "" then nil else Tts
				end
			else
				LocalTts = nil
			end
			config.localTts = LocalTts
			
			return config
		end
		
		local MediaItem = createMediaItem(Moment, `json:{Moment.assetId}`)
		local PostAssetId = if Moment.postAsset == nil then nil else Moment.postAsset.postAssetId
		
		if PostAssetId == nil or PostAssetId <= 0 then
			return MediaItem
		else
			function MediaItem.resolve(p3)
				-- upvalues: MomentsGetPostAssetStoreModule (upval), PostAssetId (copy), DeriveMomentFromPostModule (upval), Moment (copy), createMediaItem (copy), MediaItem (copy), TutilsModule (upval)
				local DataResult = MomentsGetPostAssetStoreModule(false).getAndFetchPostAsset(PostAssetId).data(p3)
				
				if DataResult ~= nil then
					local DeriveMomentFromPostModuleResult = DeriveMomentFromPostModule(Moment, DataResult)
					
					if DeriveMomentFromPostModuleResult ~= nil then
						local MediaItem1 = createMediaItem(DeriveMomentFromPostModuleResult, `post:{PostAssetId}`)
						MediaItem1.cornerRadius = MediaItem.cornerRadius
						
						if MediaItem1.content.Uri == MediaItem.content.Uri and MediaItem1.captureType == MediaItem.captureType and TutilsModule.deepEqual(MediaItem1.edits or {}, MediaItem.edits or {}) then
							MediaItem1.sourceKey = MediaItem.sourceKey
						end
						return MediaItem1
					end
				end
				return MediaItem
			end
			
			return MediaItem
		end
	else
		local AssetId: number = Moment.assetId
		local LocalContent = if FFlagMomentsOptimisticProfilePending then Moment.localContent else nil
		local AssetAccessContext = if FFlagMomentsServeEDPVideos and Moment.entityType == "edpVideo" then nil else Moment.metadata.assetAccessContext
		local v1 = if AssetAccessContext == nil or AssetAccessContext == "" then nil else HttpService:UrlEncode(AssetAccessContext)
		local Content1 = if LocalContent == nil then if AssetId > 0 then Content.fromUri(if v1 == nil then GetRbxThumbFunction(ThumbnailType.Asset, AssetId) else `{GetRbxThumbFunction(ThumbnailType.Asset, AssetId)}&accessContext={v1}`) else nil else LocalContent
		local Edits = Moment.metadata.edits
		
		if not FFlagMomentsTTSFeedPlaybackModule and Edits ~= nil and Edits.ttsAudios ~= nil then
			local Copy = table.clone(Edits)
			Copy.ttsAudios = nil
			Edits = Copy
		end
		local MediaContents, MediaContents2 = getMediaContents(AssetId, Moment.metadata.captureType, v1)
		local config = {
			momentId = Moment.momentId,
			content = LocalContent or MediaContents,
			preloadContent = if LocalContent == nil then MediaContents2 else nil,
			posterContent = Content1,
			captureType = Moment.metadata.captureType,
			edits = Edits
		}
		local LocalTts = nil
		
		if FFlagMomentsTTSPendingPreviewPlaybackModule and FFlagMomentsTTSFeedPlaybackModule and IsIncludeLocalTts then
			local Edits1 = Edits
			
			if LocalContent == nil or Edits1 == nil then
				LocalTts = nil
			else
				local Tts = Edits1.tts
				LocalTts = if Tts == nil or Tts.text == nil or Tts.text == "" then nil else Tts
			end
		else
			LocalTts = nil
		end
		config.localTts = LocalTts
		
		return config
	end
end