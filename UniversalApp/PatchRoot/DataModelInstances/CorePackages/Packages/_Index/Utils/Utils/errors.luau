local parent = script.Parent.Parent
local _ = require(parent.LuauPolyfill)
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLError = graphQLModule.GraphQLError
local versionInfo = graphQLModule.versionInfo
local _ = require(script.Parent.types)

local function createGraphQLError(p1, p2)
	-- upvalues: versionInfo (ref), graphQLError (ref)
	return if versionInfo.major >= 17 then graphQLError.new(p1, p2) else graphQLError.new(p1, if typeof(p2) == "table" then p2.nodes else nil, if typeof(p2) == "table" then p2.source else nil, if typeof(p2) == "table" then p2.positions else nil, if typeof(p2) == "table" then p2.path else nil, if typeof(p2) == "table" then p2.originalError else nil, if typeof(p2) == "table" then p2.extensions else nil)
end

t.createGraphQLError = createGraphQLError

function t.relocatedError(p1, p2)
	-- upvalues: createGraphQLError (ref)
	return createGraphQLError(p1.message, {
		nodes = p1.nodes,
		source = p1.source,
		positions = p1.positions,
		path = if p2 == nil then p1.path else p2,
		originalError = p1,
		extensions = p1.extensions
	})
end

return t