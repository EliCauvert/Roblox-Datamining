local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileJsonModule = require(profilePlatform.Hooks.useProfileJson)

return function(p1)
	-- upvalues: useProfileJsonModule (ref), getDeepValueModule (ref)
	return getDeepValueModule(useProfileJsonModule(), `components.{p1}`) or {}
end