-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.LuauPolyfill)
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLError = graphQLModule.GraphQLError
local versionInfo = graphQLModule.versionInfo
local _ = require(script.Parent.types)

local function createGraphQLError(p0, p1) --[[ line: 37 ]]
	-- upvalues: versionInfo (ref), graphQLError (ref)
	return if versionInfo.major >= 17 then graphQLError.new(p0, p1) else graphQLError.new(p0, if typeof(p1) == "table" then p1.nodes else nil, if typeof(p1) == "table" then p1.source else nil, if typeof(p1) == "table" then p1.positions else nil, if typeof(p1) == "table" then p1.path else nil, if typeof(p1) == "table" then p1.originalError else nil, if typeof(p1) == "table" then p1.extensions else nil)
end

t.createGraphQLError = createGraphQLError

function t.relocatedError(p2, p3) --[[ line: 55 ]]
	-- upvalues: createGraphQLError (ref)
	return createGraphQLError(p2.message, {
		nodes = p2.nodes,
		source = p2.source,
		positions = p2.positions,
		path = if p3 == nil then p2.path else p3,
		originalError = p2,
		extensions = p2.extensions
	})
end

return t