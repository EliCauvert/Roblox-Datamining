local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local Localization = require(Parent1.InExperienceLocales).Localization
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local KeybindContextProviderModule = require(Parent.Context.KeybindContextProvider)
local NewLocalization = Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local FoundationProvider = FoundationModule.FoundationProvider

return {
	name = Parent.Name,
	storyRoot = Parent,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), NewLocalization (copy), KeybindContextProviderModule (copy), FoundationProvider (copy), FoundationModule (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), NewLocalization (upval), KeybindContextProviderModule (upval), FoundationProvider (upval), FoundationModule (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
				KeybindContextProvider = ReactModule.createElement(KeybindContextProviderModule, nil, {
					FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, { ReactModule.createElement(p1, p2) })
				})
			})
		end
	end
}