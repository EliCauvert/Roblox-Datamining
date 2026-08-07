local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local _ = require(parent.ReactFocusNavigation)
local cryoModule = require(parent.Cryo)
local navigationModule = require(parent.Navigation)
local useFocusRootModule = require(focusNavigationUtils.useFocusRoot)
local useDefaultAppEventHandlersModule = require(focusNavigationUtils.useDefaultAppEventHandlers)
local focusNavigationDefaultEventMapModule = require(focusNavigationUtils.FocusNavigationDefaultEventMap)
local t = {}

return function(p0) --[[ line: 23 | named "useAppFocusRoot" ]]
	-- upvalues: t (ref), navigationModule (ref), useDefaultAppEventHandlersModule (ref), cryoModule (ref), focusNavigationDefaultEventMapModule (ref), useFocusRootModule (ref)
	local var7 = navigationModule.useNavigationFocus()
	
	return useFocusRootModule(cryoModule.Dictionary.union(p0, {
		customEventHandlers = cryoModule.None,
		eventHandlers = cryoModule.Dictionary.union(useDefaultAppEventHandlersModule(), p0.customEventHandlers or t),
		eventMap = cryoModule.Dictionary.union(focusNavigationDefaultEventMapModule, p0.customEventMap or t),
		isFocusable = (p0.isFocusable == nil or p0.isFocusable) and (var7 == nil or var7),
		isAutoFocusRoot = if p0.isAutoFocusRoot == nil then false else p0.isAutoFocusRoot
	}))
end