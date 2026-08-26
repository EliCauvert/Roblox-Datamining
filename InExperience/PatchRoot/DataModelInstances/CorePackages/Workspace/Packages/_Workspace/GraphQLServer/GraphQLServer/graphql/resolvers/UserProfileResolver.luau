local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local _ = require(graphQLServer.Parent.LuauPolyfill)
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local formatUserProfileFieldsModule = require(graphQLServer.graphql.utils.formatUserProfileFields)
local _ = require(script.Parent.Parent.generatedTypes)
local fFlagUserProfileBetterErrorsModule = require(graphQLServer.Flags.FFlagUserProfileBetterErrors)

return {
	UserProfile = {
		id = function(p1)
			return tostring(p1.userId)
		end,
		displayName = function()
			-- upvalues: graphQLError (ref)
			return graphQLError.new("The displayName field is not available on the UserProfile implementation of User, please use the names field instead")
		end
	},
	Query = {
		userProfiles = function(_, p1, p2, p3)
			-- upvalues: formatUserProfileFieldsModule (ref), fFlagUserProfileBetterErrorsModule (ref)
			return p2.dataLoaders.userProfiles:getLoader(p2.fetchImpl, formatUserProfileFieldsModule(p3, p2.collectSubFieldsImpl)):loadMany(p1.userIds):andThen(function(p4)
				return p4 or {}
			end):catch(function(p4)
				-- upvalues: fFlagUserProfileBetterErrorsModule (copy)
				return if fFlagUserProfileBetterErrorsModule then p4 else {}
			end)
		end
	}
}