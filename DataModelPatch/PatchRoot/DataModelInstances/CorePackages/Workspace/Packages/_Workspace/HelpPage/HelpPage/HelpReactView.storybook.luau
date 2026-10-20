local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local KeybindContextProviderModule = require(Parent.Context.KeybindContextProvider)
local NewResult = require(Parent1.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local FoundationProvider = FoundationModule.FoundationProvider

return {
	name = Parent.Name,
	storyRoot = Parent,
	roact = ReactModule,
	reactRoblox = require(Parent1.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), NewResult (copy), KeybindContextProviderModule (copy), FoundationProvider (copy), FoundationModule (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), NewResult (upval), KeybindContextProviderModule (upval), FoundationProvider (upval), FoundationModule (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
				KeybindContextProvider = ReactModule.createElement(KeybindContextProviderModule, nil, {
					FoundationProvider = ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, { ReactModule.createElement(p1, p2) })
				})
			})
		end
	end
}