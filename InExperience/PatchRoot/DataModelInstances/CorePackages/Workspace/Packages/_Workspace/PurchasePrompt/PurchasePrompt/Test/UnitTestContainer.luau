local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local localizationService = game:GetService("LocalizationService")
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local rodux = purchasePromptDepsModule.Rodux
local roactRodux = purchasePromptDepsModule.RoactRodux
local localeProvider = require(parent.IAPExperience).Locale.LocaleProvider
local layoutValuesProviderModule = require(purchasePrompt.Components.Connection.LayoutValuesProvider)
local localizationContextProviderModule = require(purchasePrompt.Components.Connection.LocalizationContextProvider)
local reducerModule = require(purchasePrompt.Reducers.Reducer)
local layoutValuesModule = require(purchasePrompt.Services.LayoutValues)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local localization = require(parent.RobloxAppLocales).Localization
local unitTestContainer = roact.Component:extend("UnitTestContainer")

function unitTestContainer.init(p0)
	-- upvalues: layoutValuesModule (ref), rodux (ref), reducerModule (ref), localizationService (ref), localization (ref)
	p0.layoutValues = layoutValuesModule.new(false).layout
	p0.store = p0.props.overrideStore or rodux.Store.new(reducerModule, {})
	p0.localizationContext = localization.new(p0.props.overrideLocale or localizationService.RobloxLocaleId)
end

function unitTestContainer.render(p1)
	-- upvalues: roact (ref), roactRodux (ref), localeProvider (ref), localizationService (ref), styleProviderWithDefaultTheme (ref), localizationContextProviderModule (ref), layoutValuesProviderModule (ref)
	assert(p1.props[roact.Children] ~= nil and #p1.props[roact.Children] > 0, "UnitTestContainer: no children provided, nothing will be tested")
	
	return roact.createElement(roactRodux.StoreProvider, { store = p1.store }, {
		LocaleProvider = roact.createElement(localeProvider, { locale = localizationService.RobloxLocaleId }, {
			StyleProvider = roact.createElement(styleProviderWithDefaultTheme, {
				LocalizationContextProvider = roact.createElement(localizationContextProviderModule, {
					localizationContext = p1.localizationContext,
					render = function()
						-- upvalues: roact (copy), layoutValuesProviderModule (copy), p1 (ref)
						return roact.createElement(layoutValuesProviderModule, {
							isTenFootInterface = false,
							render = function()
								-- upvalues: roact (copy), p1 (copy)
								return roact.createElement("ScreenGui", { AutoLocalize = false, IgnoreGuiInset = true }, p1.props[roact.Children])
							end
						})
					end
				})
			})
		})
	})
end

return unitTestContainer