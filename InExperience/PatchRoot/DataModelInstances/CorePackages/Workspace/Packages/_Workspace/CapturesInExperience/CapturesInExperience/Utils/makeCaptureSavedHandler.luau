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
local WaitForMomentsEligibilityModule = require(Parent.Thunks.WaitForMomentsEligibility)
local CaptureGenerationsModule = require(Parent.Utils.captureGenerations)
local FetchCapturesFromGalleryModule = require(Parent.Utils.fetchCapturesFromGallery)
local GetLatestCaptureStoreModule = require(Parent.Stores.GetLatestCaptureStore)
local FindMatchingCaptureModule = require(Parent.Utils.findMatchingCapture)
local GetCaptureObjectModule = require(Parent.Utils.getCaptureObject)
local PendingCaptureToastActionModule = require(Parent.Utils.pendingCaptureToastAction)
local WaitForFlashOverlayModule = require(Parent.Utils.waitForFlashOverlay)
local SharedFlagsModule = require(Parent1.SharedFlags)
local FFlagBuildExperienceInGameCaptureToChat = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat
local FFlagBuildExperienceInGameShellComposer = SharedFlagsModule.FFlagBuildExperienceInGameShellComposer
local GetMomentsCapabilitiesFunction = require(Parent1.MomentsCommon).Stores.GetMomentsCapabilities
local FFlagCapturesControlsGalleryButtonModule = require(Parent.Flags.FFlagCapturesControlsGalleryButton)
local FIntCapturesControlsGalleryThumbnailSecondsModule = require(Parent.Flags.FIntCapturesControlsGalleryThumbnailSeconds)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FFlagMomentsCaptureEndIxpEnabledModule = require(Parent.Flags.FFlagMomentsCaptureEndIxpEnabled)
local FFlagCapturesInExpMomentsEligibilityRetryModule = require(Parent.Flags.FFlagCapturesInExpMomentsEligibilityRetry)
local FFlagCapturesInExpLazyMomentsEligibilityModule = require(Parent.Flags.FFlagCapturesInExpLazyMomentsEligibility)
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
	-- upvalues: CaptureGenerationsModule (copy), ConstantsModule (copy), WaitForMomentsEligibilityModule (copy), CapturesToastTypeModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), FFlagCapturesInExpLazyMomentsEligibilityModule (copy), TriggerSourceTypeModule (copy), SocialStopwatchModule (copy), EventNamesModule (copy), RetrieveCapturesModule (copy), WaitForFlashOverlayModule (copy), FFlagCapturesControlsGalleryButtonModule (copy), GetLatestCaptureStoreModule (copy), GetCaptureObjectModule (copy), FIntCapturesControlsGalleryThumbnailSecondsModule (copy), FFlagBuildExperienceInGameCaptureToChat (copy), PendingCaptureToastActionModule (copy), FFlagBuildExperienceInGameShellComposer (copy), ToastTriggeredModule (copy), CapturesPolicyModule (copy), FFlagCreateMomentsToastModule (copy), GetMomentsCapabilitiesFunction (copy), CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), FIntMomentsInExperienceMinCaptureSecondsModule (copy), FFlagMomentsCaptureEndIxpEnabledModule (copy), FFlagCapturesInExpMomentsEligibilityRetryModule (copy), CheckMomentsEligibilityModule (copy), triggerDefaultToast (copy), FetchCapturesFromGalleryModule (copy), FindMatchingCaptureModule (copy)
	local function waitForSavedCaptureEligibility(GameId, TakeExpectedSaveResult)
		-- upvalues: CaptureGenerationsModule (upval), p1 (copy), ConstantsModule (upval), WaitForMomentsEligibilityModule (upval), CapturesToastTypeModule (upval)
		local LatestScreenshot = CaptureGenerationsModule.getLatestScreenshot()
		local StateEntry = p1:getState()[ConstantsModule.RoduxKey]
		local Toast = StateEntry.Toast
		local DispatchResult = p1:dispatch((WaitForMomentsEligibilityModule(GameId, ConstantsModule.MomentsEligibilityTimeout, TakeExpectedSaveResult)))
		
		if CaptureGenerationsModule.getLatestScreenshot() ~= LatestScreenshot then
			return false, DispatchResult
		end
		local StateEntry1 = p1:getState()[ConstantsModule.RoduxKey]
		local NoIsActive: boolean = StateEntry.IsActive and not StateEntry1.IsActive
		
		if StateEntry1.Carousel.IsOpen and not StateEntry.Carousel.IsOpen or NoIsActive then
			return false, DispatchResult
		end
		local Toast1 = StateEntry1.Toast
		
		if Toast1 == Toast or Toast1.ToastType == CapturesToastTypeModule.None or Toast1.IsDismissed then
			return true, DispatchResult
		else
			return false, DispatchResult
		end
	end
	
	return function(CaptureInfo, UserSave)
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), FFlagCapturesInExpLazyMomentsEligibilityModule (upval), TriggerSourceTypeModule (upval), CaptureGenerationsModule (upval), SocialStopwatchModule (upval), Callback (copy), EventNamesModule (upval), p1 (copy), RetrieveCapturesModule (upval), WaitForFlashOverlayModule (upval), FFlagCapturesControlsGalleryButtonModule (upval), ConstantsModule (upval), GetLatestCaptureStoreModule (upval), GetCaptureObjectModule (upval), FIntCapturesControlsGalleryThumbnailSecondsModule (upval), FFlagBuildExperienceInGameCaptureToChat (upval), PendingCaptureToastActionModule (upval), FFlagBuildExperienceInGameShellComposer (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), CapturesPolicyModule (upval), FFlagCreateMomentsToastModule (upval), GetMomentsCapabilitiesFunction (upval), CaptureServiceEnableXExperiencePostingApisEngineFeature (upval), FIntMomentsInExperienceMinCaptureSecondsModule (upval), FFlagMomentsCaptureEndIxpEnabledModule (upval), FFlagCapturesInExpMomentsEligibilityRetryModule (upval), CheckMomentsEligibilityModule (upval), triggerDefaultToast (upval), waitForSavedCaptureEligibility (copy), FetchCapturesFromGalleryModule (upval), FindMatchingCaptureModule (upval)
		local IsCaptureTypeMatch: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video
		local TakeExpectedSaveResult = if FFlagCapturesInExpLazyMomentsEligibilityModule and UserSave == TriggerSourceTypeModule.UserSave then CaptureGenerationsModule.takeExpectedSave(IsCaptureTypeMatch) else nil
		
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
			
			if FFlagBuildExperienceInGameShellComposer and CaptureObjectModule1 ~= nil and ConsumeResult ~= nil and ConsumeResult.autoActivate == true then
				ConsumeResult.onActivated(CaptureObjectModule1)
				
				return
			end
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
		local CanCreateMoments = GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false)
		
		if FFlagCreateMomentsToastModule and CaptureServiceEnableXExperiencePostingApisEngineFeature and CanCreateMoments then
			local IsCaptureTypeMatch1: boolean = CaptureObjectModule2 ~= nil and CaptureObjectModule2.CaptureType == Enum.CaptureType.Video
			local TimeLength = if IsCaptureTypeMatch1 then CaptureObjectModule2.TimeLength else nil
			v1 = CaptureObjectModule2 ~= nil and (not IsCaptureTypeMatch1 or type(TimeLength) == "number" and FIntMomentsInExperienceMinCaptureSecondsModule <= TimeLength)
		end
		if FFlagMomentsCaptureEndIxpEnabledModule and FFlagCapturesInExpMomentsEligibilityRetryModule and not FFlagCreateMomentsToastModule and not FFlagCapturesInExpLazyMomentsEligibilityModule then
			p1:dispatch((CheckMomentsEligibilityModule(game.GameId)))
		end
		if not v1 or GameId == nil then
			triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback)
			
			return
		end
		if FFlagCapturesInExpLazyMomentsEligibilityModule then
			local WaitForSavedCaptureEligibilityResult, WaitForSavedCaptureEligibilityResult2 = waitForSavedCaptureEligibility(GameId, TakeExpectedSaveResult)
			
			if not WaitForSavedCaptureEligibilityResult then return end
			if not WaitForSavedCaptureEligibilityResult2 or not GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false) then
				triggerDefaultToast(p1, EnableShareCaptureCTAResult, CaptureInfo, IsCaptureTypeMatch, Callback)
				
				return
			end
		elseif FFlagCapturesInExpMomentsEligibilityRetryModule then
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