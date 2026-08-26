local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local autoFocusNavigationModule = require(script.Parent.autoFocusNavigation)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusNavigationUtilsModule (ref), autoFocusNavigationModule (ref)
	return function(p4)
		-- upvalues: reactModule (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p3 (ref), focusNavigationUtilsModule (copy), p2 (ref), autoFocusNavigationModule (copy), p1 (ref)
		return reactModule.createElement(focusNavigationUtilsModule.FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			shouldRestoreFocus = true,
			isAutoFocusRoot = false,
			isFocusable = true,
			surfaceIdentifier = p2,
			customEventHandlers = if p3 then reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p3 (copy), p4 (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p5)
							-- upvalues: p3 (copy), p4 (copy)
							if p3 then
								p3(p4)
								p5:cancel()
							end
						end)
					}
				}
			end, { p3 }) else nil
		}, {
			content = reactModule.createElement(autoFocusNavigationModule(p1), p4)
		})
	end
end