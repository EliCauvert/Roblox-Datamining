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

return function(p0)
	-- upvalues: fFlagFocusRootUseHooksModule (ref), useAppFocusRootModule (ref), reactModule (ref), baseFocusRootModule (ref), t (ref), navigationModule (ref), useDefaultAppEventHandlersModule (ref), cryoModule (ref), focusNavigationDefaultEventMapModule (ref), focusRootModule (ref)
	if fFlagFocusRootUseHooksModule then
		return reactModule.createElement(baseFocusRootModule, {
			ref = useAppFocusRootModule(p0),
			isIsolated = p0.isIsolated,
			frameProps = p0.frameProps
		}, p0.children)
	end
	local var11 = navigationModule.useNavigationFocus()
	
	return reactModule.createElement(focusRootModule, cryoModule.Dictionary.union(p0, {
		customEventHandlers = cryoModule.None,
		eventHandlers = cryoModule.Dictionary.union(useDefaultAppEventHandlersModule(), p0.customEventHandlers or t),
		eventMap = cryoModule.Dictionary.union(focusNavigationDefaultEventMapModule, p0.customEventMap or t),
		isFocusable = (p0.isFocusable == nil or p0.isFocusable) and (var11 == nil or var11),
		isAutoFocusRoot = if p0.isAutoFocusRoot == nil then false else p0.isAutoFocusRoot
	}), p0.children)
end