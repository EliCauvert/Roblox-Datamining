local CorePackages = game:GetService("CorePackages")

return function()
	-- upvalues: CorePackages (copy)
	local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
	ServerDrivenUiModule.registerDiscoveryImpressions()
	ServerDrivenUiModule.registerDiscoveryActionTelemetryHandlers()
end