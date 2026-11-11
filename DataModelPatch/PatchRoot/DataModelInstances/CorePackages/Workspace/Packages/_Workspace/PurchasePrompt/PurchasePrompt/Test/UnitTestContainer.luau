local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local LocalizationService = game:GetService("LocalizationService")
local PurchasePromptDepsModule = require(Parent.PurchasePromptDeps)
local Roact = PurchasePromptDepsModule.Roact
local Rodux = PurchasePromptDepsModule.Rodux
local RoactRodux = PurchasePromptDepsModule.RoactRodux
local LocaleProvider = require(Parent.IAPExperience).Locale.LocaleProvider
local LayoutValuesProviderModule = require(PurchasePrompt.Components.Connection.LayoutValuesProvider)
local LocalizationContextProviderModule = require(PurchasePrompt.Components.Connection.LocalizationContextProvider)
local ReducerModule = require(PurchasePrompt.Reducers.Reducer)
local LayoutValuesModule = require(PurchasePrompt.Services.LayoutValues)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local Localization = require(Parent.RobloxAppLocales).Localization
local UnitTestContainer = Roact.Component:extend("UnitTestContainer")

function UnitTestContainer.init(p1)
	-- upvalues: LayoutValuesModule (copy), Rodux (copy), ReducerModule (copy), LocalizationService (copy), Localization (copy)
	p1.layoutValues = LayoutValuesModule.new(false).layout
	p1.store = p1.props.overrideStore or Rodux.Store.new(ReducerModule, {})
	p1.localizationContext = Localization.new(p1.props.overrideLocale or LocalizationService.RobloxLocaleId)
end

function UnitTestContainer.render(p1)
	-- upvalues: Roact (copy), RoactRodux (copy), LocaleProvider (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy), LocalizationContextProviderModule (copy), LayoutValuesProviderModule (copy)
	assert(p1.props[Roact.Children] ~= nil and #p1.props[Roact.Children] > 0, "UnitTestContainer: no children provided, nothing will be tested")
	
	return Roact.createElement(RoactRodux.StoreProvider, { store = p1.store }, {
		LocaleProvider = Roact.createElement(LocaleProvider, { locale = LocalizationService.RobloxLocaleId }, {
			StyleProvider = Roact.createElement(StyleProviderWithDefaultTheme, {
				LocalizationContextProvider = Roact.createElement(LocalizationContextProviderModule, {
					localizationContext = p1.localizationContext,
					render = function()
						-- upvalues: Roact (upval), LayoutValuesProviderModule (upval), p1 (copy)
						return Roact.createElement(LayoutValuesProviderModule, {
							isTenFootInterface = false,
							render = function()
								-- upvalues: Roact (upval), p1 (upval)
								return Roact.createElement("ScreenGui", { AutoLocalize = false, IgnoreGuiInset = true }, p1.props[Roact.Children])
							end
						})
					end
				})
			})
		})
	})
end

return UnitTestContainer