-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.LuauPolyfill).console

local function _(p0) --[[ line: 28 | named "onlyInTestError" ]]
	-- upvalues: console (ref)
	return function() --[[ line: 29 ]]
		-- upvalues: console (copy), p0 (ref)
		console.error(p0 .. " is only available in tests, not in production")
	end
end

return {
	ReactCurrentDispatcher = require(script.ReactCurrentDispatcher),
	ReactCurrentBatchConfig = require(script.ReactCurrentBatchConfig),
	ReactCurrentOwner = require(script.ReactCurrentOwner),
	IsSomeRendererActing = require(script.IsSomeRendererActing),
	ReactDebugCurrentFrame = if reactGlobalsModule.__DEV__ then require(script.ReactDebugCurrentFrame) else { setExtraStackFrame = function(_) --[[ line: 52 ]] end }
}