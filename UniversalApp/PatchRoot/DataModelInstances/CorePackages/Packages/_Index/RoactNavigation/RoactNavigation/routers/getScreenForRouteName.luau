local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local invariantModule = require(parent.utils.invariant)
local isValidScreenComponentModule = require(parent.utils.isValidScreenComponent)

return function(p1, p2)
	-- upvalues: array (ref), object (ref), invariantModule (ref), isValidScreenComponentModule (ref)
	local var1 = p1[p2]
	
	if var1 == nil then
		error(("There is no route defined for key %s.\nMust be one of: %s"):format(p2, table.concat(array.map(object.keys(p1), function(p3)
			return ("'%s'"):format(p3)
		end), ",")), 2)
	end
	if type(var1) == "table" then
		if var1.screen ~= nil then
			invariantModule(isValidScreenComponentModule(var1.screen), "screen for key '%s' must be a valid Roact component.", p2)
			
			return var1.screen
		elseif type(var1.getScreen) == "function" then
			local screen = var1.getScreen()
			invariantModule(isValidScreenComponentModule(screen), "The getScreen defined for route '%s' didn't return a valid screen or navigator.\n\nPlease pass it like this:\n%s = {\n    getScreen: function() return MyScreen end\n}", p2, p2)
			
			return screen
		end
	end
	invariantModule(isValidScreenComponentModule(var1), "Value for key '%s' must be a route config table or a valid Roact component.", p2)
	
	return var1
end