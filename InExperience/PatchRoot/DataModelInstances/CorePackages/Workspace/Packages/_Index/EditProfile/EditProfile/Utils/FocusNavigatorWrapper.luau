local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum

return function(p1, p2)
	-- upvalues: reactModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p3)
					-- upvalues: p1 (ref)
					p1.onClose()
					p3:cancel()
				end)
			}
		}
	}, p2)
end