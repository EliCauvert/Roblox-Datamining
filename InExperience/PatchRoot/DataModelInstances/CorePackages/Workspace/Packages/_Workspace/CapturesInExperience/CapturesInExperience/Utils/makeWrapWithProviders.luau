local parent = script.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local localization = require(parent_1.RobloxAppLocales).Localization
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local reactModule = require(parent_1.React)
local roactModule = require(parent_1.Roact)
local roactRoduxModule = require(parent_1.RoactRodux)
local foundationProvider = foundationModule.FoundationProvider
local styleProviderWithDefaultTheme = require(parent_1.Style).StyleProviderWithDefaultTheme
local capturesContextModule = require(parent.Context.CapturesContext)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local constantsModule = require(parent.Constants)
local _ = require(parent.Types)

return function(p0, p1) --[[ line: 20 | named "makeWrapWithProviders" ]]
	-- upvalues: reactModule (ref), roactModule (ref), roactRoduxModule (ref), capturesPolicyModule (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), localization (ref), capturesContextModule (ref), foundationProvider (ref), foundationModule (ref), constantsModule (ref)
	local var7 = function(p2, p3) --[[ line: 23 ]]
		-- upvalues: reactModule (copy)
		return if p2 then reactModule.createElement("Folder", { Name = p2 }, p3) else p3
	end
	
	return function(p4, p5, p6, p7) --[[ line: 33 ]]
		-- upvalues: roactModule (copy), reactModule (copy), roactRoduxModule (copy), p0 (ref), capturesPolicyModule (copy), styleProviderWithDefaultTheme (copy), localizationProvider (copy), localization (copy), p1 (ref), capturesContextModule (copy), var7 (ref), foundationProvider (copy), foundationModule (copy), constantsModule (copy)
		return roactModule.mount(reactModule.createElement(roactRoduxModule.StoreProvider, { store = p0 }, {
			PolicyProvider = roactModule.createElement(capturesPolicyModule.Provider, { policy = { capturesPolicyModule.Mapper } }, {
				StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, {
					LocalizationProvider = roactModule.createElement(localizationProvider, {
						localization = localization.new(p1.LocalizationService.RobloxLocaleId)
					}, {
						ContextProvider = roactModule.createElement(capturesContextModule.Provider, { value = p5 }, {
							Portal = roactModule.createElement(roactModule.Portal, { target = p4 }, var7(p7, {
								FoundationProvider = reactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, { p6 })
							}))
						})
					})
				})
			})
		}), nil, constantsModule.ReactName)
	end
end