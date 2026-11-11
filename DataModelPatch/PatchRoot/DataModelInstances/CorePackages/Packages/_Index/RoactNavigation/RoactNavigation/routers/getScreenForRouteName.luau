local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InvariantModule = require(Parent.utils.invariant)
local IsValidScreenComponentModule = require(Parent.utils.isValidScreenComponent)

return function(p1, p2)
	-- upvalues: Array (copy), Object (copy), InvariantModule (copy), IsValidScreenComponentModule (copy)
	local v1 = p1[p2]
	
	if v1 == nil then
		error(("There is no route defined for key %s.\nMust be one of: %s"):format(p2, table.concat(Array.map(Object.keys(p1), function(p3): string
			return ("'%s'"):format(p3)
		end), ",")), 2)
	end
	if type(v1) == "table" then
		if v1.screen ~= nil then
			InvariantModule(IsValidScreenComponentModule(v1.screen), "screen for key '%s' must be a valid Roact component.", p2)
			
			return v1.screen
		elseif type(v1.getScreen) == "function" then
			local Screen = v1.getScreen()
			InvariantModule(IsValidScreenComponentModule(Screen), "The getScreen defined for route '%s' didn't return a valid screen or navigator.\n\nPlease pass it like this:\n%s = {\n    getScreen: function() return MyScreen end\n}", p2, p2)
			
			return Screen
		end
	end
	InvariantModule(IsValidScreenComponentModule(v1), "Value for key '%s' must be a route config table or a valid Roact component.", p2)
	
	return v1
end