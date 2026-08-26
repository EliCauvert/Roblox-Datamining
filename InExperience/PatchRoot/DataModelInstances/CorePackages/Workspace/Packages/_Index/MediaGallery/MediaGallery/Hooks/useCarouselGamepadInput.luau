local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(mediaGallery.MediaGalleryTypes)

return function(p1)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref)
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onFullscreenToggle then
			p1.onFullscreenToggle()
		end
	end, { p1.onFullscreenToggle })
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.isVideoActive then
			p1.toggleMuteSignal:fire()
		end
	end, { p1.toggleMuteSignal, p1.isVideoActive })
	
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p1 (ref), var1 (ref), var2 (ref)
		return {
			[focusNavigationEventNameEnum.TabBackward] = { handler = inputHandlersModule.onRelease(p1.scrollLeft) },
			[focusNavigationEventNameEnum.TabForward] = { handler = inputHandlersModule.onRelease(p1.scrollRight) },
			[focusNavigationEventNameEnum.Fullscreen] = { handler = inputHandlersModule.onRelease(var1) },
			[focusNavigationEventNameEnum.ExitFullscreen] = { handler = inputHandlersModule.onRelease(var1) },
			[focusNavigationEventNameEnum.Mute] = { handler = inputHandlersModule.onRelease(var2) },
			[focusNavigationEventNameEnum.Unmute] = { handler = inputHandlersModule.onRelease(var2) }
		}
	end, { p1.scrollLeft, p1.scrollRight, var1, var2 }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), p1 (ref)
		return {
			[Enum.KeyCode.ButtonL1] = focusNavigationEventNameEnum.TabBackward,
			[Enum.KeyCode.ButtonR1] = focusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonR3] = if p1.isFullscreen then focusNavigationEventNameEnum.ExitFullscreen else focusNavigationEventNameEnum.Fullscreen,
			[Enum.KeyCode.ButtonL3] = if not p1.isVideoActive then nil elseif p1.isMuted then focusNavigationEventNameEnum.Unmute else focusNavigationEventNameEnum.Mute
		}
	end, { p1.isFullscreen, p1.isMuted, p1.isVideoActive })))
end