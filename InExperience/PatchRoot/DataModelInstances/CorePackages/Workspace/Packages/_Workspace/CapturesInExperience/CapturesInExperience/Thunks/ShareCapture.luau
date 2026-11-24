local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CaptureService = game:GetService("CaptureService")
local LocalizationService = game:GetService("LocalizationService")
local Default = require(Parent1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local Localization = require(Parent1.RobloxAppLocales).Localization
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local ConstantsModule = require(Parent.Constants)
local ServerTypeModule = require(Parent.Enums.ServerType)
local EventNamesModule = require(Parent.Analytics.EventNames)
local _ = require(Parent.Enums.ExternalShareSourceType)
local FireEventModule = require(Parent.Analytics.FireEvent)
local GetPlaceIdFromCaptureModule = require(Parent.Utils.getPlaceIdFromCapture)
local NetworkingModule = require(Parent.App.Networking)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local FFlagCapturesInExpMomentsToastShareButtonModule = require(Parent.Flags.FFlagCapturesInExpMomentsToastShareButton)

if FFlagCapturesInExpMomentsToastShareButtonModule then
	CaptureService = require(Parent.Services.CaptureService)
end
local ShareLinksNetworking = NetworkingModule.ShareLinksNetworking
local LinkType = NetworkingModule.ShareLinksRodux.Enums.LinkType
local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)

local function shareImage(PreCaptureSharedResult, Url)
	-- upvalues: Default (copy), ConstantsModule (copy), NewLocalization (copy)
	if Default then
		assert(Default ~= nil, "ExternalContentSharingProtocol is required")
		Default:shareImage({
			context = ConstantsModule.CapturesContext,
			image = PreCaptureSharedResult,
			shareSheetTitle = NewLocalization:Format("Feature.Captures.Action.ShareYourCapture"),
			url = Url
		})
		
		return
	end
end

local function shareVideo(PreVideoCaptureSharedResult, Url)
	-- upvalues: Default (copy), ConstantsModule (copy), NewLocalization (copy)
	if Default then
		assert(Default ~= nil, "ExternalContentSharingProtocol is required")
		Default:shareVideo({
			context = ConstantsModule.CapturesContext,
			shareSheetTitle = NewLocalization:Format("Feature.Captures.Action.ShareYourCapture"),
			url = Url,
			video = PreVideoCaptureSharedResult
		})
		
		return
	end
end

local function shareCapture(Capture, Url)
	-- upvalues: FFlagCapturesInExpMomentsToastShareButtonModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureService (ref), shareVideo (copy), shareImage (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy)
	if not FFlagCapturesInExpMomentsToastShareButtonModule or FFlagEnableCapturesGalleryRetrievalCoreScriptModule or typeof(Capture) == "table" then
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule and Capture.CaptureTime ~= nil then
			local PreCaptureSharedResult = CaptureService:PreCaptureShared(Capture)
			
			if Capture.CaptureType == Enum.CaptureType.Video then
				shareVideo(PreCaptureSharedResult, Url)
			else
				shareImage(PreCaptureSharedResult, Url)
			end
			CaptureService:OnCaptureObjectShared(Capture)
			
			return
		elseif FFlagUseRbxstorageInGalleryModule and Capture.type == CaptureTypeModule.Video then
			shareVideo(CaptureService:PreVideoCaptureShared(Capture.videoCapture), Url)
			CaptureService:OnVideoCaptureShared(Capture.videoCapture)
			
			return
		else
			shareImage(Capture.filePath, Url)
			CaptureService:OnCaptureShared(Capture.filePath)
			
			return
		end
	elseif Capture.CaptureType == Enum.CaptureType.Video then
		shareVideo(CaptureService:PreVideoCaptureShared(Capture), Url)
		CaptureService:OnVideoCaptureShared(Capture)
		
		return
	else
		local PreCaptureSharedResult = CaptureService:PreCaptureShared(Capture)
		shareImage(PreCaptureSharedResult, Url)
		CaptureService:OnCaptureShared(PreCaptureSharedResult)
	end
end

local function _(ExternalShareSource)
	-- upvalues: SocialStopwatchModule (copy), FireEventModule (copy), EventNamesModule (copy)
	local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureShared)
	FireEventModule(EventNamesModule.CapturesShareLatency, {
		statValue = if StopResult then StopResult.timeElapsed else nil,
		externalShareSource = ExternalShareSource
	})
end

return function(Capture, ExternalShareSource, LaunchData)
	-- upvalues: ServerTypeModule (copy), FFlagCapturesInExpMomentsToastShareButtonModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), shareCapture (copy), FireEventModule (copy), EventNamesModule (copy), SocialStopwatchModule (copy), GetPlaceIdFromCaptureModule (copy), LinkType (copy), ShareLinksNetworking (copy)
	return function(p1)
		-- upvalues: ServerTypeModule (upval), FFlagCapturesInExpMomentsToastShareButtonModule (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), Capture (copy), CaptureTypeModule (upval), shareCapture (upval), FireEventModule (upval), EventNamesModule (upval), ExternalShareSource (copy), SocialStopwatchModule (upval), GetPlaceIdFromCaptureModule (upval), LaunchData (copy), LinkType (upval), ShareLinksNetworking (upval)
		local IsNotTable: boolean = FFlagCapturesInExpMomentsToastShareButtonModule and (not FFlagEnableCapturesGalleryRetrievalCoreScriptModule and typeof(Capture) ~= "table")
		local IsCaptureTypeMatch: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule or IsNotTable then Capture.CaptureType == Enum.CaptureType.Video else Capture.type == CaptureTypeModule.Video
		
		if p1:getState().ServerType ~= ServerTypeModule.StandardServer then
			shareCapture(Capture)
			FireEventModule(EventNamesModule.CapturesShareFromNonStandardServer)
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureShared)
			FireEventModule(EventNamesModule.CapturesShareLatency, {
				statValue = if StopResult then StopResult.timeElapsed else nil,
				externalShareSource = ExternalShareSource
			})
			
			return
		end
		local JobId = nil
		local SourcePlaceId = if IsNotTable then Capture.SourcePlaceId elseif IsCaptureTypeMatch then if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then Capture.SourcePlaceId else Capture.videoCapture.SourcePlaceId else GetPlaceIdFromCaptureModule(Capture)
		
		if game.PlaceId == SourcePlaceId then
			JobId = game.JobId
		end
		p1:dispatch(ShareLinksNetworking.GenerateLink.API({
			instanceId = JobId,
			launchData = LaunchData,
			linkType = LinkType.ScreenshotInvite.rawValue(),
			placeId = SourcePlaceId
		})):andThen(function(Result)
			-- upvalues: shareCapture (upval), Capture (upval), ExternalShareSource (upval), SocialStopwatchModule (upval), FireEventModule (upval), EventNamesModule (upval)
			shareCapture(Capture, Result.responseBody.shortUrl)
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureShared)
			FireEventModule(EventNamesModule.CapturesShareLatency, {
				statValue = if StopResult then StopResult.timeElapsed else nil,
				externalShareSource = ExternalShareSource
			})
		end):catch(function(Err)
			-- upvalues: FireEventModule (upval), EventNamesModule (upval), shareCapture (upval), Capture (upval), ExternalShareSource (upval), SocialStopwatchModule (upval)
			warn("GenerateLink failed with error:", Err)
			FireEventModule(EventNamesModule.ShareCaptureGenerateLinkFailed, { httpError = Err.HttpError })
			shareCapture(Capture)
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureShared)
			FireEventModule(EventNamesModule.CapturesShareLatency, {
				statValue = if StopResult then StopResult.timeElapsed else nil,
				externalShareSource = ExternalShareSource
			})
		end)
	end
end