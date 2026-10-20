local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(Parent.SduiCoreSystem)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GuiService (copy), ReactFocusNavigationModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GuiService (upval)
		return if p1.guiObject then p1.guiObject else GuiService.SelectedCoreObject
	end, { p1.guiObject })
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(p1.focusNavActions.events, (ReactFocusNavigationModule.useEventMap(p1.focusNavActions.keys)))
	ReactModule.useEffect(function()
		-- upvalues: UseEventHandlerMapResult (copy), UseMemoResult (copy)
		if UseEventHandlerMapResult then
			UseEventHandlerMapResult(UseMemoResult)
		end
		return function()
			-- upvalues: UseEventHandlerMapResult (upval)
			UseEventHandlerMapResult(nil)
		end
	end, { UseEventHandlerMapResult, UseMemoResult })
	
	return nil
end)