local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local fFlagMomentsOptimisticProfilePending = require(parent.SharedFlags).FFlagMomentsOptimisticProfilePending
local tutilsModule = require(parent.tutils)
local _ = require(moments.Components.Feed.FeedTypes)
local fFlagMomentsTTSFeedPlaybackModule = require(moments.Flags.FFlagMomentsTTSFeedPlayback)
local fFlagMomentsTTSPendingPreviewPlaybackModule = require(moments.Flags.FFlagMomentsTTSPendingPreviewPlayback)
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

local _ = function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	end
	local tts = p2.tts
	
	return if tts == nil or tts.text == nil or tts.text == "" then nil else tts
end

return function(p1, p2)
	-- upvalues: getFFlagMomentsRenderPostAssetsModule (ref), fFlagMomentsOptimisticProfilePending (ref), httpService (ref), getRbxThumb (ref), thumbnailType (ref), fFlagMomentsTTSFeedPlaybackModule (ref), getMediaContents (ref), fFlagMomentsTTSPendingPreviewPlaybackModule (ref), momentsGetPostAssetStoreModule (ref), deriveMomentFromPostModule (ref), tutilsModule (ref)
	local var1 = p2 ~= nil and p2.includeLocalTts == true
	
	if p1.kind ~= "moment" then
		return nil
	end
	local var2
	local moment = p1.moment
	
	if moment == nil or moment.metadata == nil then
		return nil
	elseif getFFlagMomentsRenderPostAssetsModule() then
		local function createMediaItem(p3, p4)
			-- upvalues: fFlagMomentsOptimisticProfilePending (copy), httpService (copy), getRbxThumb (copy), thumbnailType (copy), fFlagMomentsTTSFeedPlaybackModule (copy), getMediaContents (copy), fFlagMomentsTTSPendingPreviewPlaybackModule (copy), var1 (ref)
			local var3 = if fFlagMomentsOptimisticProfilePending then p3.localContent else nil
			local assetId = p3.assetId
			local assetAccessContext = p3.metadata.assetAccessContext
			local var4 = if assetAccessContext == nil or assetAccessContext == "" then nil else httpService:UrlEncode(assetAccessContext)
			local var5 = if var3 ~= nil then if assetId > 0 then Content.fromUri(if var4 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var4}`) else nil else var3
			local edits = p3.metadata.edits
			
			if not fFlagMomentsTTSFeedPlaybackModule and edits ~= nil and edits.ttsAudios ~= nil then
				local cloned = table.clone(edits)
				cloned.ttsAudios = nil
				edits = cloned
			end
			local var6
			local var7, var8 = getMediaContents(assetId, p3.metadata.captureType, var4)
			local t = {
				momentId = p3.momentId,
				sourceKey = p4,
				content = var3 or var7,
				preloadContent = if var3 == nil then var8 else nil,
				posterContent = var5,
				captureType = p3.metadata.captureType,
				edits = edits
			}
			
			if fFlagMomentsTTSPendingPreviewPlaybackModule and fFlagMomentsTTSFeedPlaybackModule and var1 then
				local var9 = edits
				
				if var3 == nil or var9 == nil then
					var6 = nil
				else
					local tts = var9.tts
					var6 = if tts == nil or tts.text == nil or tts.text == "" then nil else tts
				end
			else
				var6 = nil
			end
			t.localTts = var6
			
			return t
		end
		
		local var3 = createMediaItem(moment, `json:{moment.assetId}`)
		var2 = if moment.postAsset ~= nil then nil else moment.postAsset.postAssetId
		
		if var2 == nil or var2 <= 0 then
			return var3
		end
		function var15.resolve(p3)
			-- upvalues: momentsGetPostAssetStoreModule (copy), var2 (ref), deriveMomentFromPostModule (copy), moment (ref), createMediaItem (ref), var3 (ref), tutilsModule (copy)
			local var4 = momentsGetPostAssetStoreModule(false).getAndFetchPostAsset(var2).data(p3)
			
			if var4 ~= nil then
				local var5 = deriveMomentFromPostModule(moment, var4)
				
				if var5 == nil then
					return var3
				end
				local var6 = createMediaItem(var5, `post:{var2}`)
				var6.cornerRadius = var3.cornerRadius
				
				if var6.content.Uri == var3.content.Uri and var6.captureType == var3.captureType and tutilsModule.deepEqual(var6.edits or {}, var3.edits or {}) then
					var6.sourceKey = var3.sourceKey
				end
				return var6
			end
		end
		
		return var3
	else
		local assetId = moment.assetId
		local var4 = if fFlagMomentsOptimisticProfilePending then moment.localContent else nil
		var2 = moment.metadata.assetAccessContext
		local var5 = if var2 == nil or var2 == "" then nil else httpService:UrlEncode(var2)
		local var6 = if var4 ~= nil then if assetId > 0 then Content.fromUri(if var5 ~= nil then getRbxThumb(thumbnailType.Asset, assetId) else `{getRbxThumb(thumbnailType.Asset, assetId)}&accessContext={var5}`) else nil else var4
		local edits = moment.metadata.edits
		
		if not fFlagMomentsTTSFeedPlaybackModule and edits ~= nil and edits.ttsAudios ~= nil then
			local cloned = table.clone(edits)
			cloned.ttsAudios = nil
			edits = cloned
		end
		local var7
		local var8, var9 = getMediaContents(assetId, moment.metadata.captureType, var5)
		local t = {
			momentId = moment.momentId,
			content = var4 or var8,
			preloadContent = if var4 == nil then var9 else nil,
			posterContent = var6,
			captureType = moment.metadata.captureType,
			edits = edits
		}
		
		if fFlagMomentsTTSPendingPreviewPlaybackModule and fFlagMomentsTTSFeedPlaybackModule and var1 then
			local var10 = edits
			
			if var4 == nil or var10 == nil then
				var7 = nil
			else
				local tts = var10.tts
				var7 = if tts == nil or tts.text == nil or tts.text == "" then nil else tts
			end
		else
			var7 = nil
		end
		t.localTts = var7
		
		return t
	end
end