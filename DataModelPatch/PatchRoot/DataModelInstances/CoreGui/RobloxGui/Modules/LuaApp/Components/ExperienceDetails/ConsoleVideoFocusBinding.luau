local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy)
	return p1.render((ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy)
		return {
			[FocusNavigationEventNameEnum.Mute] = {
				handler = InputHandlersModule.onRelease(function()
					-- upvalues: p1 (upval)
					if p1.toggleMuteSignal then
						p1.toggleMuteSignal:fire()
					end
				end)
			}
		}
	end, { p1.toggleMuteSignal }), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FocusNavigationEventNameEnum (upval)
		return if p1.enabled then {
			[Enum.KeyCode.ButtonL3] = FocusNavigationEventNameEnum.Mute
		} else {}
	end, { p1.enabled })))))))
end