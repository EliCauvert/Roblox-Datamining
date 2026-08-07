local mediaGallery = script:FindFirstAncestor("MediaGallery")
local reactModule = require(mediaGallery.Parent.React)
local mediaGalleryConstantsModule = require(mediaGallery.MediaGalleryConstants)
local useGuiObjectVisibilityModule = require(mediaGallery.Hooks.useGuiObjectVisibility)

return function(p0) --[[ line: 39 | named "useAutoAdvance" ]]
	-- upvalues: mediaGalleryConstantsModule (ref), reactModule (ref), useGuiObjectVisibilityModule (ref)
	local intervalSeconds = p0.intervalSeconds or mediaGalleryConstantsModule.AUTO_ADVANCE_DURATION_SECONDS
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useBinding(0)
	local var9 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: var6 (ref), var8 (ref)
		var6(0)
		var8(0)
	end, {})
	local var10 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref)
		if p0.enabled then
			p0.scrollRight()
			
			return
		end
	end, { p0.enabled, p0.scrollRight })
	useGuiObjectVisibilityModule(p0.galleryRef, p0.enabled and (not p0.isMediaGalleryOccluded and not p0.isAutoAdvanceTimerSuspended), reactModule.useCallback(function(p1) --[[ line: 57 ]]
		-- upvalues: var5 (ref), intervalSeconds (ref), var6 (ref), var8 (ref), p0 (ref)
		local var11 = var5:getValue() + p1
		
		if intervalSeconds <= var11 then
			var6(0)
			var8(0)
			p0.scrollRight()
			
			return
		end
		var6(var11)
		var8(var11 / intervalSeconds)
	end, { var5, p0.scrollRight, intervalSeconds }), var9)
	
	return {
		elapsedTimeBinding = var5,
		progressBinding = var7,
		resetProgress = var9,
		onVideoEnded = var10,
		onVideoProgressChanged = var8
	}
end