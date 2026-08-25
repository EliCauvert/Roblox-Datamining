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
local var12 = localization.new(localizationService.RobloxLocaleId)

local function shareImage(p0, p1)
	-- upvalues: default (ref), constantsModule (ref), var12 (ref)
	if default then
		assert(default ~= nil, "ExternalContentSharingProtocol is required")
		default:shareImage({
			context = constantsModule.CapturesContext,
			image = p0,
			shareSheetTitle = var12:Format("Feature.Captures.Action.ShareYourCapture"),
			url = p1
		})
		
		return
	end
end

local function shareVideo(p2, p3)
	-- upvalues: default (ref), constantsModule (ref), var12 (ref)
	if default then
		assert(default ~= nil, "ExternalContentSharingProtocol is required")
		default:shareVideo({
			context = constantsModule.CapturesContext,
			shareSheetTitle = var12:Format("Feature.Captures.Action.ShareYourCapture"),
			url = p3,
			video = p2
		})
		
		return
	end
end

local function shareCapture(p4, p5)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureService (ref), shareVideo (ref), shareImage (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref)
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p4.CaptureTime ~= nil then
		local var16 = captureService:PreCaptureShared(p4)
		
		if p4.CaptureType == Enum.CaptureType.Video then
			shareVideo(var16, p5)
		else
			shareImage(var16, p5)
		end
		captureService:OnCaptureObjectShared(p4)
		
		return
	elseif fFlagUseRbxstorageInGalleryModule and p4.type == captureTypeModule.Video then
		shareVideo(captureService:PreVideoCaptureShared(p4.videoCapture), p5)
		captureService:OnVideoCaptureShared(p4.videoCapture)
		
		return
	end
	shareImage(p4.filePath, p5)
	captureService:OnCaptureShared(p4.filePath)
end

local function _(p6)
	-- upvalues: socialStopwatchModule (ref), fireEventModule (ref), eventNamesModule (ref)
	local var17 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
	fireEventModule(eventNamesModule.CapturesShareLatency, {
		statValue = if var17 then var17.timeElapsed else nil,
		externalShareSource = p6
	})
end

return function(p7, p8, p9)
	-- upvalues: serverTypeModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), shareCapture (ref), fireEventModule (ref), eventNamesModule (ref), socialStopwatchModule (ref), getPlaceIdFromCaptureModule (ref), linkType (ref), shareLinksNetworking (ref)
	return function(p10)
		-- upvalues: serverTypeModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p7 (ref), captureTypeModule (copy), shareCapture (copy), fireEventModule (copy), eventNamesModule (copy), p8 (ref), socialStopwatchModule (copy), getPlaceIdFromCaptureModule (copy), p9 (ref), linkType (copy), shareLinksNetworking (copy)
		local var19
		local var18 = p10:getState().ServerType == serverTypeModule.StandardServer
		
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			var19 = p7.CaptureType == Enum.CaptureType.Video
			var19 = nil
		else
			var19 = p7.type == captureTypeModule.Video
		end
		if not var18 then
			shareCapture(p7)
			fireEventModule(eventNamesModule.CapturesShareFromNonStandardServer)
			local var20 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
			fireEventModule(eventNamesModule.CapturesShareLatency, {
				statValue = if var20 then var20.timeElapsed else nil,
				externalShareSource = p8
			})
			
			return
		end
		local jobId = nil
		local var21 = if var19 then if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p7.SourcePlaceId else p7.videoCapture.SourcePlaceId else getPlaceIdFromCaptureModule(p7)
		
		if game.PlaceId == var21 then
			jobId = game.JobId
		end
		p10:dispatch(shareLinksNetworking.GenerateLink.API({
			instanceId = jobId,
			launchData = p9,
			linkType = linkType.ScreenshotInvite.rawValue(),
			placeId = var21
		})):andThen(function(p12)
			-- upvalues: shareCapture (copy), p7 (copy), p8 (copy), socialStopwatchModule (copy), fireEventModule (copy), eventNamesModule (copy)
			shareCapture(p7, p12.responseBody.shortUrl)
			local var23 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
			fireEventModule(eventNamesModule.CapturesShareLatency, {
				statValue = if var23 then var23.timeElapsed else nil,
				externalShareSource = p8
			})
		end):catch(function(p11)
			-- upvalues: fireEventModule (copy), eventNamesModule (copy), shareCapture (copy), p7 (copy), p8 (copy), socialStopwatchModule (copy)
			warn("GenerateLink failed with error:", p11)
			fireEventModule(eventNamesModule.ShareCaptureGenerateLinkFailed, { httpError = p11.HttpError })
			shareCapture(p7)
			local var22 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureShared)
			fireEventModule(eventNamesModule.CapturesShareLatency, {
				statValue = if var22 then var22.timeElapsed else nil,
				externalShareSource = p8
			})
		end)
	end
end