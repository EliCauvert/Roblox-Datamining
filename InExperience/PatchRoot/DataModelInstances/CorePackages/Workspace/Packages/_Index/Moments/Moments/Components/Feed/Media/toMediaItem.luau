local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local fFlagMomentsOptimisticProfilePending = require(parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local tutilsModule = require(parent.tutils)
local _ = require(moments.Components.Feed.FeedTypes)
local fFlagMomentsTTSFeedPlaybackModule = require(moments.Flags.FFlagMomentsTTSFeedPlayback)
local getFFlagMomentsRenderPostAssetsModule = require(parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local deriveMomentFromPostModule = require(moments.Utils.deriveMomentFromPost)
local momentsGetPostAssetStoreModule = require(parent.DataHydration.MomentsGetPostAssetStore)
local fFlagMomentsVideoPermissionContextFix = momentsCommonModule.Flags.FFlagMomentsVideoPermissionContextFix
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType

local function _(p1, p2, p3)
	local var1 = `rbxassetid://{p1}`
	
	return if p2 == Enum.CaptureType.Video and p3 ~= nil then `{var1}&accessContext={p3}&permissionContext=ignoreUniverse` else var1
end

local function getMediaContents(p1, p2, p3)
	-- upvalues: fFlagMomentsVideoPermissionContextFix (ref)
	local fromUri = Content.fromUri
	local var1 = `rbxassetid://{p1}`
	fromUri = fromUri(if p2 == Enum.CaptureType.Video and p3 ~= nil then `{var1}&accessContext={p3}&permissionContext=ignoreUniverse` else var1)
	
	if fFlagMomentsVideoPermissionContextFix and game.GameId == 0 and (p2 == Enum.CaptureType.Video and p3 ~= nil) then
		return Content.fromUri(`rbxassetid://{p1}&accessContext={p3}`), fromUri
	end
	return fromUri, nil
end

return function(p1)
	-- upvalues: getFFlagMomentsRenderPostAssetsModule (ref), fFlagMomentsOptimisticProfilePending (ref), httpService (ref), getRbxThumb (ref), thumbnailType (ref), fFlagMomentsTTSFeedPlaybackModule (ref), getMediaContents (ref), momentsGetPostAssetStoreModule (ref), deriveMomentFromPostModule (ref), tutilsModule (ref)
	if p1.kind ~= "moment" then
		return nil
	end
	local var1
	local moment = p1.moment
	
	if moment == nil or moment.metadata == nil then
		return nil
	elseif getFFlagMomentsRenderPostAssetsModule() then
		local function createMediaItem(p2, p3)
			-- upvalues: fFlagMomentsOptimisticProfilePending (copy), httpService (copy), getRbxThumb (copy), thumbnailType (copy), fFlagMomentsTTSFeedPlaybackModule (copy), getMediaContents (copy)
			local var2 = if fFlagMomentsOptimisticProfilePending then p2.localContent else nil
			local assetId = p2.assetId
			local assetAccessContext = p2.metadata.assetAccessContext
			local var3 = if assetAccessContext == nil or assetAccessContext == "" then nil else httpService:UrlEncode(assetAccessContext)
			local var4 = if var2 ~= nil then if assetId > 0 then Content.fromUri(if var3 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var3}`) else nil else var2
			local edits = p2.metadata.edits
			
			if not fFlagMomentsTTSFeedPlaybackModule and edits ~= nil and edits.ttsAudios ~= nil then
				local cloned = table.clone(edits)
				cloned.ttsAudios = nil
				edits = cloned
			end
			local var5, var6 = getMediaContents(assetId, p2.metadata.captureType, var3)
			
			return {
				momentId = p2.momentId,
				sourceKey = p3,
				content = var2 or var5,
				preloadContent = if var2 == nil then var6 else nil,
				posterContent = var4,
				captureType = p2.metadata.captureType,
				edits = edits
			}
		end
		
		local var2 = createMediaItem(moment, `json:{moment.assetId}`)
		var1 = if moment.postAsset ~= nil then nil else moment.postAsset.postAssetId
		
		if var1 == nil or var1 <= 0 then
			return var2
		end
		function var13.resolve(p2)
			-- upvalues: momentsGetPostAssetStoreModule (copy), var1 (ref), deriveMomentFromPostModule (copy), moment (ref), createMediaItem (ref), var2 (ref), tutilsModule (copy)
			local var3 = momentsGetPostAssetStoreModule(false).getAndFetchPostAsset(var1).data(p2)
			
			if var3 ~= nil then
				local var4 = deriveMomentFromPostModule(moment, var3)
				
				if var4 == nil then
					return var2
				end
				local var5 = createMediaItem(var4, `post:{var1}`)
				var5.cornerRadius = var2.cornerRadius
				
				if var5.content.Uri == var2.content.Uri and var5.captureType == var2.captureType and tutilsModule.deepEqual(var5.edits or {}, var2.edits or {}) then
					var5.sourceKey = var2.sourceKey
				end
				return var5
			end
		end
		
		return var2
	else
		local assetId = moment.assetId
		local var3 = if fFlagMomentsOptimisticProfilePending then moment.localContent else nil
		var1 = moment.metadata.assetAccessContext
		local var4 = if var1 == nil or var1 == "" then nil else httpService:UrlEncode(var1)
		local var5 = if var3 ~= nil then if assetId > 0 then Content.fromUri(if var4 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var4}`) else nil else var3
		local edits = moment.metadata.edits
		
		if not fFlagMomentsTTSFeedPlaybackModule and edits ~= nil and edits.ttsAudios ~= nil then
			local cloned = table.clone(edits)
			cloned.ttsAudios = nil
			edits = cloned
		end
		local var6, var7 = getMediaContents(assetId, moment.metadata.captureType, var4)
		
		return {
			momentId = moment.momentId,
			content = var3 or var6,
			preloadContent = if var3 == nil then var7 else nil,
			posterContent = var5,
			captureType = moment.metadata.captureType,
			edits = edits
		}
	end
end