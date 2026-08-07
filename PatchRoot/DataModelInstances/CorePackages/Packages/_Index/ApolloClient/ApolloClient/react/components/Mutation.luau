-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent
local boolean = require(parent.Parent.LuauPolyfill).Boolean
local _ = require(parent.core)
local _ = require(script.Parent.types)
local useMutation = require(script.Parent.Parent.hooks).useMutation

function t.Mutation(p0) --[[ line: 31 ]]
	-- upvalues: useMutation (ref), boolean (ref)
	local unpacked, unpacked_1 = table.unpack(useMutation(p0.mutation, p0), 1, 2)
	
	return if boolean.toJSBoolean(p0.children) then p0.children(unpacked, unpacked_1) else nil
end

return t