local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)

return function(p1, p2)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), p1 (copy), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.OpenEditorDetailsPage] = if p1.onOpenEditorDetailsPage then {
				handler = InputHandlersModule.onRelease(p1.onOpenEditorDetailsPage)
			} else nil,
			[FocusNavigationEventNameEnum.SelectItem] = if p1.onSelectItem then { handler = InputHandlersModule.onRelease(p1.onSelectItem) } else nil,
			[FocusNavigationEventNameEnum.SlotEmote] = if p1.onSlotEmote then { handler = InputHandlersModule.onRelease(p1.onSlotEmote) } else nil,
			[FocusNavigationEventNameEnum.UnslotEmote] = if p1.onUnslotEmote then {
				handler = InputHandlersModule.onRelease(p1.onUnslotEmote)
			} else nil
		}
	end, {
		p1.onOpenEditorDetailsPage,
		p1.onSelectItem,
		p1.onSlotEmote,
		p1.onUnslotEmote
	}), (ReactFocusNavigationModule.useEventMap(ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonA] = if p1.onSlotEmote then FocusNavigationEventNameEnum.SlotEmote elseif p1.onUnslotEmote then FocusNavigationEventNameEnum.UnslotEmote else FocusNavigationEventNameEnum.SelectItem,
			[Enum.KeyCode.ButtonL3] = FocusNavigationEventNameEnum.OpenEditorDetailsPage
		}
	end, { p1.onSelectItem, p1.onSlotEmote, p1.onUnslotEmote }), p2)))
end