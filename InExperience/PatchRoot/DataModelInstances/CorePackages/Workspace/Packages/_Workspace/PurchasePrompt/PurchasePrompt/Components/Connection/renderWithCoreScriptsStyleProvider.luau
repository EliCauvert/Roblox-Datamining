local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local reactModule = require(parent.React)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme

return function(p1, p2)
	-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref)
	return reactModule.createElement(styleProviderWithDefaultTheme, {
		withUiModeSupport = if p2 then p2.withUiModeSupport else false,
		withDarkTheme = if p2 then p2.withDarkTheme else true
	}, p1)
end