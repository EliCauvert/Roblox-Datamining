local invariantModule = require(script.Parent.Parent.invariant)

local function shim(...)
	-- upvalues: invariantModule (ref)
	invariantModule(false, "The current renderer does not support test selectors. This error is likely caused by a bug in React. Please file an issue.")
end

return {
	supportsTestSelectors = false,
	findFiberRoot = shim,
	getBoundingRect = shim,
	getTextContent = shim,
	isHiddenSubtree = shim,
	matchAccessibilityRole = shim,
	setFocusIfFocusable = shim,
	setupIntersectionObserver = shim
}