local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local AutoFocusNavigationModule = require(script.Parent.autoFocusNavigation)

return function(p1, SurfaceIdentifier, Callback)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusNavigationUtilsModule (copy), AutoFocusNavigationModule (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), FocusNavigationUtilsModule (upval), SurfaceIdentifier (copy), AutoFocusNavigationModule (upval), p1 (copy)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (upval), p2 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p3)
						-- upvalues: Callback (upval), p2 (upval)
						if Callback then
							Callback(p2)
							p3:cancel()
						end
					end)
				}
			}
		end, { Callback })
		
		return ReactModule.createElement(FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			shouldRestoreFocus = true,
			isAutoFocusRoot = false,
			isFocusable = true,
			surfaceIdentifier = SurfaceIdentifier,
			customEventHandlers = if Callback then UseMemoResult else nil
		}, {
			content = ReactModule.createElement(AutoFocusNavigationModule(p1), p2)
		})
	end
end