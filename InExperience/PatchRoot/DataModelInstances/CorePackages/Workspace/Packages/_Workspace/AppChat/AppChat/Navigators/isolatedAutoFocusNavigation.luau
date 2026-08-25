local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local autoFocusNavigationModule = require(script.Parent.autoFocusNavigation)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusNavigationUtilsModule (ref), autoFocusNavigationModule (ref)
	return function(p3)
		-- upvalues: reactModule (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p2 (ref), focusNavigationUtilsModule (copy), p1 (ref), autoFocusNavigationModule (copy), p0 (ref)
		return reactModule.createElement(focusNavigationUtilsModule.FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			shouldRestoreFocus = true,
			isAutoFocusRoot = false,
			isFocusable = true,
			surfaceIdentifier = p1,
			customEventHandlers = if p2 then reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p2 (copy), p3 (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p4)
							-- upvalues: p2 (copy), p3 (copy)
							if p2 then
								p2(p3)
								p4:cancel()
							end
						end)
					}
				}
			end, { p2 }) else nil
		}, {
			content = reactModule.createElement(autoFocusNavigationModule(p0), p3)
		})
	end
end