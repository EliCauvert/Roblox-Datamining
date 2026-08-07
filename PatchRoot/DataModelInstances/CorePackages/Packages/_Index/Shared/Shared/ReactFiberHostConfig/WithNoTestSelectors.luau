-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local invariantModule = require(script.Parent.Parent.invariant)

local function shim(...) --[[ line: 16 ]]
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