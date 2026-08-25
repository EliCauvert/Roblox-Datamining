local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.LuauPolyfill).console

local function _(p0)
	-- upvalues: console (ref)
	return function()
		-- upvalues: console (copy), p0 (ref)
		console.error(p0 .. " is only available in tests, not in production")
	end
end

return {
	ReactCurrentDispatcher = require(script.ReactCurrentDispatcher),
	ReactCurrentBatchConfig = require(script.ReactCurrentBatchConfig),
	ReactCurrentOwner = require(script.ReactCurrentOwner),
	IsSomeRendererActing = require(script.IsSomeRendererActing),
	ReactDebugCurrentFrame = if reactGlobalsModule.__DEV__ then require(script.ReactDebugCurrentFrame) else { setExtraStackFrame = function(_) end }
}