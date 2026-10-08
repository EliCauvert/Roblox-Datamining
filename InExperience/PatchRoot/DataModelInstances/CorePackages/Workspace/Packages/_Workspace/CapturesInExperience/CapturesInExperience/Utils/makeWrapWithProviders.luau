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

return function(p1, p2)
	-- upvalues: reactModule (ref), foundationProvider (ref), foundationModule (ref), roactModule (ref), roactRoduxModule (ref), capturesPolicyModule (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), localization (ref), capturesContextModule (ref), constantsModule (ref)
	local var1 = function(p3, p4)
		-- upvalues: reactModule (copy)
		return if p3 then reactModule.createElement("Folder", { Name = p3 }, p4) else p4
	end
	
	return function(p3, p4, p5, p6, p7)
		-- upvalues: reactModule (copy), foundationProvider (copy), foundationModule (copy), roactModule (copy), roactRoduxModule (copy), p1 (ref), capturesPolicyModule (copy), styleProviderWithDefaultTheme (copy), localizationProvider (copy), localization (copy), p2 (ref), capturesContextModule (copy), var1 (ref), constantsModule (copy)
		return roactModule.mount(reactModule.createElement(roactRoduxModule.StoreProvider, { store = p1 }, {
			PolicyProvider = roactModule.createElement(capturesPolicyModule.Provider, { policy = { capturesPolicyModule.Mapper } }, {
				StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, {
					LocalizationProvider = roactModule.createElement(localizationProvider, {
						localization = localization.new(p2.LocalizationService.RobloxLocaleId)
					}, {
						ContextProvider = roactModule.createElement(capturesContextModule.Provider, { value = p4 }, {
							Portal = roactModule.createElement(roactModule.Portal, { target = p3 }, var1(p6, if p7 and p7.withFoundationProvider == false then p5 else {
								FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, { p5 })
							}))
						})
					})
				})
			})
		}), nil, constantsModule.ReactName)
	end
end