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
			[FocusNavigationEventNameEnum.OpenItemDetailsPrompt] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onOpenItemPrompt()
				end)
			},
			[FocusNavigationEventNameEnum.OpenItemDetailsPeekView] = if p3.onOpenPeekView then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onOpenPeekView()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.CloseItemDetailsPeekView] = if p3.onClosePeekView then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onClosePeekView()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = if p3.onOpenCatalogContextMenu then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onOpenCatalogContextMenu()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.MoveToItemDetails] = if p3.onMoveToItemDetails then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: p3 (upval)
					p3.onMoveToItemDetails()
				end)
			} else nil
		}
	end, {
		p3.onGoBack, p3.onOpenItemPrompt, p3.onOpenPeekView, p3.onClosePeekView,
		p3.onOpenCatalogContextMenu, p3.onMoveToItemDetails
	}), (ReactFocusNavigationModule.useEventMap(p2, p1)))
end