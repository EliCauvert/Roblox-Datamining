local Parent = script.Parent
local SignalsReactModule = require(Parent.Parent.SignalsReact)
local GetThemeBackgroundStoreModule = require(Parent.Stores.GetThemeBackgroundStore)
local _ = require(Parent.ThemeBackgroundTypes)

return function()
	-- upvalues: SignalsReactModule (copy), GetThemeBackgroundStoreModule (copy)
	return SignalsReactModule.useSignalState(GetThemeBackgroundStoreModule(false).getThemeBackground)
end