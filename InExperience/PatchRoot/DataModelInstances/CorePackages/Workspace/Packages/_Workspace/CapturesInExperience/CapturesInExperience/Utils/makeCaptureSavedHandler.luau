local parent = script.Parent.Parent
local socialStopwatchModule = require(parent.Parent.SocialStopwatch)
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
local waitForFlashOverlayModule = require(parent.Utils.waitForFlashOverlay)
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
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), triggerSourceTypeModule (ref), fFlagEnableUpdatedCaptureControlsModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), retrieveCapturesModule (ref), waitForFlashOverlayModule (ref), capturesPolicyModule (ref), getCaptureObjectModule (ref), fFlagCreateMomentsToastModule (ref), captureServiceEnableXExperiencePostingApisEngineFeature (ref), triggerDefaultToast (ref), constantsModule (ref), fetchCapturesFromGalleryModule (ref), findMatchingCaptureModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p3, p4)
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), triggerSourceTypeModule (copy), fFlagEnableUpdatedCaptureControlsModule (copy), socialStopwatchModule (copy), p2 (ref), eventNamesModule (copy), p1 (ref), retrieveCapturesModule (copy), waitForFlashOverlayModule (copy), capturesPolicyModule (copy), getCaptureObjectModule (copy), fFlagCreateMomentsToastModule (copy), captureServiceEnableXExperiencePostingApisEngineFeature (copy), triggerDefaultToast (copy), constantsModule (copy), fetchCapturesFromGalleryModule (copy), findMatchingCaptureModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
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
		
		if p4 == triggerSourceTypeModule.PromptedShare then return end
		local var3 = capturesPolicyModule.PolicyImplementation.read()
		local var4 = if var3 then capturesPolicyModule.Mapper(var3).enableShareCaptureCTA() else false
		local var5 = getCaptureObjectModule(p3)
		local var6 = false
		local var7 = if fFlagCreateMomentsToastModule then game.GameId else nil
		
		if fFlagCreateMomentsToastModule and captureServiceEnableXExperiencePostingApisEngineFeature then
			local var8 = var5 ~= nil and var5.CaptureType == Enum.CaptureType.Video
			local var9 = if var8 then var5.TimeLength else nil
			var6 = var5 ~= nil and (if var8 then type(var9) == "number" and var9 >= 6 else not var8)
		end
		if not var6 or var7 == nil then
			triggerDefaultToast(p1, var4, p3, var1, p2)
			
			return
		elseif p1:getState()[constantsModule.RoduxKey].MomentsEligibility.byUniverseId[var7] ~= true then
			triggerDefaultToast(p1, var4, p3, var1, p2)
			
			return
		end
		p1:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureTakenWithMomentsCTA, {
			captureInfo = if fFlagCreateMomentsToastModule and var5 then findMatchingCaptureModule(fetchCapturesFromGalleryModule(), var5) or var5 else var5
		}))
		p2(eventNamesModule.CapturesCreateMomentToastViewed)
	end
end