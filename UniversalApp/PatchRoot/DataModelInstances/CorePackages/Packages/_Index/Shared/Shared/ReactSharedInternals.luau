local Parent = script.Parent.Parent
local Console = require(Parent.LuauPolyfill).console

local function _(p1) --[[ Line: 28 | Named "onlyInTestError" ]]
	-- upvalues: Console (copy)
	return function() --[[ Line: 29 ]]
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
	ReactDebugCurrentFrame = if require(Parent.ReactGlobals).__DEV__ then ReactDebugCurrentFrameModule else { setExtraStackFrame = function(_) --[[ Line: 52 ]] end }
}