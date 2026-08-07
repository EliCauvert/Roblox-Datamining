-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local _ = require(parent.GraphQL)

function t.graphQLResultHasError(p0) --[[ line: 18 ]]
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p0.errors) then true else false
end

return t