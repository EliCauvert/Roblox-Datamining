local TenFootUiGlobalNav = script:FindFirstAncestor("TenFootUiGlobalNav")
local Parent = script:FindFirstAncestor("TenFootUiGlobalNav").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseGlobalNavPropsModule = require(TenFootUiGlobalNav.Components.GlobalNavContainer.useGlobalNavProps)
local UseGlobalNavDisplayOptionsModule = require(TenFootUiGlobalNav.Components.GlobalNavContainer.useGlobalNavDisplayOptions)
local GetActiveChildNavigationOptionsRecursively = require(Parent.Navigation).getActiveChildNavigationOptionsRecursively
local GlobalNavModule = require(TenFootUiGlobalNav.Components.GlobalNav)

return function()
	-- upvalues: UseNavigationFunction (copy), UseGlobalNavDisplayOptionsModule (copy), GetActiveChildNavigationOptionsRecursively (copy), UseGlobalNavPropsModule (copy), ReactModule (copy), GlobalNavModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(GlobalNavModule, (UseGlobalNavPropsModule(UseNavigationResult, (UseGlobalNavDisplayOptionsModule(UseNavigationResult, GetActiveChildNavigationOptionsRecursively)))))
end