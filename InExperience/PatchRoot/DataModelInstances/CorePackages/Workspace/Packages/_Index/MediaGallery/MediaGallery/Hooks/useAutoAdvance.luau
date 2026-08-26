local mediaGallery = script:FindFirstAncestor("MediaGallery")
local reactModule = require(mediaGallery.Parent.React)
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)
local useGuiObjectVisibilityModule = require(mediaGallery.Hooks.useGuiObjectVisibility)

return function(p1)
	-- upvalues: mediaGalleryConstantsModule (ref), reactModule (ref), useGuiObjectVisibilityModule (ref)
	local intervalSeconds = p1.intervalSeconds or mediaGalleryConstantsModule.AUTO_ADVANCE_DURATION_SECONDS
	local var1, var2 = reactModule.useBinding(0)
	local var3, var4 = reactModule.useBinding(0)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref)
		var2(0)
		var4(0)
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.enabled then
			p1.scrollRight()
			
			return
		end
	end, { p1.enabled, p1.scrollRight })
	useGuiObjectVisibilityModule(p1.galleryRef, p1.enabled and (not p1.isMediaGalleryOccluded and not p1.isAutoAdvanceTimerSuspended), reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), intervalSeconds (ref), var2 (ref), var4 (ref), p1 (ref)
		local var7 = var1:getValue() + p2
		
		if intervalSeconds <= var7 then
			var2(0)
			var4(0)
			p1.scrollRight()
			
			return
		end
		var2(var7)
		var4(var7 / intervalSeconds)
	end, { var1, p1.scrollRight, intervalSeconds }), var5)
	
	return {
		elapsedTimeBinding = var1,
		progressBinding = var3,
		resetProgress = var5,
		onVideoEnded = var6,
		onVideoProgressChanged = var4
	}
end