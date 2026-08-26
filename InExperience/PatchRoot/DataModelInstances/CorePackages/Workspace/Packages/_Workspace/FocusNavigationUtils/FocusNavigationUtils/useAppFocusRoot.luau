local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local _ = require(parent.ReactFocusNavigation)
local cryoModule = require(parent.Cryo)
local navigationModule = require(parent.Navigation)
local useFocusRootModule = require(focusNavigationUtils.useFocusRoot)
local useDefaultAppEventHandlersModule = require(focusNavigationUtils.useDefaultAppEventHandlers)
local focusNavigationDefaultEventMapModule = require(focusNavigationUtils.FocusNavigationDefaultEventMap)
local t = {}

return function(p1)
	-- upvalues: t (ref), navigationModule (ref), useDefaultAppEventHandlersModule (ref), cryoModule (ref), focusNavigationDefaultEventMapModule (ref), useFocusRootModule (ref)
	local var1 = navigationModule.useNavigationFocus()
	
	return useFocusRootModule(cryoModule.Dictionary.union(p1, {
		customEventHandlers = cryoModule.None,
		eventHandlers = cryoModule.Dictionary.union(useDefaultAppEventHandlersModule(), p1.customEventHandlers or t),
		eventMap = cryoModule.Dictionary.union(focusNavigationDefaultEventMapModule, p1.customEventMap or t),
		isFocusable = (p1.isFocusable == nil or p1.isFocusable) and (var1 == nil or var1),
		isAutoFocusRoot = if p1.isAutoFocusRoot == nil then false else p1.isAutoFocusRoot
	}))
end