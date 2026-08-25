local corePackagesService = game:GetService("CorePackages")
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local getPlaytestModeStoreModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)

return function()
	-- upvalues: getPlaytestModeStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(getPlaytestModeStoreModule(false).getIsPlaytestMode)
end