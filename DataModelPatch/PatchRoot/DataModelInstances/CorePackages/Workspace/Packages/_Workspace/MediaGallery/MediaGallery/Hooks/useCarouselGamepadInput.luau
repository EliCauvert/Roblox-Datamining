local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(MediaGallery.MediaGalleryTypes)

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onFullscreenToggle then
			p1.onFullscreenToggle()
		end
	end, { p1.onFullscreenToggle })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.isVideoActive then
			p1.toggleMuteSignal:fire()
		end
	end, { p1.toggleMuteSignal, p1.isVideoActive })
	
	return (ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy), UseResult (copy), UseResult1 (copy)
		return {
			[FocusNavigationEventNameEnum.TabBackward] = { handler = InputHandlersModule.onRelease(p1.scrollLeft) },
			[FocusNavigationEventNameEnum.TabForward] = { handler = InputHandlersModule.onRelease(p1.scrollRight) },
			[FocusNavigationEventNameEnum.Fullscreen] = { handler = InputHandlersModule.onRelease(UseResult) },
			[FocusNavigationEventNameEnum.ExitFullscreen] = { handler = InputHandlersModule.onRelease(UseResult) },
			[FocusNavigationEventNameEnum.Mute] = { handler = InputHandlersModule.onRelease(UseResult1) },
			[FocusNavigationEventNameEnum.Unmute] = { handler = InputHandlersModule.onRelease(UseResult1) }
		}
	end, { p1.scrollLeft, p1.scrollRight, UseResult, UseResult1 }), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), p1 (copy)
		return {
			[Enum.KeyCode.ButtonL1] = FocusNavigationEventNameEnum.TabBackward,
			[Enum.KeyCode.ButtonR1] = FocusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonR3] = if p1.isFullscreen then FocusNavigationEventNameEnum.ExitFullscreen else FocusNavigationEventNameEnum.Fullscreen,
			[Enum.KeyCode.ButtonL3] = if p1.isVideoActive then if p1.isMuted then FocusNavigationEventNameEnum.Unmute else FocusNavigationEventNameEnum.Mute else nil
		}
	end, { p1.isFullscreen, p1.isMuted, p1.isVideoActive }))))))
end