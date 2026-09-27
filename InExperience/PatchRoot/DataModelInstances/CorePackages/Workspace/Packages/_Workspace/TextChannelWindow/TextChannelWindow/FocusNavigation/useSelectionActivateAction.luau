local useCoreActionBindModule = require(script.Parent.useCoreActionBind)
local selectionInputsModule = require(script.Parent.SelectionInputs)

return function(p1)
	-- upvalues: useCoreActionBindModule (ref), selectionInputsModule (ref)
	useCoreActionBindModule({
		enabled = p1.enabled,
		active = p1.active,
		actionNamePrefix = p1.actionNamePrefix,
		inputs = selectionInputsModule.Activate,
		onAction = p1.onAction,
		shouldBind = p1.shouldBind,
		rebindSignal = p1.rebindSignal,
		contextActionService = p1.contextActionService
	})
end