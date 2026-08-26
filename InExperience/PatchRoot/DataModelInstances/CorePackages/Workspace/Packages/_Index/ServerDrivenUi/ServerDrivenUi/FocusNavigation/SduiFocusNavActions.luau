local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local _ = require(parent.SduiCoreSystem)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), guiService (ref), reactFocusNavigationModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), guiService (copy)
		return if p1.guiObject then p1.guiObject else guiService.SelectedCoreObject
	end, { p1.guiObject })
	local var2 = reactFocusNavigationModule.useEventHandlerMap(p1.focusNavActions.events, reactFocusNavigationModule.useEventMap(p1.focusNavActions.keys))
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		if var2 then
			var2(var1)
		end
		return function()
			-- upvalues: var2 (copy)
			var2(nil)
		end
	end, { var2, var1 })
	
	return nil
end)