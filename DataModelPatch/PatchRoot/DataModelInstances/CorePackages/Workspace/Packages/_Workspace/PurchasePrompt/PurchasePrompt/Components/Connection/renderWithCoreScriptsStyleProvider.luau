local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local ReactModule = require(Parent.React)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme

return function(p1, p2)
	-- upvalues: ReactModule (copy), StyleProviderWithDefaultTheme (copy)
	return ReactModule.createElement(StyleProviderWithDefaultTheme, {
		withUiModeSupport = if p2 then p2.withUiModeSupport else false,
		withDarkTheme = not p2 or p2.withDarkTheme
	}, p1)
end