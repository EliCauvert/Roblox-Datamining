local Parent = script.Parent.Parent
local InvariantModule = require(Parent.utils.invariant)
local IsValidScreenComponentModule = require(Parent.utils.isValidScreenComponent)

local function _(p1) --[[ Line: 6 | Named "getScreenComponent" ]]
	return if p1 then if type(p1) == "table" and p1.screen then p1.screen else p1 else nil
end

return function(List) --[[ Line: 36 ]]
	-- upvalues: InvariantModule (copy), IsValidScreenComponentModule (copy)
	InvariantModule(next(List) ~= nil, "Please specify at least one route when configuring a navigator.")
	
	for i, value in List do
		local IsTable = type(value) == "table"
		InvariantModule(IsValidScreenComponentModule(if value then if type(value) == "table" and value.screen then value.screen else value else nil) or IsTable and type(value.getScreen) == "function", "The component for route '%s' must be a Roact component or table with 'getScreen'. For example:\n\nlocal MyScreen = require(script.Parent.MyScreen)\n...\n%s = MyScreen,\n}\n\nYou can also use a navigator:\n\nlocal MyNavigator = require(script.Parent.MyNavigator)\n...\n%s = MyNavigator,\n}", i, i, i)
		
		if IsTable then
			InvariantModule(value.screen == nil or value.getScreen == nil, "Route '%s' should declare a screen or a getScreen, not both.", i)
		end
	end
	return List
end