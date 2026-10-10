local parent = script:FindFirstAncestor("ApolloLocalState").Parent
local cryoModule = require(parent.Cryo)
local fFlagUserProfilePlatformProfile = require(parent.SharedFlags).FFlagUserProfilePlatformProfile

return {
	fields = {
		platformProfileId = {
			read = if fFlagUserProfilePlatformProfile then nil else require(script.Parent.utils.makeDefaultReadPolicy)("")
		},
		names = {
			merge = if fFlagUserProfilePlatformProfile then function(_, p1, p2)
				-- upvalues: cryoModule (ref)
				return if p1 and p1.platformName ~= nil and (p2 and p2.platformName == nil) then cryoModule.Dictionary.join(p2, { platformName = p1.platformName }) else p2
			end else nil
		}
	}
}