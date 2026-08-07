local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(mediaGallery.MediaGalleryTypes)

return function(p0) --[[ line: 25 | named "useCarouselGamepadInput" ]]
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref)
	local var4 = reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: p0 (ref)
		if p0.onFullscreenToggle then
			p0.onFullscreenToggle()
		end
	end, { p0.onFullscreenToggle })
	local var5 = reactModule.useCallback(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref)
		if p0.isVideoActive then
			p0.toggleMuteSignal:fire()
		end
	end, { p0.toggleMuteSignal, p0.isVideoActive })
	
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p0 (ref), var4 (ref), var5 (ref)
		return {
			[focusNavigationEventNameEnum.TabBackward] = { handler = inputHandlersModule.onRelease(p0.scrollLeft) },
			[focusNavigationEventNameEnum.TabForward] = { handler = inputHandlersModule.onRelease(p0.scrollRight) },
			[focusNavigationEventNameEnum.Fullscreen] = { handler = inputHandlersModule.onRelease(var4) },
			[focusNavigationEventNameEnum.ExitFullscreen] = { handler = inputHandlersModule.onRelease(var4) },
			[focusNavigationEventNameEnum.Mute] = { handler = inputHandlersModule.onRelease(var5) },
			[focusNavigationEventNameEnum.Unmute] = { handler = inputHandlersModule.onRelease(var5) }
		}
	end, { p0.scrollLeft, p0.scrollRight, var4, var5 }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function() --[[ line: 38 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), p0 (ref)
		return {
			[Enum.KeyCode.ButtonL1] = focusNavigationEventNameEnum.TabBackward,
			[Enum.KeyCode.ButtonR1] = focusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonR3] = if p0.isFullscreen then focusNavigationEventNameEnum.ExitFullscreen else focusNavigationEventNameEnum.Fullscreen,
			[Enum.KeyCode.ButtonL3] = if not p0.isVideoActive then nil elseif p0.isMuted then focusNavigationEventNameEnum.Unmute else focusNavigationEventNameEnum.Mute
		}
	end, { p0.isFullscreen, p0.isMuted, p0.isVideoActive })))
end