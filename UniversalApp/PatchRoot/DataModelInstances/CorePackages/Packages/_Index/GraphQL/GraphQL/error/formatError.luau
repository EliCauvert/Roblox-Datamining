local parent = script.Parent.Parent
local _ = require(parent.Parent.LuauPolyfill)
local devAssert = require(parent.jsutils.devAssert).devAssert
local _ = require(parent.language.location)
local _ = require(script.Parent.GraphQLError)

return {
	formatError = function(p1)
		-- upvalues: devAssert (ref)
		devAssert(p1, "Received nil error.")
		local var1 = if p1.message and string.len(p1.message) > 0 then p1.message else "An unknown error occurred."
		local locations = p1.locations
		local path = p1.path
		local extensions = p1.extensions
		
		return if extensions then {
			message = var1,
			locations = locations,
			path = path,
			extensions = extensions
		} else { message = var1, locations = locations, path = path }
	end
}