local Parent = script:FindFirstAncestor("EditProfile").Parent
local ReactModule = require(Parent.React)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum

return function(p1, p2) --[[ Line: 14 | Named "FocusNavigatorWrapper" ]]
	-- upvalues: ReactModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p3) --[[ Line: 20 ]]
					-- upvalues: p1 (copy)
					p1.onClose()
					p3:cancel()
				end)
			}
		}
	}, p2)
end