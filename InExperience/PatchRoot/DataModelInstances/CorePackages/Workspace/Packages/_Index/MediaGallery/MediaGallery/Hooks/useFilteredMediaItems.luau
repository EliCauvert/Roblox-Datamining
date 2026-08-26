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

return function(p1, p2, p3)
	-- upvalues: useAppPolicy (ref), useIsVideoEligible (ref), isValidIdentifierModule (ref), useCanDevicePlayVideoPreview (ref), edpVideoBlockingConfig (ref), reactModule (ref), isYouTubeVideoModule (ref), fFlagLuaAppMediaGalleryNilImageIdFix (ref), reportWarning (ref), loggingProtocolModule (ref)
	local var1 = useAppPolicy(function(p4)
		return p4.getShowVideoThumbnails()
	end)
	local var2 = not isValidIdentifierModule(p2) or useIsVideoEligible(p2)
	local var3 = useCanDevicePlayVideoPreview(edpVideoBlockingConfig, p2, p3)
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref), p1 (ref), isValidIdentifierModule (copy), isYouTubeVideoModule (copy), var1 (ref), fFlagLuaAppMediaGalleryNilImageIdFix (copy), reportWarning (copy), loggingProtocolModule (copy), p3 (ref)
		local var4 = var3() and var2
		local var5 = false
		
		for i, v in p1 do
			if isValidIdentifierModule(v.videoId) and not isYouTubeVideoModule(v.assetTypeId) then
				var5 = true
				break
			end
		end
		local var6 = var5 and var2
		local t = {}
		
		for i_1, v_1 in p1 do
			if isYouTubeVideoModule(v_1.assetTypeId) then
				if not var6 and var1 then
					table.insert(t, v_1)
				end
			elseif isValidIdentifierModule(v_1.videoId) then
				if var4 then
					table.insert(t, v_1)
				end
			elseif fFlagLuaAppMediaGalleryNilImageIdFix and not isValidIdentifierModule(v_1.imageId) then
				reportWarning(loggingProtocolModule.default, "MediaGallery", "Dropping non-video MediaItem with invalid imageId", {
					appPage = p3,
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
		p1,
		var1,
		var2,
		var3,
		if fFlagLuaAppMediaGalleryNilImageIdFix then p3 else nil
	})
end