local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useOnNavigateBack = require(script.Parent.NavigateBackBindings).useOnNavigateBack
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), t (ref), useOnNavigateBack (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = useOnNavigateBack(p1, reactFocusNavigationModule.useEventMap(t))
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref)
		if var3 then
			var3(var1)
		end
	end, { var3, var1 })
	
	return var2
end