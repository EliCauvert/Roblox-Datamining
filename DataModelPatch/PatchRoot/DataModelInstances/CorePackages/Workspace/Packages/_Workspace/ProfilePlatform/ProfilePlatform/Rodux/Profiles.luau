local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(ProfilePlatform.Parent.Rodux).combineReducers({
	Community = require(ProfilePlatform.Rodux.ProfileTypes.Community),
	User = require(ProfilePlatform.Rodux.ProfileTypes.User),
	Contact = require(ProfilePlatform.Rodux.ProfileTypes.Contact)
})