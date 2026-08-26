local parent = script.Parent.Parent
local parent_1 = parent.Parent
local captureService = game:GetService("CaptureService")
local localizationService = game:GetService("LocalizationService")
local default = require(parent_1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local localization = require(parent_1.RobloxAppLocales).Localization
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local captureTypeModule = require(parent.Enums.CaptureType)
local constantsModule = require(parent.Constants)
local serverTypeModule = require(parent.Enums.ServerType)
local eventNamesModule = require(parent.Analytics.EventNames)
local _ = require(parent.Enums.ExternalShareSourceType)
local fireEventModule = require(parent.Analytics.FireEvent)
local getPlaceIdFromCaptureModule = require(parent.Utils.getPlaceIdFromCapture)
local networkingModule = require(parent.App.Networking)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local shareLinksNetworking = networkingModule.ShareLinksNetworking
local linkType = networkingModule.ShareLinksRodux.Enums.LinkType
local var1 = localization.new(localizationService.RobloxLocaleId)

local function shareImage(p1, p2)
	-- upvalues: default (ref), constantsModule (ref), var1 (ref)
	if default then
		assert(default ~= nil, "ExternalContentSharingProtocol is required")
		default:shareImage({
			context = constantsModule.CapturesContext,
			image = p1,
			shareSheetTitle = var1:Format("Feature.Captures.Action.ShareYourCapture"),
			url = p2
		})
		
		return
	end
end

local function shareVideo(p1, p2)
	-- upvalues: default (ref), constantsModule (ref), var1 (ref)
	if default then
		assert(default ~= nil, "ExternalContentSharingProtocol is required")
		default:shareVideo({
			context = constantsModule.CapturesContext,
			shareSheetTitle = var1:Format("Feature.Captures.Action.ShareYourCapture"),
			url = p2,
			video = p1
		})
		
		return
	end
end

local function shareCapture(p1, p2)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureService (ref), shareVideo (ref), shareImage (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref)
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p1.CaptureTime ~= nil then
		local var2 = captureService:PreCaptureShared(p1)
		
		if p1.CaptureType == Enum.CaptureType.Video then
			shareVideo(var2, p2)
		else
			shareImage(var2, p2)
		end
		captureService:OnCaptureObjectShared(p1)
		
		return
	elseif fFlagUseRbxstorageInGalleryModule and p1.type == captureTypeModule.Video then
		shareVideo(captureService:PreVideoCaptureShared(p1.videoCapture), p2)
		captureService:OnVideoCaptureShared(p1.videoCapture)
		
		return
	end
	shareImage(p1.filePath, p2)
	captureService:OnCaptureShared(p1.filePath)
end

local function _(p1)
	-- upvalues: socialStopwatchModule (ref), fireEventModule (ref), eventNamesModule (ref)
	local var2 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
	fireEventModule(eventNamesModule.CapturesShareLatency, {
		statValue = if var2 then var2.timeElapsed else nil,
		externalShareSource = p1
	})
end

return function(p1, p2, p3)
	-- upvalues: serverTypeModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), shareCapture (ref), fireEventModule (ref), eventNamesModule (ref), socialStopwatchModule (ref), getPlaceIdFromCaptureModule (ref), linkType (ref), shareLinksNetworking (ref)
	return function(p4)
		-- upvalues: serverTypeModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p1 (ref), captureTypeModule (copy), shareCapture (copy), fireEventModule (copy), eventNamesModule (copy), p2 (ref), socialStopwatchModule (copy), getPlaceIdFromCaptureModule (copy), p3 (ref), linkType (copy), shareLinksNetworking (copy)
		local var2
		local var3 = p4:getState().ServerType == serverTypeModule.StandardServer
		
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			var2 = p1.CaptureType == Enum.CaptureType.Video
			var2 = nil
		else
			var2 = p1.type == captureTypeModule.Video
		end
		if not var3 then
			shareCapture(p1)
			fireEventModule(eventNamesModule.CapturesShareFromNonStandardServer)
			local var4 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
			fireEventModule(eventNamesModule.CapturesShareLatency, {
				statValue = if var4 then var4.timeElapsed else nil,
				externalShareSource = p2
			})
			
			return
		end
		local jobId = nil
		local var5 = if var2 then if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p1.SourcePlaceId else p1.videoCapture.SourcePlaceId else getPlaceIdFromCaptureModule(p1)
		
		if game.PlaceId == var5 then
			jobId = game.JobId
		end
		p4:dispatch(shareLinksNetworking.GenerateLink.API({
			instanceId = jobId,
			launchData = p3,
			linkType = linkType.ScreenshotInvite.rawValue(),
			placeId = var5
		})):andThen(function(p5)
			-- upvalues: shareCapture (copy), p1 (copy), p2 (copy), socialStopwatchModule (copy), fireEventModule (copy), eventNamesModule (copy)
			shareCapture(p1, p5.responseBody.shortUrl)
			local var6 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
			fireEventModule(eventNamesModule.CapturesShareLatency, {
				statValue = if var6 then var6.timeElapsed else nil,
				externalShareSource = p2
			})
		end):catch(function(p5)
			-- upvalues: fireEventModule (copy), eventNamesModule (copy), shareCapture (copy), p1 (copy), p2 (copy), socialStopwatchModule (copy)
			warn("GenerateLink failed with error:", p5)
			fireEventModule(eventNamesModule.ShareCaptureGenerateLinkFailed, { httpError = p5.HttpError })
			shareCapture(p1)
			local var6 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
			fireEventModule(eventNamesModule.CapturesShareLatency, {
				statValue = if var6 then var6.timeElapsed else nil,
				externalShareSource = p2
			})
		end)
	end
end