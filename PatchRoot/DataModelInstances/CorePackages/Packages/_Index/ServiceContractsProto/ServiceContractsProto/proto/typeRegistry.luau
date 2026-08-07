-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:12 2026 Pacific Standard Time.

local t = {}
t.__index = t
local _ = require(script.Parent.message)

function t.new(p0) --[[ line: 14 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p0 do
		t_1[v.descriptor.fullName] = v
	end
	return setmetatable({ _types = t_1 }, t)
end

function t:findMessage(p1) --[[ line: 26 ]]
	return self._types[p1]
end

function t:register(p2) --[[ line: 30 ]]
	self._types[p2.descriptor.fullName] = p2
end

return { TypeRegistry = t, default = t.new({}) }