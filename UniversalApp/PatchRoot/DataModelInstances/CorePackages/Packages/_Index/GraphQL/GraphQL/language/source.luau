local Parent = script.Parent.Parent
local InspectFunction = require(Parent.jsutils.inspect).inspect
local DevAssertFunction = require(Parent.jsutils.devAssert).devAssert
local InstanceOfModule = require(Parent.jsutils.instanceOf)
local Module = {}
Module.__index = Module

function Module.new(Body, p1, p2) --[[ Line: 39 ]]
	-- upvalues: DevAssertFunction (copy), InspectFunction (copy), Module (copy)
	local P1 = p1 or "GraphQL request"
	local P2 = p2 or { line = 1, column = 1 }
	DevAssertFunction(typeof(Body) == "string", "Body must be a string. Received: " .. InspectFunction(Body) .. ".")
	local config = { body = Body, name = P1, locationOffset = P2 }
	DevAssertFunction(config.locationOffset.line > 0, "line in locationOffset is 1-indexed and must be positive.")
	DevAssertFunction(config.locationOffset.column > 0, "column in locationOffset is 1-indexed and must be positive.")
	
	return (setmetatable(config, Module))
end

function Module:__tostring(): string --[[ Line: 61 ]]
	return "{table Source}"
end

function isSource(p1) --[[ Line: 71 ]]
	-- upvalues: InstanceOfModule (copy), Module (copy)
	return InstanceOfModule(p1, Module)
end

return { Source = Module, isSource = isSource }