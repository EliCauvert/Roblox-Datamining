local parent = script.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local devAssert = require(parent.jsutils.devAssert).devAssert
local instanceOfModule = require(parent.jsutils.instanceOf)
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: devAssert (ref), inspect (ref), t (ref)
	p2 = p2 or "GraphQL request"
	p3 = p3 or { line = 1, column = 1 }
	devAssert(typeof(p1) == "string", "Body must be a string. Received: " .. inspect(p1) .. ".")
	local t_1 = { body = p1, name = p2, locationOffset = p3 }
	devAssert(t_1.locationOffset.line > 0, "line in locationOffset is 1-indexed and must be positive.")
	devAssert(t_1.locationOffset.column > 0, "column in locationOffset is 1-indexed and must be positive.")
	
	return setmetatable(t_1, t)
end

function t:__tostring()
	return "{table Source}"
end

function isSource(p1)
	-- upvalues: instanceOfModule (ref), t (ref)
	return instanceOfModule(p1, t)
end

return { Source = t, isSource = isSource }