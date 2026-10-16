local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local StyleProviderWithDefaultTheme = require(CorePackages.Workspace.Packages.Style).StyleProviderWithDefaultTheme

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), StyleProviderWithDefaultTheme (copy)
	return ReactModule.createElement(StyleProviderWithDefaultTheme, {
		withUiModeSupport = if p2 then p2.withUiModeSupport else false,
		withDarkTheme = not p2 or p2.withDarkTheme
	}, p1)
end