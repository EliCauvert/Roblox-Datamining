local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local cryoModule = require(parent.Cryo)
local navigationModule = require(parent.Navigation)
local useAppFocusRootModule = require(script.Parent.useAppFocusRoot)
local baseFocusRootModule = require(focusNavigationUtils.BaseFocusRoot)
local fFlagFocusRootUseHooksModule = require(script.Parent.FFlagFocusRootUseHooks)
local focusRootModule = require(focusNavigationUtils.FocusRoot)
local useDefaultAppEventHandlersModule = require(focusNavigationUtils.useDefaultAppEventHandlers)
local focusNavigationDefaultEventMapModule = require(focusNavigationUtils.FocusNavigationDefaultEventMap)
local t = {}

return function(p1)
	-- upvalues: fFlagFocusRootUseHooksModule (ref), useAppFocusRootModule (ref), reactModule (ref), baseFocusRootModule (ref), t (ref), navigationModule (ref), useDefaultAppEventHandlersModule (ref), cryoModule (ref), focusNavigationDefaultEventMapModule (ref), focusRootModule (ref)
	if fFlagFocusRootUseHooksModule then
		return reactModule.createElement(baseFocusRootModule, {
			ref = useAppFocusRootModule(p1),
			isIsolated = p1.isIsolated,
			frameProps = p1.frameProps
		}, p1.children)
	end
	local var1 = navigationModule.useNavigationFocus()
	
	return reactModule.createElement(focusRootModule, cryoModule.Dictionary.union(p1, {
		customEventHandlers = cryoModule.None,
		eventHandlers = cryoModule.Dictionary.union(useDefaultAppEventHandlersModule(), p1.customEventHandlers or t),
		eventMap = cryoModule.Dictionary.union(focusNavigationDefaultEventMapModule, p1.customEventMap or t),
		isFocusable = (p1.isFocusable == nil or p1.isFocusable) and (var1 == nil or var1),
		isAutoFocusRoot = if p1.isAutoFocusRoot == nil then false else p1.isAutoFocusRoot
	}), p1.children)
end