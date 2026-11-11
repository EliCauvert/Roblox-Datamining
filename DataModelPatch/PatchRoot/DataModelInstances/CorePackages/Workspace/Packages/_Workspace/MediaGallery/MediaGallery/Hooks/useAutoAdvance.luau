local MediaGallery = script:FindFirstAncestor("MediaGallery")
local ReactModule = require(MediaGallery.Parent.React)
local MediaGalleryConstantsModule = require(MediaGallery.MediaGalleryConstants)
local UseGuiObjectVisibilityModule = require(MediaGallery.Hooks.useGuiObjectVisibility)

return function(p1)
	-- upvalues: MediaGalleryConstantsModule (copy), ReactModule (copy), UseGuiObjectVisibilityModule (copy)
	local IntervalSeconds = p1.intervalSeconds or MediaGalleryConstantsModule.AUTO_ADVANCE_DURATION_SECONDS
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		UseBindingResult2(0)
		UseBindingResult2_1(0)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.enabled then
			p1.scrollRight()
			
			return
		end
	end, { p1.enabled, p1.scrollRight })
	UseGuiObjectVisibilityModule(p1.galleryRef, p1.enabled and (not p1.isMediaGalleryOccluded and not p1.isAutoAdvanceTimerSuspended), ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult (copy), IntervalSeconds (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), p1 (copy)
		local NewValue = UseBindingResult:getValue() + p2
		
		if IntervalSeconds <= NewValue then
			UseBindingResult2(0)
			UseBindingResult2_1(0)
			p1.scrollRight()
			
			return
		else
			UseBindingResult2(NewValue)
			UseBindingResult2_1(NewValue / IntervalSeconds)
		end
	end, { UseBindingResult, p1.scrollRight, IntervalSeconds }), UseResult)
	
	return {
		elapsedTimeBinding = UseBindingResult,
		progressBinding = UseBindingResult1,
		resetProgress = UseResult,
		onVideoEnded = UseResult1,
		onVideoProgressChanged = UseBindingResult2_1
	}
end