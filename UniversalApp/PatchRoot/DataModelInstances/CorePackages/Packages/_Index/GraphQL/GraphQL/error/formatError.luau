local parent = script.Parent.Parent
local _ = require(parent.Parent.LuauPolyfill)
local devAssert = require(parent.jsutils.devAssert).devAssert
local _ = require(parent.language.location)
local _ = require(script.Parent.GraphQLError)

return {
	formatError = function(p0)
		-- upvalues: devAssert (ref)
		devAssert(p0, "Received nil error.")
		local var0 = if p0.message and string.len(p0.message) > 0 then p0.message else "An unknown error occurred."
		local locations = p0.locations
		local path = p0.path
		local extensions = p0.extensions
		
		return if extensions then {
			message = var0,
			locations = locations,
			path = path,
			extensions = extensions
		} else { message = var0, locations = locations, path = path }
	end
}