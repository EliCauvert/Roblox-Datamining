-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:35 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local devAssert = require(parent.jsutils.devAssert).devAssert
local instanceOfModule = require(parent.jsutils.instanceOf)
local t = {}
t.__index = t

function t.new(p0, p1, p2) --[[ line: 39 ]]
	-- upvalues: devAssert (ref), inspect (ref), t (ref)
	p1 = p1 or "GraphQL request"
	p2 = p2 or { line = 1, column = 1 }
	devAssert(typeof(p0) == "string", "Body must be a string. Received: " .. inspect(p0) .. ".")
	local t_1 = { body = p0, name = p1, locationOffset = p2 }
	devAssert(t_1.locationOffset.line > 0, "line in locationOffset is 1-indexed and must be positive.")
	devAssert(t_1.locationOffset.column > 0, "column in locationOffset is 1-indexed and must be positive.")
	
	return setmetatable(t_1, t)
end

function t:__tostring() --[[ line: 61 ]]
	return "{table Source}"
end

function isSource(p3) --[[ line: 71 ]]
	-- upvalues: instanceOfModule (ref), t (ref)
	return instanceOfModule(p3, t)
end

return { Source = t, isSource = isSource }