local SignalsReactModule = require(game:GetService("CorePackages").Packages.SignalsReact)
local GetEdpPerUniverseVisibilityVariablesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.ExperienceDetails.getEdpPerUniverseVisibilityVariablesStore)

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetEdpPerUniverseVisibilityVariablesStoreModule (copy)
	return SignalsReactModule.useSignalState(GetEdpPerUniverseVisibilityVariablesStoreModule(p1).getVisibilityVariables)
end