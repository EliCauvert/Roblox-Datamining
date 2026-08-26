local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local styleProviderWithDefaultTheme = require(corePackagesService.Workspace.Packages.Style).StyleProviderWithDefaultTheme

return function(p1, p2)
	-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref)
	return reactModule.createElement(styleProviderWithDefaultTheme, {
		withUiModeSupport = if p2 then p2.withUiModeSupport else false,
		withDarkTheme = if p2 then p2.withDarkTheme else true
	}, p1)
end