local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local FoundationProvider = FoundationModule.FoundationProvider
local NewResult = require(Parent1.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return {
	name = Parent.Name,
	storyRoot = Parent,
	roact = ReactModule,
	reactRoblox = require(Parent1.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), NewResult (copy), FoundationProvider (copy), FoundationModule (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), NewResult (upval), FoundationProvider (upval), FoundationModule (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}