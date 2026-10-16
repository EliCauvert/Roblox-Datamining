local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FFlagLuaAppMediaGalleryGamepadSupport = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local _ = require(MediaGallery.MediaGalleryTypes)

return function(p1) --[[ Line: 30 | Named "useCarouselGamepadInput" ]]
	-- upvalues: ReactModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 31 ]]
		-- upvalues: p1 (copy)
		if p1.onFullscreenToggle then
			p1.onFullscreenToggle()
		end
	end, { p1.onFullscreenToggle })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 37 ]]
		-- upvalues: p1 (copy)
		if p1.isVideoActive then
			p1.toggleMuteSignal:fire()
		end
	end, { p1.toggleMuteSignal, p1.isVideoActive })
	
	return (ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 82 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy), UseResult1 (copy), FFlagLuaAppMediaGalleryGamepadSupport (upval), p1 (copy)
		local config = {
			[FocusNavigationEventNameEnum.Fullscreen] = { handler = InputHandlersModule.onRelease(UseResult) },
			[FocusNavigationEventNameEnum.ExitFullscreen] = { handler = InputHandlersModule.onRelease(UseResult) },
			[FocusNavigationEventNameEnum.Mute] = { handler = InputHandlersModule.onRelease(UseResult1) },
			[FocusNavigationEventNameEnum.Unmute] = { handler = InputHandlersModule.onRelease(UseResult1) }
		}
		
		if FFlagLuaAppMediaGalleryGamepadSupport then
			config[FocusNavigationEventNameEnum.PageBackward] = { handler = InputHandlersModule.onPress(p1.scrollLeft) }
			config[FocusNavigationEventNameEnum.PageForward] = { handler = InputHandlersModule.onPress(p1.scrollRight) }
			config[FocusNavigationEventNameEnum.PlayVideo] = {
				handler = InputHandlersModule.onRelease(function() --[[ Line: 108 ]] end)
			}
			config[FocusNavigationEventNameEnum.PauseVideo] = {
				handler = InputHandlersModule.onRelease(function() --[[ Line: 109 ]] end)
			}
			
			return config
		else
			config[FocusNavigationEventNameEnum.TabBackward] = { handler = InputHandlersModule.onRelease(p1.scrollLeft) }
			config[FocusNavigationEventNameEnum.TabForward] = { handler = InputHandlersModule.onRelease(p1.scrollRight) }
			
			return config
		end
	end, { p1.scrollLeft, p1.scrollRight, UseResult, UseResult1 }), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: FFlagLuaAppMediaGalleryGamepadSupport (upval), FocusNavigationEventNameEnum (upval), p1 (copy)
		return {
			[Enum.KeyCode.ButtonL1] = if FFlagLuaAppMediaGalleryGamepadSupport then nil else FocusNavigationEventNameEnum.TabBackward,
			[Enum.KeyCode.ButtonR1] = if FFlagLuaAppMediaGalleryGamepadSupport then nil else FocusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonL2] = if FFlagLuaAppMediaGalleryGamepadSupport then FocusNavigationEventNameEnum.PageBackward else nil,
			[Enum.KeyCode.ButtonR2] = if FFlagLuaAppMediaGalleryGamepadSupport then FocusNavigationEventNameEnum.PageForward else nil,
			[Enum.KeyCode.ButtonA] = if FFlagLuaAppMediaGalleryGamepadSupport and p1.isVideoActive and p1.isVideoReady then if p1.isVideoPlaying then FocusNavigationEventNameEnum.PauseVideo else FocusNavigationEventNameEnum.PlayVideo else nil,
			[Enum.KeyCode.ButtonR3] = if p1.isFullscreen then FocusNavigationEventNameEnum.ExitFullscreen else FocusNavigationEventNameEnum.Fullscreen,
			[Enum.KeyCode.ButtonL3] = if p1.isVideoActive then if p1.isMuted then FocusNavigationEventNameEnum.Unmute else FocusNavigationEventNameEnum.Mute else nil
		}
	end, {
		p1.isFullscreen,
		p1.isMuted,
		p1.isVideoActive,
		if FFlagLuaAppMediaGalleryGamepadSupport then p1.isVideoPlaying else nil,
		if FFlagLuaAppMediaGalleryGamepadSupport then p1.isVideoReady else nil
	}))))))
end