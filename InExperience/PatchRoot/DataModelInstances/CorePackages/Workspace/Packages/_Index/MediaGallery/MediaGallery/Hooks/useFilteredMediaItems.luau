local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local VideoUtilsModule = require(Parent.VideoUtils)
local UseCanDevicePlayVideoPreviewFunction = VideoUtilsModule.useCanDevicePlayVideoPreview
local EdpVideoBlockingConfig = VideoUtilsModule.EdpVideoBlockingConfig
local UseIsVideoEligibleFunction = require(Parent.GameTile).useIsVideoEligible
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local IsYouTubeVideoModule = require(MediaGallery.isYouTubeVideo)
local IsValidIdentifierModule = require(MediaGallery.isValidIdentifier)
local _ = require(MediaGallery.MediaGalleryTypes)

return function(p1, p2, AppPage)
	-- upvalues: UseAppPolicyFunction (copy), UseIsVideoEligibleFunction (copy), IsValidIdentifierModule (copy), UseCanDevicePlayVideoPreviewFunction (copy), EdpVideoBlockingConfig (copy), ReactModule (copy), IsYouTubeVideoModule (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return p3.getShowVideoThumbnails()
	end)
	local UseIsVideoEligibleResult = UseIsVideoEligibleFunction(p2)
	local Inverted = not IsValidIdentifierModule(p2) or UseIsVideoEligibleResult
	local UseCanDevicePlayVideoPreviewResult = UseCanDevicePlayVideoPreviewFunction(EdpVideoBlockingConfig, p2, AppPage)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseCanDevicePlayVideoPreviewResult (copy), Inverted (copy), p1 (copy), IsValidIdentifierModule (upval), IsYouTubeVideoModule (upval), UseAppPolicyResult (copy), ReportWarningFunction (upval), LoggingProtocolModule (upval), AppPage (copy)
		local Inverted1 = UseCanDevicePlayVideoPreviewResult() and Inverted
		local Flag = false
		
		for _, value in p1 do
			if IsValidIdentifierModule(value.videoId) and not IsYouTubeVideoModule(value.assetTypeId) then
				Flag = true
				break
			end
		end
		local Inverted2 = Flag and Inverted
		local List = {}
		
		for _, value1 in p1 do
			if IsYouTubeVideoModule(value1.assetTypeId) then
				if not Inverted2 and UseAppPolicyResult then
					table.insert(List, value1)
				end
			elseif IsValidIdentifierModule(value1.videoId) then
				if Inverted1 then
					table.insert(List, value1)
				end
			elseif IsValidIdentifierModule(value1.imageId) then
				table.insert(List, value1)
			else
				ReportWarningFunction(LoggingProtocolModule.default, "MediaGallery", "Dropping non-video MediaItem with invalid imageId", {
					appPage = AppPage,
					assetTypeId = tostring(value1.assetTypeId),
					hasVideoId = tostring(IsValidIdentifierModule(value1.videoId)),
					hasVideoHash = tostring(IsValidIdentifierModule(value1.videoHash)),
					hasVideoTitle = tostring(value1.videoTitle ~= nil and value1.videoTitle ~= "")
				})
			end
		end
		return List
	end, {
		p1,
		UseAppPolicyResult,
		Inverted,
		UseCanDevicePlayVideoPreviewResult,
		AppPage
	})
end