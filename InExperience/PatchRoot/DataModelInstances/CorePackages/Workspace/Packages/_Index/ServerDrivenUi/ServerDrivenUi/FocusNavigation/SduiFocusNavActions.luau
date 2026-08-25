local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local _ = require(parent.SduiCoreSystem)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), guiService (ref), reactFocusNavigationModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), guiService (copy)
		return if p0.guiObject then p0.guiObject else guiService.SelectedCoreObject
	end, { p0.guiObject })
	local var4 = reactFocusNavigationModule.useEventHandlerMap(p0.focusNavActions.events, reactFocusNavigationModule.useEventMap(p0.focusNavActions.keys))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref)
		if var4 then
			var4(var3)
		end
		return function()
			-- upvalues: var4 (copy)
			var4(nil)
		end
	end, { var4, var3 })
	
	return nil
end)