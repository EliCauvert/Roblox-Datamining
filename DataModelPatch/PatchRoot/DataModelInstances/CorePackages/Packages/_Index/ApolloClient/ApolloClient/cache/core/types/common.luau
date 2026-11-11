local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Error = require(Parent1.LuauPolyfill).Error
local _ = require(Parent1.GraphQL)
local _ = require(Parent.utilities.graphql.types)
local self = setmetatable({}, { __index = Error })
self.__index = self

function self.new(Message, Path, Query, Variables)
	-- upvalues: Error (copy), self (copy)
	local NewError = Error.new(Message)
	NewError.message = Message
	NewError.path = Path
	NewError.query = Query
	NewError.variables = Variables
	
	return (setmetatable(NewError, self))
end

return { MissingFieldError = self }