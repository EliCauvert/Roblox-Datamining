local parent = script.Parent.Parent
local invariantModule = require(parent.utils.invariant)
local isValidScreenComponentModule = require(parent.utils.isValidScreenComponent)

local function _(p0) --[[ line: 6 | named "getScreenComponent" ]]
	return if p0 then if type(p0) == "table" and p0.screen then p0.screen else p0 else nil
end

return function(p1) --[[ line: 36 ]]
	-- upvalues: invariantModule (ref), isValidScreenComponentModule (ref)
	invariantModule(next(p1) ~= nil, "Please specify at least one route when configuring a navigator.")
	
	for i, v in p1 do
		local isTable = type(v) == "table"
		invariantModule(isValidScreenComponentModule(if not v then if type(v) == "table" and v.screen then v.screen else v else nil) or isTable and type(v.getScreen) == "function", "The component for route '%s' must be a Roact component or table with 'getScreen'. For example:\n\nlocal MyScreen = require(script.Parent.MyScreen)\n...\n%s = MyScreen,\n}\n\nYou can also use a navigator:\n\nlocal MyNavigator = require(script.Parent.MyNavigator)\n...\n%s = MyNavigator,\n}", i, i, i)
		
		if isTable then
			invariantModule(if v.screen ~= nil then v.getScreen == nil else true, "Route '%s' should declare a screen or a getScreen, not both.", i)
		end
	end
	return p1
end