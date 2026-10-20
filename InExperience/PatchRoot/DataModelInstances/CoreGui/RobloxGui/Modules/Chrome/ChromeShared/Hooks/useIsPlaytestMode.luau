local CorePackages = game:GetService("CorePackages")
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local GetPlaytestModeStoreModule = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)

return function()
	-- upvalues: GetPlaytestModeStoreModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState(GetPlaytestModeStoreModule(false).getIsPlaytestMode)
end