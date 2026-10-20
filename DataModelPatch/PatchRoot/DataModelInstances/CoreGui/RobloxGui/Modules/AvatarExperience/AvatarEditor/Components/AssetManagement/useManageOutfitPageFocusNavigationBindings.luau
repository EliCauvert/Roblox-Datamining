local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum

return function(p1, p2, p3)
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p3 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p4)
					-- upvalues: p3 (upval)
					p4.cancelled = true
					p3.onGoBack()
				end)
			},
			[FocusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if p3.onToggleMultiselect then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onToggleMultiselect()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if p3.onCancelMultiselect then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onCancelMultiselect()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.ManageOutfitsDelete] = if p3.onDelete then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onDelete()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.ManageOutfitsRename] = if p3.onRename then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onRename()
				end)
			} else nil
		}
	end, {
		p3.onGoBack,
		p3.onToggleMultiselect,
		p3.onCancelMultiselect,
		p3.onDelete,
		p3.onRename
	}), (ReactFocusNavigationModule.useEventMap(p2, p1)))
end