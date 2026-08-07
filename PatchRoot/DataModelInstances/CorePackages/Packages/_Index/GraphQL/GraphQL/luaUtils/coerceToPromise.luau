-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.LuauPolyfill)
local promiseModule = require(parent_1.Promise)
local _ = require(parent.jsutils.PromiseOrValue)

return {
	coerceToPromise = function(p0) --[[ line: 10 ]]
		-- upvalues: promiseModule (ref)
		return if promiseModule.is(p0) then p0 else promiseModule.resolve(p0)
	end
}