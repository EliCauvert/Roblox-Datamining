local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local Localization = require(Parent1.RobloxAppLocales).Localization
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local ReactModule = require(Parent1.React)
local RoactModule = require(Parent1.Roact)
local RoactRoduxModule = require(Parent1.RoactRodux)
local FoundationProvider = FoundationModule.FoundationProvider
local StyleProviderWithDefaultTheme = require(Parent1.Style).StyleProviderWithDefaultTheme
local CapturesContextModule = require(Parent.Context.CapturesContext)
local CapturesPolicyModule = require(Parent.App.CapturesPolicy)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.Types)

return function(Store, p1) --[[ Line: 24 | Named "makeWrapWithProviders" ]]
	-- upvalues: ReactModule (copy), FoundationProvider (copy), FoundationModule (copy), RoactModule (copy), RoactRoduxModule (copy), CapturesPolicyModule (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), Localization (copy), CapturesContextModule (copy), ConstantsModule (copy)
	local function v14(Name, p2) --[[ Line: 27 ]]
		-- upvalues: ReactModule (upval)
		return if Name then ReactModule.createElement("Folder", { Name = Name }, p2) else p2
	end
	
	return function(Target, Value, p2, Name, p3) --[[ Line: 37 ]]
		-- upvalues: ReactModule (upval), FoundationProvider (upval), FoundationModule (upval), RoactModule (upval), RoactRoduxModule (upval), Store (copy), CapturesPolicyModule (upval), StyleProviderWithDefaultTheme (upval), LocalizationProvider (upval), Localization (upval), p1 (copy), CapturesContextModule (upval), v14 (copy), ConstantsModule (upval)
		return RoactModule.mount(ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
			PolicyProvider = RoactModule.createElement(CapturesPolicyModule.Provider, { policy = { CapturesPolicyModule.Mapper } }, {
				StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
					LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
						localization = Localization.new(p1.LocalizationService.RobloxLocaleId)
					}, {
						ContextProvider = RoactModule.createElement(CapturesContextModule.Provider, { value = Value }, {
							Portal = RoactModule.createElement(RoactModule.Portal, { target = Target }, v14(Name, if p3 and p3.withFoundationProvider == false then p2 else {
								FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, { p2 })
							}))
						})
					})
				})
			})
		}), nil, ConstantsModule.ReactName)
	end
end