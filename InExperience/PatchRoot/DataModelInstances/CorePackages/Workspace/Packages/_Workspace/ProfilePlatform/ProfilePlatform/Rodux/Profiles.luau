local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.Rodux).combineReducers({
	Community = require(profilePlatform.Rodux.ProfileTypes.Community),
	User = require(profilePlatform.Rodux.ProfileTypes.User),
	Contact = require(profilePlatform.Rodux.ProfileTypes.Contact)
})