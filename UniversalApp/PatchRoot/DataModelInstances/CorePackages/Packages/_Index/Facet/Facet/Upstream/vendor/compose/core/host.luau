local _ = require("./reactive/types")
local v1 = nil

local function fail(p1, Name, p2, p3)
	-- upvalues: v1 (ref)
	local V1 = v1 or require("./host-validation")
	v1 = V1
	
	return V1(p1, Name, p2, p3)
end

local list = {
	"createNode", "setProperty", "clearProperty", "insertChild", "removeChild",
	"destroyNode"
}

return {
	validate = function(p1)
		-- upvalues: fail (copy), list (copy)
		if type(p1) ~= "table" then
			return fail("not-a-host", nil, p1)
		end
		if type(p1.name) ~= "string" or p1.name == "" then
			return fail("unnamed")
		end
		if type(p1.render) ~= "table" then
			return fail("no-renderer", p1.name)
		end
		local Render = p1.render
		local config = {
			createNode = Render.createNode,
			setProperty = Render.setProperty,
			clearProperty = Render.clearProperty,
			insertChild = Render.insertChild,
			removeChild = Render.removeChild,
			destroyNode = Render.destroyNode
		}
		
		for _, value in list do
			if type(config[value]) ~= "function" then
				return fail("incomplete-renderer", p1.name, config[value], value)
			end
		end
		local Events = p1.events
		
		if Events ~= nil and type(Events.connectEvent) ~= "function" then
			return fail("incomplete-events", p1.name)
		end
		local Observation = p1.observation
		
		if Observation ~= nil then
			if type(Observation.readProperty) ~= "function" or type(Observation.observeProperty) ~= "function" then
				return fail("incomplete-observation", p1.name)
			elseif (Observation.readStyledProperty ~= nil or Observation.observeStyledProperty ~= nil) and (type(Observation.readStyledProperty) ~= "function" or type(Observation.observeStyledProperty) ~= "function") then
				return fail("incomplete-styled-observation")
			end
		end
		local Naming = p1.naming
		
		if Naming ~= nil and type(Naming.setName) ~= "function" then
			return fail("incomplete-naming", p1.name)
		end
		local Frames = p1.frames
		
		if Frames == nil or type(Frames.onFrame) == "function" and type(Frames.now) == "function" then return end
		return fail("incomplete-frames", p1.name)
	end,
	describeNode = function(p2, p3)
		local DescribeNode = p2.describeNode
		
		if DescribeNode ~= nil and (type(p3) == "table" or type(p3) == "userdata") then
			local Success, Result = pcall(DescribeNode, p3)
			
			if Success and type(Result) == "string" then
				return Result
			end
		end
		return (tostring(p3))
	end,
	typeNameOf = function(p2, p3)
		local TypeNameOfFunction = p2.typeNameOf
		
		return if TypeNameOfFunction == nil then typeof(p3) else TypeNameOfFunction(p3)
	end,
	classifyKey = function(p2, p3, p4)
		local Events = p2.events
		
		if Events == nil then
			return "property"
		else
			local ClassifyKeyFunction = Events.classifyKey
			
			return if ClassifyKeyFunction == nil then "property" else ClassifyKeyFunction(p3, p4)
		end
	end
}