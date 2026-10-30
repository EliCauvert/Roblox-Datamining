local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseOnNavigateBackFunction = require(script.Parent.NavigateBackBindings).useOnNavigateBack
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), config (copy), UseOnNavigateBackFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseOnNavigateBackResult = UseOnNavigateBackFunction(p1, (ReactFocusNavigationModule.useEventMap(config)))
	ReactModule.useEffect(function()
		-- upvalues: UseOnNavigateBackResult (copy), UseStateResult (copy)
		if UseOnNavigateBackResult then
			UseOnNavigateBackResult(UseStateResult)
		end
	end, { UseOnNavigateBackResult, UseStateResult })
	
	return UseStateResult2
end