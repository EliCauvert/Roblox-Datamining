local makeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	fields = {
		alias = { read = makeDefaultReadPolicyModule("") },
		contactName = { read = makeDefaultReadPolicyModule("") },
		platformName = {
			read = if require(script:FindFirstAncestor("ApolloLocalState").Parent.SharedFlags).FFlagUserProfilePlatformProfile then nil else makeDefaultReadPolicyModule("")
		}
	}
}