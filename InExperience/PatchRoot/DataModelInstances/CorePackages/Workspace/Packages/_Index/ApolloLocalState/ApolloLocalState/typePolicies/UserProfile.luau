local Parent = script:FindFirstAncestor("ApolloLocalState").Parent
local CryoModule = require(Parent.Cryo)
local FFlagUserProfilePlatformProfile = require(Parent.SharedFlags).FFlagUserProfilePlatformProfile
local MakeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

local function mergeNames(_, p1, p2) --[[ Line: 7 ]]
	-- upvalues: CryoModule (copy)
	return if p1 and p1.platformName ~= nil and p2 and p2.platformName == nil then CryoModule.Dictionary.join(p2, { platformName = p1.platformName }) else p2
end

return {
	fields = {
		platformProfileId = {
			read = if FFlagUserProfilePlatformProfile then nil else MakeDefaultReadPolicyModule("")
		},
		names = {
			merge = if FFlagUserProfilePlatformProfile then mergeNames else nil
		}
	}
}