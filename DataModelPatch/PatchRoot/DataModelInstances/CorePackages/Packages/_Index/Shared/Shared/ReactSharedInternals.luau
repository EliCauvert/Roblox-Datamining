local Parent = script.Parent.Parent
local Console = require(Parent.LuauPolyfill).console

local function _(p1)
	-- upvalues: Console (copy)
	return function()
		-- upvalues: Console (upval), p1 (copy)
		Console.error(p1 .. " is only available in tests, not in production")
	end
end

local ReactDebugCurrentFrameModule = require(script.ReactDebugCurrentFrame)

return {
	ReactCurrentDispatcher = require(script.ReactCurrentDispatcher),
	ReactCurrentBatchConfig = require(script.ReactCurrentBatchConfig),
	ReactCurrentOwner = require(script.ReactCurrentOwner),
	IsSomeRendererActing = require(script.IsSomeRendererActing),
	ReactDebugCurrentFrame = if require(Parent.ReactGlobals).__DEV__ then ReactDebugCurrentFrameModule else { setExtraStackFrame = function(_) end }
}