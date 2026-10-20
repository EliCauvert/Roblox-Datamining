local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local CryoModule = require(Parent.Cryo)
local NavigationModule = require(Parent.Navigation)
local UseAppFocusRootModule = require(script.Parent.useAppFocusRoot)
local BaseFocusRootModule = require(FocusNavigationUtils.BaseFocusRoot)
local FFlagFocusRootUseHooksModule = require(script.Parent.FFlagFocusRootUseHooks)
local FocusRootModule = require(FocusNavigationUtils.FocusRoot)
local UseDefaultAppEventHandlersModule = require(FocusNavigationUtils.useDefaultAppEventHandlers)
local FocusNavigationDefaultEventMapModule = require(FocusNavigationUtils.FocusNavigationDefaultEventMap)
local t = {}

return function(p1)
	-- upvalues: FFlagFocusRootUseHooksModule (copy), UseAppFocusRootModule (copy), ReactModule (copy), BaseFocusRootModule (copy), t (copy), NavigationModule (copy), UseDefaultAppEventHandlersModule (copy), CryoModule (copy), FocusNavigationDefaultEventMapModule (copy), FocusRootModule (copy)
	if FFlagFocusRootUseHooksModule then
		return ReactModule.createElement(BaseFocusRootModule, {
			ref = UseAppFocusRootModule(p1),
			isIsolated = p1.isIsolated,
			frameProps = p1.frameProps
		}, p1.children)
	else
		local UseNavigationFocusResult = NavigationModule.useNavigationFocus()
		
		return ReactModule.createElement(FocusRootModule, CryoModule.Dictionary.union(p1, {
			customEventHandlers = CryoModule.None,
			eventHandlers = CryoModule.Dictionary.union(UseDefaultAppEventHandlersModule(), p1.customEventHandlers or t),
			eventMap = CryoModule.Dictionary.union(FocusNavigationDefaultEventMapModule, p1.customEventMap or t),
			isFocusable = (p1.isFocusable == nil or p1.isFocusable) and (UseNavigationFocusResult == nil or UseNavigationFocusResult),
			isAutoFocusRoot = p1.isAutoFocusRoot ~= nil and p1.isAutoFocusRoot
		}), p1.children)
	end
end