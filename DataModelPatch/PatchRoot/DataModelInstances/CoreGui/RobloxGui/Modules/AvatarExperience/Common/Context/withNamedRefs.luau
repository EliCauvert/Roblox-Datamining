local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NamedRefsContextModule = require(Modules.AvatarExperience.Common.Context.NamedRefsContext)
local WithContextValueModule = require(Modules.AvatarExperience.Common.withContextValue)

return function(p1)
	-- upvalues: WithContextValueModule (copy), NamedRefsContextModule (copy)
	return WithContextValueModule(p1, NamedRefsContextModule.Consumer, "namedRefs")
end