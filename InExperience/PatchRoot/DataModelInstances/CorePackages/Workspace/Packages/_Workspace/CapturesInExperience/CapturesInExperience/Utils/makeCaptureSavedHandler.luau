local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local CapturesPolicyModule = require(Parent.App.CapturesPolicy)
local CheckMomentsEligibilityModule = require(Parent.Thunks.CheckMomentsEligibility)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local RetrieveCapturesModule = require(Parent.Thunks.RetrieveCaptures)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local TriggerSourceTypeModule = require(Parent.Enums.TriggerSourceType)
local _ = require(Parent.Types)
local FetchCapturesFromGalleryModule = require(Parent.Utils.fetchCapturesFromGallery)
local GetLatestCaptureStoreModule = require(Parent.Stores.GetLatestCaptureStore)
local FindMatchingCaptureModule = require(Parent.Utils.findMatchingCapture)
local GetCaptureObjectModule = require(Parent.Utils.getCaptureObject)
local PendingCaptureToastActionModule = require(Parent.Utils.pendingCaptureToastAction)
local WaitForFlashOverlayModule = require(Parent.Utils.waitForFlashOverlay)
local SharedFlagsModule = require(Parent1.SharedFlags)
local FFlagBuildExperienceInGameCaptureToChat = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local GetMomentsCapabilitiesFunction = require(Parent1.MomentsCommon).Stores.GetMomentsCapabilities
local FFlagCapturesControlsGalleryButtonModule = require(Parent.Flags.FFlagCapturesControlsGalleryButton)
local FIntCapturesControlsGalleryThumbnailSecondsModule = require(Parent.Flags.FIntCapturesControlsGalleryThumbnailSeconds)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FFlagMomentsCaptureEndIxpEnabledModule = require(Parent.Flags.FFlagMomentsCaptureEndIxpEnabled)
local FFlagCapturesInExpMomentsEligibilityRetryModule = require(Parent.Flags.FFlagCapturesInExpMomentsEligibilityRetry)
local FIntMomentsInExperienceMinCaptureSecondsModule = require(Parent.Flags.FIntMomentsInExperienceMinCaptureSeconds)
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
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), TriggerSourceTypeModule (copy), SocialStopwatchModule (copy), EventNamesModule (copy), RetrieveCapturesModule (copy), WaitForFlashOverlayModule (copy), FFlagCapturesControlsGalleryButtonModule (copy), ConstantsModule (copy), GetLatestCaptureStoreModule (copy), GetCaptureObjectModule (copy), FIntCapturesControlsGalleryThumbnailSecondsModule (copy), FFlagBuildExperienceInGameCaptureToChat (copy), PendingCaptureToastActionModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy), CapturesPolicyModule (copy), FFlagCreateMomentsToastModule (copy), FFlagMomentsCreationFeatureGate (copy), GetMomentsCapabilitiesFunction (copy), CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), FIntMomentsInExperienceMinCaptureSecondsModule (copy), FFlagMomentsCaptureEndIxpEnabledModule (copy), FFlagCapturesInExpMomentsEligibilityRetryModule (copy), CheckMomentsEligibilityModule (copy), triggerDefaultToast (copy), FetchCapturesFromGalleryModule (copy), FindMatchingCaptureModule (copy)
	return function(CaptureInfo, UserSave)
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), TriggerSourceTypeModule (upval), SocialStopwatchModule (upval), Callback (copy), EventNamesModule (upval), p1 (copy), RetrieveCapturesModule (upval), WaitForFlashOverlayModule (upval), FFlagCapturesControlsGalleryButtonModule (upval), ConstantsModule (upval), GetLatestCaptureStoreModule (upval), GetCaptureObjectModule (upval), FIntCapturesControlsGalleryThumbnailSecondsModule (upval), FFlagBuildExperienceInGameCaptureToChat (upval), PendingCaptureToastActionModule (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), CapturesPolicyModule (upval), FFlagCreateMomentsToastModule (upval), FFlagMomentsCreationFeatureGate (upval), GetMomentsCapabilitiesFunction (upval), CaptureServiceEnableXExperiencePostingApisEngineFeature (upval), FIntMomentsInExperienceMinCaptureSecondsModule (upval), FFlagMomentsCaptureEndIxpEnabledModule (upval), FFlagCapturesInExpMomentsEligibilityRetryModule (upval), CheckMomentsEligibilityModule (upval), triggerDefaultToast (upval), FetchCapturesFromGalleryModule (upval), FindMatchingCaptureModule (upval)
		local IsCaptureTypeMatch: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video
		
		if UserSave == TriggerSourceTypeModule.UserSave and not IsCaptureTypeMatch then
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.CaptureTaken)
			Callback(EventNamesModule.CapturesEntrypointLatency, {
				statValue = if StopResult then StopResult.timeElapsed else nil
			})
		end
		p1:dispatch(RetrieveCapturesModule())
		WaitForFlashOverlayModule(p1)
		
		if FFlagCapturesControlsGalleryButtonModule and UserSave == TriggerSourceTypeModule.UserSave and not p1:getState()[ConstantsModule.RoduxKey].IsMenuOpen then
			local LatestCaptureStoreModule = GetLatestCaptureStoreModule(false)
			local CaptureObjectModule = GetCaptureObjectModule(CaptureInfo)
			LatestCaptureStoreModule.setLatestCapture(CaptureObjectModule, if typeof(CaptureInfo) == "table" then CaptureInfo.filePath else nil)
			task.delay(FIntCapturesControlsGalleryThumbnailSecondsModule, function()
				-- upvalues: LatestCaptureStoreModule (copy), CaptureObjectModule (copy)
				if LatestCaptureStoreModule.getLatestCapture(false) == CaptureObjectModule then
					LatestCaptureStoreModule.clearLatestCapture()
				end
			end)
		end
		if FFlagBuildExperienceInGameCaptureToChat and UserSave == TriggerSourceTypeModule.UserSave then
			local ConsumeResult = PendingCaptureToastActionModule.consume()
			local CaptureObjectModule1 = if ConsumeResult then GetCaptureObjectModule(CaptureInfo) else nil
			
			if CaptureObjectModule1 ~= nil then
				p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureTakenWithAction, {
					captureInfo = CaptureObjectModule1,
					toastAction = ConsumeResult
				}))
				
				return
			end
		end
		if UserSave == TriggerSourceTypeModule.PromptedShare then return end
		local ReadResult = CapturesPolicyModule.PolicyImplementation.read()
		local EnableShareCaptureCTAResult = if ReadResult then CapturesPolicyModule.Mapper(ReadResult).enableShareCaptureCTA() else false
		local CaptureObjectModule2 = GetCaptureObjectModule(CaptureInfo)
		local v1 = false
		local GameId = if FFlagCreateMomentsToastModule then game.GameId else nil
		local NoFFlagMomentsCreationFeatureGate = not FFlagMomentsCreationFeatureGate or GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false)
		
		if FFlagCreateMomentsToastModule and CaptureServiceEnableXExperiencePostingApisEngineFeature and NoFFlagMomentsCreationFeatureGate then
			local IsCaptureTypeMatch1: boolean = CaptureObjectModule2 ~= nil and CaptureObjectModule2.CaptureType == Enum.CaptureType.Video
			local TimeLength = if IsCaptureTypeMatch1 then CaptureObjectModule2.TimeLength else nil
			v1 = CaptureObjectModule2 ~= nil and (not IsCaptureTypeMatch1 or type(TimeLength) == "number" and FIntMomentsInExperienceMinCaptureSecondsModule <= TimeLength)
		end
		if FFlagMomentsCaptureEndIxpEnabledModule and FFlagCapturesInExpMomentsEligibilityRetryModule and not FFlagCreateMomentsToastModule then
			p1:dispatch((CheckMomentsEligibilityModule(game.GameId)))
		end
		if not v1 or GameId == nil then
			triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback)
			
			return
		end
		if FFlagCapturesInExpMomentsEligibilityRetryModule then
			p1:dispatch((CheckMomentsEligibilityModule(GameId)))
		end
		if p1:getState()[ConstantsModule.RoduxKey].MomentsEligibility.byUniverseId[GameId] == true then
			p1:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureTakenWithMomentsCTA, {
				captureInfo = FFlagCreateMomentsToastModule and CaptureObjectModule2 and FindMatchingCaptureModule(FetchCapturesFromGalleryModule(), CaptureObjectModule2) or CaptureObjectModule2
			}))
			Callback(EventNamesModule.CapturesCreateMomentToastViewed)
			
			return
		else
			triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback)
		end
	end
end