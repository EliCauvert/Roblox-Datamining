local MakeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	fields = {
		alias = { read = MakeDefaultReadPolicyModule("") },
		contactName = { read = MakeDefaultReadPolicyModule("") },
		platformName = {
			read = if require(script:FindFirstAncestor("ApolloLocalState").Parent.SharedFlags).FFlagUserProfilePlatformProfile then nil else MakeDefaultReadPolicyModule("")
		}
	}
}