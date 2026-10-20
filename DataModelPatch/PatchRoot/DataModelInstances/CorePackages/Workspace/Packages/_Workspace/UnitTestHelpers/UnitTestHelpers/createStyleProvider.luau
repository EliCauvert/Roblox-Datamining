local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme

return function(p1, p2)
	-- upvalues: RoactModule (copy), StyleProviderWithDefaultTheme (copy)
	return RoactModule.createElement(StyleProviderWithDefaultTheme, {
		withUiModeSupport = if p2 then p2.withUiModeSupport else false,
		withDarkTheme = if p2 then p2.withDarkTheme else nil
	}, p1)
end