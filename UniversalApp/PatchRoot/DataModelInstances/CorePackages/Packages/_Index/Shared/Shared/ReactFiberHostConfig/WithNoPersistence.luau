local invariantModule = require(script.Parent.Parent.invariant)

local function shim(...) --[[ line: 16 ]]
	-- upvalues: invariantModule (ref)
	invariantModule(false, "The current renderer does not support persistence. This error is likely caused by a bug in React. Please file an issue.")
end

return {
	supportsPersistence = false,
	cloneInstance = shim,
	cloneFundamentalInstance = shim,
	createContainerChildSet = shim,
	appendChildToContainerChildSet = shim,
	finalizeContainerChildren = shim,
	replaceContainerChildren = shim,
	cloneHiddenInstance = shim,
	cloneHiddenTextInstance = shim
}