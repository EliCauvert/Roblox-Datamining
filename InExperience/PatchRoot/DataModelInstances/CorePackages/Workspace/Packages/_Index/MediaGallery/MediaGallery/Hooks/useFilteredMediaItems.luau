local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local videoUtilsModule = require(parent.VideoUtils)
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local edpVideoBlockingConfig = videoUtilsModule.EdpVideoBlockingConfig
local useIsVideoEligible = require(parent.GameTile).useIsVideoEligible
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local loggingProtocolModule = require(parent.LoggingProtocol)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local isYouTubeVideoModule = require(mediaGallery.isYouTubeVideo)
local isValidIdentifierModule = require(mediaGallery.isValidIdentifier)
local _ = require(mediaGallery.MediaGalleryTypes)
local fFlagLuaAppMediaGalleryNilImageIdFix = require(parent.SharedFlags).FFlagLuaAppMediaGalleryNilImageIdFix

return function(p0, p1, p2)
	-- upvalues: useAppPolicy (ref), useIsVideoEligible (ref), isValidIdentifierModule (ref), useCanDevicePlayVideoPreview (ref), edpVideoBlockingConfig (ref), reactModule (ref), isYouTubeVideoModule (ref), fFlagLuaAppMediaGalleryNilImageIdFix (ref), reportWarning (ref), loggingProtocolModule (ref)
	local var6 = useAppPolicy(function(p3)
		return p3.getShowVideoThumbnails()
	end)
	local var7 = not isValidIdentifierModule(p1) or useIsVideoEligible(p1)
	local var8 = useCanDevicePlayVideoPreview(edpVideoBlockingConfig, p1, p2)
	
	return reactModule.useMemo(function()
		-- upvalues: var8 (ref), var7 (ref), p0 (ref), isValidIdentifierModule (copy), isYouTubeVideoModule (copy), var6 (ref), fFlagLuaAppMediaGalleryNilImageIdFix (copy), reportWarning (copy), loggingProtocolModule (copy), p2 (ref)
		local var7_1 = var8() and var7
		local var10 = false
		
		for i, v in p0 do
			if isValidIdentifierModule(v.videoId) and not isYouTubeVideoModule(v.assetTypeId) then
				var10 = true
				break
			end
		end
		local var7_2 = var10 and var7
		local t = {}
		
		for i_1, v_1 in p0 do
			if isYouTubeVideoModule(v_1.assetTypeId) then
				if not var7_2 and var6 then
					table.insert(t, v_1)
				end
			elseif isValidIdentifierModule(v_1.videoId) then
				if var7_1 then
					table.insert(t, v_1)
				end
			elseif fFlagLuaAppMediaGalleryNilImageIdFix and not isValidIdentifierModule(v_1.imageId) then
				reportWarning(loggingProtocolModule.default, "MediaGallery", "Dropping non-video MediaItem with invalid imageId", {
					appPage = p2,
					assetTypeId = tostring(v_1.assetTypeId),
					hasVideoId = tostring(isValidIdentifierModule(v_1.videoId)),
					hasVideoHash = tostring(isValidIdentifierModule(v_1.videoHash)),
					hasVideoTitle = tostring(v_1.videoTitle ~= nil and v_1.videoTitle ~= "")
				})
			else
				table.insert(t, v_1)
			end
		end
		return t
	end, {
		p0,
		var6,
		var7,
		var8,
		if fFlagLuaAppMediaGalleryNilImageIdFix then p2 else nil
	})
end