local SignalsReactModule = require(game:GetService("CorePackages").Packages.SignalsReact)
local GetEdpServerIxpVariablesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.ExperienceDetails.getEdpServerIxpVariablesStore)

return function()
	-- upvalues: SignalsReactModule (copy), GetEdpServerIxpVariablesStoreModule (copy)
	return SignalsReactModule.useSignalState(GetEdpServerIxpVariablesStoreModule().getEdpServerIxpVariablesGetter)
end