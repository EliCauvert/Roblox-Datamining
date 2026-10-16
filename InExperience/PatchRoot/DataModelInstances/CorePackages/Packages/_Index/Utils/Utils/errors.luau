local Parent = script.Parent.Parent
local _ = require(Parent.LuauPolyfill)
local GraphQLModule = require(Parent.GraphQL)
local GraphQLError = GraphQLModule.GraphQLError
local VersionInfo = GraphQLModule.versionInfo
local _ = require(script.Parent.types)

local function createGraphQLError(Message, p1) --[[ Line: 37 ]]
	-- upvalues: VersionInfo (copy), GraphQLError (copy)
	return if VersionInfo.major >= 17 then GraphQLError.new(Message, p1) else GraphQLError.new(Message, if typeof(p1) == "table" then p1.nodes else nil, if typeof(p1) == "table" then p1.source else nil, if typeof(p1) == "table" then p1.positions else nil, if typeof(p1) == "table" then p1.path else nil, if typeof(p1) == "table" then p1.originalError else nil, if typeof(p1) == "table" then p1.extensions else nil)
end

return {
	createGraphQLError = createGraphQLError,
	relocatedError = function(OriginalError, p1) --[[ Line: 55 ]]
		-- upvalues: createGraphQLError (copy)
		return createGraphQLError(OriginalError.message, {
			nodes = OriginalError.nodes,
			source = OriginalError.source,
			positions = OriginalError.positions,
			path = if p1 == nil then OriginalError.path else p1,
			originalError = OriginalError,
			extensions = OriginalError.extensions
		})
	end
}