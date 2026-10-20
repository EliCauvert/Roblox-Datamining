local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local _ = require(Parent.ReactFocusNavigation)
local CryoModule = require(Parent.Cryo)
local NavigationModule = require(Parent.Navigation)
local UseFocusRootModule = require(FocusNavigationUtils.useFocusRoot)
local UseDefaultAppEventHandlersModule = require(FocusNavigationUtils.useDefaultAppEventHandlers)
local FocusNavigationDefaultEventMapModule = require(FocusNavigationUtils.FocusNavigationDefaultEventMap)
local t = {}

return function(p1)
	-- upvalues: t (copy), NavigationModule (copy), UseDefaultAppEventHandlersModule (copy), CryoModule (copy), FocusNavigationDefaultEventMapModule (copy), UseFocusRootModule (copy)
	local UseNavigationFocusResult = NavigationModule.useNavigationFocus()
	
	return UseFocusRootModule((CryoModule.Dictionary.union(p1, {
		customEventHandlers = CryoModule.None,
		eventHandlers = CryoModule.Dictionary.union(UseDefaultAppEventHandlersModule(), p1.customEventHandlers or t),
		eventMap = CryoModule.Dictionary.union(FocusNavigationDefaultEventMapModule, p1.customEventMap or t),
		isFocusable = (p1.isFocusable == nil or p1.isFocusable) and (UseNavigationFocusResult == nil or UseNavigationFocusResult),
		isAutoFocusRoot = p1.isAutoFocusRoot ~= nil and p1.isAutoFocusRoot
	})))
end