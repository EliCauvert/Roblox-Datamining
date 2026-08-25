local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local reactModule = require(parent.React)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme

return function(p0, p1)
	-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref)
	return reactModule.createElement(styleProviderWithDefaultTheme, {
		withUiModeSupport = if p1 then p1.withUiModeSupport else false,
		withDarkTheme = if p1 then p1.withDarkTheme else true
	}, p0)
end