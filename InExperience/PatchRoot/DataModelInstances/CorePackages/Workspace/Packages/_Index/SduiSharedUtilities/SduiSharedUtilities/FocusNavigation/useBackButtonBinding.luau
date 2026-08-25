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

return function(p0)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), t (ref), useOnNavigateBack (ref)
	local var4, var5 = reactModule.useState(nil)
	local var6 = useOnNavigateBack(p0, reactFocusNavigationModule.useEventMap(t))
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var4 (ref)
		if var6 then
			var6(var4)
		end
	end, { var6, var4 })
	
	return var5
end