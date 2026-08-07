local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local invariantModule = require(parent.utils.invariant)
local isValidScreenComponentModule = require(parent.utils.isValidScreenComponent)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: array (ref), object (ref), invariantModule (ref), isValidScreenComponentModule (ref)
	local var3 = p0[p1]
	
	if var3 == nil then
		error(("There is no route defined for key %s.\nMust be one of: %s"):format(p1, table.concat(array.map(object.keys(p0), function(p2) --[[ line: 16 ]]
			return ("'%s'"):format(p2)
		end), ",")), 2)
	end
	if type(var3) == "table" then
		if var3.screen ~= nil then
			invariantModule(isValidScreenComponentModule(var3.screen), "screen for key '%s' must be a valid Roact component.", p1)
			
			return var3.screen
		elseif type(var3.getScreen) == "function" then
			local screen = var3.getScreen()
			invariantModule(isValidScreenComponentModule(screen), "The getScreen defined for route '%s' didn't return a valid screen or navigator.\n\nPlease pass it like this:\n%s = {\n    getScreen: function() return MyScreen end\n}", p1, p1)
			
			return screen
		end
	end
	invariantModule(isValidScreenComponentModule(var3), "Value for key '%s' must be a route config table or a valid Roact component.", p1)
	
	return var3
end