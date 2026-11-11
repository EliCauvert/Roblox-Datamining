local Parent = script.Parent.Parent
local SocialStopwatchModule = require(Parent.Parent.SocialStopwatch)
local CapturesPolicyModule = require(Parent.App.CapturesPolicy)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local RetrieveCapturesModule = require(Parent.Thunks.RetrieveCaptures)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local TriggerSourceTypeModule = require(Parent.Enums.TriggerSourceType)
local _ = require(Parent.Types)
local FetchCapturesFromGalleryModule = require(Parent.Utils.fetchCapturesFromGallery)
local FindMatchingCaptureModule = require(Parent.Utils.findMatchingCapture)
local GetCaptureObjectModule = require(Parent.Utils.getCaptureObject)
local WaitForFlashOverlayModule = require(Parent.Utils.waitForFlashOverlay)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FFlagEnableUpdatedCaptureControlsModule = require(Parent.Flags.FFlagEnableUpdatedCaptureControls)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local CaptureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

local function triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback: (any) -> ())
	-- upvalues: ToastTriggeredModule (copy), CapturesToastTypeModule (copy), EventNamesModule (copy)
	if EnableShareCaptureCTAResult then
		p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureTaken, { captureInfo = CaptureInfo }))
	else
		p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.ViewCapture))
	end
	if IsCaptureTypeMatch then
		Callback(EventNamesModule.CapturesVideoShareToastViewed)
	end
	Callback(EventNamesModule.CapturesShareToastViewed)
end

return function(p1, _, Callback)
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), TriggerSourceTypeModule (copy), FFlagEnableUpdatedCaptureControlsModule (copy), SocialStopwatchModule (copy), EventNamesModule (copy), RetrieveCapturesModule (copy), WaitForFlashOverlayModule (copy), CapturesPolicyModule (copy), GetCaptureObjectModule (copy), FFlagCreateMomentsToastModule (copy), CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), triggerDefaultToast (copy), ConstantsModule (copy), FetchCapturesFromGalleryModule (copy), FindMatchingCaptureModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	return function(CaptureInfo, PromptedShare)
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), TriggerSourceTypeModule (upval), FFlagEnableUpdatedCaptureControlsModule (upval), SocialStopwatchModule (upval), Callback (copy), EventNamesModule (upval), p1 (copy), RetrieveCapturesModule (upval), WaitForFlashOverlayModule (upval), CapturesPolicyModule (upval), GetCaptureObjectModule (upval), FFlagCreateMomentsToastModule (upval), CaptureServiceEnableXExperiencePostingApisEngineFeature (upval), triggerDefaultToast (upval), ConstantsModule (upval), FetchCapturesFromGalleryModule (upval), FindMatchingCaptureModule (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		local IsCaptureTypeMatch: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video
		
		if PromptedShare == TriggerSourceTypeModule.UserSave and (not FFlagEnableUpdatedCaptureControlsModule or not IsCaptureTypeMatch) then
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureTaken)
			Callback(EventNamesModule.CapturesEntrypointLatency, {
				statValue = if StopResult then StopResult.timeElapsed else nil
			})
		end
		p1:dispatch(RetrieveCapturesModule())
		WaitForFlashOverlayModule(p1)
		
		if PromptedShare == TriggerSourceTypeModule.PromptedShare then return end
		local ReadResult = CapturesPolicyModule.PolicyImplementation.read()
		local EnableShareCaptureCTAResult = if ReadResult then CapturesPolicyModule.Mapper(ReadResult).enableShareCaptureCTA() else false
		local CaptureObjectModule = GetCaptureObjectModule(CaptureInfo)
		local v1 = false
		local GameId = if FFlagCreateMomentsToastModule then game.GameId else nil
		
		if FFlagCreateMomentsToastModule and CaptureServiceEnableXExperiencePostingApisEngineFeature then
			local IsCaptureTypeMatch1: boolean = CaptureObjectModule ~= nil and CaptureObjectModule.CaptureType == Enum.CaptureType.Video
			local TimeLength = if IsCaptureTypeMatch1 then CaptureObjectModule.TimeLength else nil
			v1 = CaptureObjectModule ~= nil and (not IsCaptureTypeMatch1 or type(TimeLength) == "number" and TimeLength >= 6)
		end
		if not v1 or GameId == nil then
			triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback)
			
			return
		end
		if p1:getState()[ConstantsModule.RoduxKey].MomentsEligibility.byUniverseId[GameId] == true then
			p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureTakenWithMomentsCTA, {
				captureInfo = FFlagCreateMomentsToastModule and CaptureObjectModule and FindMatchingCaptureModule(FetchCapturesFromGalleryModule(), CaptureObjectModule) or CaptureObjectModule
			}))
			Callback(EventNamesModule.CapturesCreateMomentToastViewed)
			
			return
		else
			triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback)
		end
	end
end