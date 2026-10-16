local RoduxModule = require(script.Parent.Parent.Parent.Rodux)
local CaptureManagerModule = require(script.Parent.CaptureManager)
local CapturesModule = require(script.Parent.Captures)
local CarouselModule = require(script.Parent.Carousel)
local IsActiveModule = require(script.Parent.IsActive)
local IsCapturesCoreGuiEnabledModule = require(script.Parent.IsCapturesCoreGuiEnabled)
local IsMenuOpenModule = require(script.Parent.IsMenuOpen)
local IsOverlayActiveModule = require(script.Parent.IsOverlayActive)
local IsOverlayFlashActiveModule = require(script.Parent.IsOverlayFlashActive)
local IsVideoCaptureActiveModule = require(script.Parent.IsVideoCaptureActive)
local MomentsEligibilityModule = require(script.Parent.MomentsEligibility)
local MomentsCreationFlowModule = require(script.Parent.MomentsCreationFlow)
local PromptsModule = require(script.Parent.Prompts)
local ToastModule = require(script.Parent.Toast)

return function() --[[ Line: 36 ]]
	-- upvalues: RoduxModule (copy), CaptureManagerModule (copy), CapturesModule (copy), CarouselModule (copy), IsActiveModule (copy), IsCapturesCoreGuiEnabledModule (copy), IsMenuOpenModule (copy), IsOverlayActiveModule (copy), IsOverlayFlashActiveModule (copy), IsVideoCaptureActiveModule (copy), MomentsEligibilityModule (copy), MomentsCreationFlowModule (copy), PromptsModule (copy), ToastModule (copy)
	return RoduxModule.combineReducers({
		CaptureManager = CaptureManagerModule,
		Captures = CapturesModule,
		Carousel = CarouselModule,
		IsActive = IsActiveModule,
		IsCapturesCoreGuiEnabled = IsCapturesCoreGuiEnabledModule,
		IsMenuOpen = IsMenuOpenModule,
		IsOverlayActive = IsOverlayActiveModule,
		IsOverlayFlashActive = IsOverlayFlashActiveModule,
		IsVideoCaptureActive = IsVideoCaptureActiveModule,
		MomentsEligibility = MomentsEligibilityModule,
		MomentsCreationFlow = MomentsCreationFlowModule,
		Prompts = PromptsModule,
		Toast = ToastModule
	})
end