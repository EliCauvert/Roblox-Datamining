local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
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
local PendingCaptureToastActionModule = require(Parent.Utils.pendingCaptureToastAction)
local WaitForFlashOverlayModule = require(Parent.Utils.waitForFlashOverlay)
local SharedFlagsModule = require(Parent1.SharedFlags)
local FFlagBuildExperienceInGameCaptureToChat = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local GetMomentsCapabilitiesFunction = require(Parent1.MomentsCommon).Stores.GetMomentsCapabilities
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local CaptureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

local function triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback: (any) -> ()) --[[ Line: 38 ]]
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

return function(p1, _, Callback) --[[ Line: 60 | Named "makeCaptureSavedHandler" ]]
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), TriggerSourceTypeModule (copy), SocialStopwatchModule (copy), EventNamesModule (copy), RetrieveCapturesModule (copy), WaitForFlashOverlayModule (copy), FFlagBuildExperienceInGameCaptureToChat (copy), PendingCaptureToastActionModule (copy), GetCaptureObjectModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy), CapturesPolicyModule (copy), FFlagCreateMomentsToastModule (copy), FFlagMomentsCreationFeatureGate (copy), GetMomentsCapabilitiesFunction (copy), CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), triggerDefaultToast (copy), ConstantsModule (copy), FetchCapturesFromGalleryModule (copy), FindMatchingCaptureModule (copy)
	return function(CaptureInfo, UserSave) --[[ Line: 61 | Named "captureSavedHandler" ]]
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), TriggerSourceTypeModule (upval), SocialStopwatchModule (upval), Callback (copy), EventNamesModule (upval), p1 (copy), RetrieveCapturesModule (upval), WaitForFlashOverlayModule (upval), FFlagBuildExperienceInGameCaptureToChat (upval), PendingCaptureToastActionModule (upval), GetCaptureObjectModule (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), CapturesPolicyModule (upval), FFlagCreateMomentsToastModule (upval), FFlagMomentsCreationFeatureGate (upval), GetMomentsCapabilitiesFunction (upval), CaptureServiceEnableXExperiencePostingApisEngineFeature (upval), triggerDefaultToast (upval), ConstantsModule (upval), FetchCapturesFromGalleryModule (upval), FindMatchingCaptureModule (upval)
		local IsCaptureTypeMatch: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video
		
		if UserSave == TriggerSourceTypeModule.UserSave and not IsCaptureTypeMatch then
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureTaken)
			Callback(EventNamesModule.CapturesEntrypointLatency, {
				statValue = if StopResult then StopResult.timeElapsed else nil
			})
		end
		p1:dispatch(RetrieveCapturesModule())
		WaitForFlashOverlayModule(p1)
		
		if FFlagBuildExperienceInGameCaptureToChat and UserSave == TriggerSourceTypeModule.UserSave then
			local ConsumeResult = PendingCaptureToastActionModule.consume()
			local CaptureObjectModule = if ConsumeResult then GetCaptureObjectModule(CaptureInfo) else nil
			
			if CaptureObjectModule ~= nil then
				p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureTakenWithAction, {
					captureInfo = CaptureObjectModule,
					toastAction = ConsumeResult
				}))
				
				return
			end
		end
		if UserSave == TriggerSourceTypeModule.PromptedShare then return end
		local ReadResult = CapturesPolicyModule.PolicyImplementation.read()
		local EnableShareCaptureCTAResult = if ReadResult then CapturesPolicyModule.Mapper(ReadResult).enableShareCaptureCTA() else false
		local CaptureObjectModule = GetCaptureObjectModule(CaptureInfo)
		local v1 = false
		local GameId = if FFlagCreateMomentsToastModule then game.GameId else nil
		local NoFFlagMomentsCreationFeatureGate = not FFlagMomentsCreationFeatureGate or GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false)
		
		if FFlagCreateMomentsToastModule and CaptureServiceEnableXExperiencePostingApisEngineFeature and NoFFlagMomentsCreationFeatureGate then
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