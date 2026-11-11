local AddFriendsState = script:FindFirstAncestor("AddFriendsState")
local GetDeepValueFunction = require(AddFriendsState.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local RODUXKEYModule = require(AddFriendsState.RODUX_KEY)

return function(p1, Text, ...)
	-- upvalues: GetDeepValueFunction (copy), RODUXKEYModule (copy)
	return GetDeepValueFunction(p1, string.format(if Text then "%s." .. Text else "%s", RODUXKEYModule, unpack({ ... })))
end