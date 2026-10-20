local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local _ = require(GraphQLServer.Parent.LuauPolyfill)
local GraphQLError = require(GraphQLServer.Parent.GraphQL).GraphQLError
local FormatUserProfileFieldsModule = require(GraphQLServer.graphql.utils.formatUserProfileFields)
local _ = require(script.Parent.Parent.generatedTypes)
local FFlagUserProfileBetterErrorsModule = require(GraphQLServer.Flags.FFlagUserProfileBetterErrors)

return {
	UserProfile = {
		id = function(p1): string
			return (tostring(p1.userId))
		end,
		displayName = function()
			-- upvalues: GraphQLError (copy)
			return GraphQLError.new("The displayName field is not available on the UserProfile implementation of User, please use the names field instead")
		end
	},
	Query = {
		userProfiles = function(_, p1, p2, p3)
			-- upvalues: FormatUserProfileFieldsModule (copy), FFlagUserProfileBetterErrorsModule (copy)
			return p2.dataLoaders.userProfiles:getLoader(p2.fetchImpl, (FormatUserProfileFieldsModule(p3, p2.collectSubFieldsImpl))):loadMany(p1.userIds):andThen(function(Result)
				return Result or {}
			end):catch(function(Err)
				-- upvalues: FFlagUserProfileBetterErrorsModule (upval)
				return if FFlagUserProfileBetterErrorsModule then Err else {}
			end)
		end
	}
}