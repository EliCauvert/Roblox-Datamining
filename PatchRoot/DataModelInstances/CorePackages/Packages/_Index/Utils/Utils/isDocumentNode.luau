-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local kind = require(parent.GraphQL).Kind

function t.isDocumentNode(p0) --[[ line: 18 ]]
	-- upvalues: boolean (ref), kind (ref)
	return boolean.toJSBoolean(p0) and (typeof(p0) == "table" and (boolean.toJSBoolean(p0.kind) and p0.kind == kind.DOCUMENT))
end

return t