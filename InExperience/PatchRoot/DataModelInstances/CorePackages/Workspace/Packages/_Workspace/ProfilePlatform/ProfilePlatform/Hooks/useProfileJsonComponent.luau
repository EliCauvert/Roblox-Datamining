local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileJsonModule = require(profilePlatform.Hooks.useProfileJson)

return function(p0)
	-- upvalues: useProfileJsonModule (ref), getDeepValueModule (ref)
	return getDeepValueModule(useProfileJsonModule(), `components.{p0}`) or {}
end