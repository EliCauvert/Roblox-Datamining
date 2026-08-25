local roduxModule = require(script.Parent.Parent.Parent.Rodux)
local captureManagerModule = require(script.Parent.CaptureManager)
local capturesModule = require(script.Parent.Captures)
local carouselModule = require(script.Parent.Carousel)
local isActiveModule = require(script.Parent.IsActive)
local isCapturesCoreGuiEnabledModule = require(script.Parent.IsCapturesCoreGuiEnabled)
local isMenuOpenModule = require(script.Parent.IsMenuOpen)
local isOverlayActiveModule = require(script.Parent.IsOverlayActive)
local isOverlayFlashActiveModule = require(script.Parent.IsOverlayFlashActive)
local isVideoCaptureActiveModule = require(script.Parent.IsVideoCaptureActive)
local momentsEligibilityModule = require(script.Parent.MomentsEligibility)
local momentsCreationFlowModule = require(script.Parent.MomentsCreationFlow)
local promptsModule = require(script.Parent.Prompts)
local toastModule = require(script.Parent.Toast)

return function()
	-- upvalues: roduxModule (ref), captureManagerModule (ref), capturesModule (ref), carouselModule (ref), isActiveModule (ref), isCapturesCoreGuiEnabledModule (ref), isMenuOpenModule (ref), isOverlayActiveModule (ref), isOverlayFlashActiveModule (ref), isVideoCaptureActiveModule (ref), momentsEligibilityModule (ref), momentsCreationFlowModule (ref), promptsModule (ref), toastModule (ref)
	return roduxModule.combineReducers({
		CaptureManager = captureManagerModule,
		Captures = capturesModule,
		Carousel = carouselModule,
		IsActive = isActiveModule,
		IsCapturesCoreGuiEnabled = isCapturesCoreGuiEnabledModule,
		IsMenuOpen = isMenuOpenModule,
		IsOverlayActive = isOverlayActiveModule,
		IsOverlayFlashActive = isOverlayFlashActiveModule,
		IsVideoCaptureActive = isVideoCaptureActiveModule,
		MomentsEligibility = momentsEligibilityModule,
		MomentsCreationFlow = momentsCreationFlowModule,
		Prompts = promptsModule,
		Toast = toastModule
	})
end