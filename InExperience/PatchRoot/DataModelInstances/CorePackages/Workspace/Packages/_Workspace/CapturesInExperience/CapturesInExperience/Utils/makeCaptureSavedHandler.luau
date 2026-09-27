local parent = script.Parent.Parent
local parent_1 = parent.Parent
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local retrieveCapturesModule = require(parent.Thunks.RetrieveCaptures)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local triggerSourceTypeModule = require(parent.Enums.TriggerSourceType)
local _ = require(parent.Types)
local fetchCapturesFromGalleryModule = require(parent.Utils.fetchCapturesFromGallery)
local findMatchingCaptureModule = require(parent.Utils.findMatchingCapture)
local getCaptureObjectModule = require(parent.Utils.getCaptureObject)
local pendingCaptureToastActionModule = require(parent.Utils.pendingCaptureToastAction)
local waitForFlashOverlayModule = require(parent.Utils.waitForFlashOverlay)
local fFlagBuildExperienceInGameCaptureToChat = require(parent_1.SharedFlags).FFlagBuildExperienceInGameCaptureToChat
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local fFlagEnableUpdatedCaptureControlsModule = require(parent.Flags.FFlagEnableUpdatedCaptureControls)
local captureTypeModule = require(parent.Enums.CaptureType)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local captureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

local function triggerDefaultToast(p1, p2, p3, p4, p5)
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref), eventNamesModule (ref)
	if p2 then
		p1:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureTaken, { captureInfo = p3 }))
	else
		p1:dispatch(toastTriggeredModule(capturesToastTypeModule.ViewCapture))
	end
	if p4 then
		p5(eventNamesModule.CapturesVideoShareToastViewed)
	end
	p5(eventNamesModule.CapturesShareToastViewed)
end

return function(p1, _, p2)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), triggerSourceTypeModule (ref), fFlagEnableUpdatedCaptureControlsModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), retrieveCapturesModule (ref), waitForFlashOverlayModule (ref), fFlagBuildExperienceInGameCaptureToChat (ref), pendingCaptureToastActionModule (ref), getCaptureObjectModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), capturesPolicyModule (ref), fFlagCreateMomentsToastModule (ref), captureServiceEnableXExperiencePostingApisEngineFeature (ref), triggerDefaultToast (ref), constantsModule (ref), fetchCapturesFromGalleryModule (ref), findMatchingCaptureModule (ref)
	return function(p3, p4)
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), triggerSourceTypeModule (copy), fFlagEnableUpdatedCaptureControlsModule (copy), socialStopwatchModule (copy), p2 (ref), eventNamesModule (copy), p1 (ref), retrieveCapturesModule (copy), waitForFlashOverlayModule (copy), fFlagBuildExperienceInGameCaptureToChat (copy), pendingCaptureToastActionModule (copy), getCaptureObjectModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy), capturesPolicyModule (copy), fFlagCreateMomentsToastModule (copy), captureServiceEnableXExperiencePostingApisEngineFeature (copy), triggerDefaultToast (copy), constantsModule (copy), fetchCapturesFromGalleryModule (copy), findMatchingCaptureModule (copy)
		local var1
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			var1 = p3.CaptureType == Enum.CaptureType.Video
			var1 = nil
		else
			var1 = p3.type == captureTypeModule.Video
		end
		if p4 == triggerSourceTypeModule.UserSave and (not fFlagEnableUpdatedCaptureControlsModule or not var1) then
			local var2 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureTaken)
			p2(eventNamesModule.CapturesEntrypointLatency, { statValue = if var2 then var2.timeElapsed else nil })
		end
		p1:dispatch(retrieveCapturesModule())
		waitForFlashOverlayModule(p1)
		
		if fFlagBuildExperienceInGameCaptureToChat and p4 == triggerSourceTypeModule.UserSave then
			local var3 = pendingCaptureToastActionModule.consume()
			local var4 = if var3 then getCaptureObjectModule(p3) else nil
			
			if var4 ~= nil then
				p1:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureTakenWithAction, { captureInfo = var4, toastAction = var3 }))
				
				return
			elseif p4 == triggerSourceTypeModule.PromptedShare then return end
			local var5 = capturesPolicyModule.PolicyImplementation.read()
			local var6 = if var5 then capturesPolicyModule.Mapper(var5).enableShareCaptureCTA() else false
			local var7 = getCaptureObjectModule(p3)
			local var8 = false
			local var9 = if fFlagCreateMomentsToastModule then game.GameId else nil
			
			if fFlagCreateMomentsToastModule and captureServiceEnableXExperiencePostingApisEngineFeature then
				local var10 = var7 ~= nil and var7.CaptureType == Enum.CaptureType.Video
				local var11 = if var10 then var7.TimeLength else nil
				var8 = var7 ~= nil and (if var10 then type(var11) == "number" and var11 >= 6 else not var10)
			end
			if not var8 or var9 == nil then
				triggerDefaultToast(p1, var6, p3, var1, p2)
				
				return
			elseif p1:getState()[constantsModule.RoduxKey].MomentsEligibility.byUniverseId[var9] ~= true then
				triggerDefaultToast(p1, var6, p3, var1, p2)
				
				return
			end
			p1:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureTakenWithMomentsCTA, {
				captureInfo = if fFlagCreateMomentsToastModule and var7 then findMatchingCaptureModule(fetchCapturesFromGalleryModule(), var7) or var7 else var7
			}))
			p2(eventNamesModule.CapturesCreateMomentToastViewed)
		end
	end
end