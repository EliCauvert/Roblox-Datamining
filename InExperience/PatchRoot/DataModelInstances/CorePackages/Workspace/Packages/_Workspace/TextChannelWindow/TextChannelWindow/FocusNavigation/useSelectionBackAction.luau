local UseCoreActionBindModule = require(script.Parent.useCoreActionBind)
local SelectionInputsModule = require(script.Parent.SelectionInputs)

return function(p1) --[[ Line: 23 | Named "useSelectionBackAction" ]]
	-- upvalues: UseCoreActionBindModule (copy), SelectionInputsModule (copy)
	UseCoreActionBindModule({
		enabled = p1.enabled,
		active = p1.active,
		actionNamePrefix = p1.actionNamePrefix,
		inputs = SelectionInputsModule.Back,
		onAction = p1.onAction,
		shouldBind = p1.shouldBind,
		rebindSignal = p1.rebindSignal,
		contextActionService = p1.contextActionService
	})
end