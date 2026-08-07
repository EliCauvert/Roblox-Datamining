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

local function triggerDefaultToast(p0, p1, p2, p3, p4) --[[ line: 33 ]]
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref), eventNamesModule (ref)
	if p1 then
		p0:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureTaken, { captureInfo = p2 }))
	else
		p0:dispatch(toastTriggeredModule(capturesToastTypeModule.ViewCapture))
	end
	if p3 then
		p4(eventNamesModule.CapturesVideoShareToastViewed)
	end
	p4(eventNamesModule.CapturesShareToastViewed)
end

return function(p5, _, p6) --[[ line: 55 | named "makeCaptureSavedHandler" ]]
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), triggerSourceTypeModule (ref), fFlagEnableUpdatedCaptureControlsModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), retrieveCapturesModule (ref), waitForFlashOverlayModule (ref), capturesPolicyModule (ref), getCaptureObjectModule (ref), fFlagCreateMomentsToastModule (ref), captureServiceEnableXExperiencePostingApisEngineFeature (ref), triggerDefaultToast (ref), constantsModule (ref), fetchCapturesFromGalleryModule (ref), findMatchingCaptureModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p7, p8) --[[ line: 56 | named "captureSavedHandler" ]]
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), triggerSourceTypeModule (copy), fFlagEnableUpdatedCaptureControlsModule (copy), socialStopwatchModule (copy), p6 (ref), eventNamesModule (copy), p5 (ref), retrieveCapturesModule (copy), waitForFlashOverlayModule (copy), capturesPolicyModule (copy), getCaptureObjectModule (copy), fFlagCreateMomentsToastModule (copy), captureServiceEnableXExperiencePostingApisEngineFeature (copy), triggerDefaultToast (copy), constantsModule (copy), fetchCapturesFromGalleryModule (copy), findMatchingCaptureModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		local var18
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			var18 = p7.CaptureType == Enum.CaptureType.Video
			var18 = nil
		else
			var18 = p7.type == captureTypeModule.Video
		end
		if p8 == triggerSourceTypeModule.UserSave and (not fFlagEnableUpdatedCaptureControlsModule or not var18) then
			local var19 = socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.CaptureTaken)
			p6(eventNamesModule.CapturesEntrypointLatency, { statValue = if var19 then var19.timeElapsed else nil })
		end
		p5:dispatch(retrieveCapturesModule())
		waitForFlashOverlayModule(p5)
		
		if p8 == triggerSourceTypeModule.PromptedShare then return end
		local var20 = capturesPolicyModule.PolicyImplementation.read()
		local var21 = if var20 then capturesPolicyModule.Mapper(var20).enableShareCaptureCTA() else false
		local var22 = getCaptureObjectModule(p7)
		local var23 = false
		local var24 = if fFlagCreateMomentsToastModule then game.GameId else nil
		
		if fFlagCreateMomentsToastModule and captureServiceEnableXExperiencePostingApisEngineFeature then
			local var25 = var22 ~= nil and var22.CaptureType == Enum.CaptureType.Video
			local var26 = if var25 then var22.TimeLength else nil
			var23 = var22 ~= nil and (if var25 then type(var26) == "number" and var26 >= 6 else not var25)
		end
		if not var23 or var24 == nil then
			triggerDefaultToast(p5, var21, p7, var18, p6)
			
			return
		elseif p5:getState()[constantsModule.RoduxKey].MomentsEligibility.byUniverseId[var24] ~= true then
			triggerDefaultToast(p5, var21, p7, var18, p6)
			
			return
		end
		p5:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureTakenWithMomentsCTA, {
			captureInfo = if fFlagCreateMomentsToastModule and var22 then findMatchingCaptureModule(fetchCapturesFromGalleryModule(), var22) or var22 else var22
		}))
		p6(eventNamesModule.CapturesCreateMomentToastViewed)
	end
end