local Parent = script.Parent.Parent
local _ = require(Parent.Parent.LuauPolyfill)
local DevAssertFunction = require(Parent.jsutils.devAssert).devAssert
local _ = require(Parent.language.location)
local _ = require(script.Parent.GraphQLError)

return {
	formatError = function(p1)
		-- upvalues: DevAssertFunction (copy)
		DevAssertFunction(p1, "Received nil error.")
		local Message = if p1.message and string.len(p1.message) > 0 then p1.message else "An unknown error occurred."
		local Locations = p1.locations
		local Path = p1.path
		local Extensions = p1.extensions
		
		return Extensions and {
			message = Message,
			locations = Locations,
			path = Path,
			extensions = Extensions
		} or { message = Message, locations = Locations, path = Path }
	end
}