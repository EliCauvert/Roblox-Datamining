local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Common.Enums)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local UseProfileJsonModule = require(ProfilePlatform.Hooks.useProfileJson)

return function(p1)
	-- upvalues: UseProfileJsonModule (copy), GetDeepValueModule (copy)
	return GetDeepValueModule(UseProfileJsonModule(), `components.{p1}`) or {}
end