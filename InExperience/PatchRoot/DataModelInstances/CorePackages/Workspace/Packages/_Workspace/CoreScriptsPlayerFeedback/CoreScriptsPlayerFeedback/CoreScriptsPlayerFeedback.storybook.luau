local localizationService = game:GetService("LocalizationService")
local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactRobloxModule = require(parent_1.ReactRoblox)
local foundationModule = require(parent_1.Foundation)
local localization = require(parent_1.InExperienceLocales).Localization
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local foundationProvider = foundationModule.FoundationProvider
local var1 = localization.new(localizationService.RobloxLocaleId)

return {
	name = parent.Name,
	storyRoot = parent,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), localizationProvider (ref), var1 (ref), foundationProvider (ref), foundationModule (ref)
		return function(p2)
			-- upvalues: reactModule (copy), localizationProvider (copy), var1 (copy), foundationProvider (copy), foundationModule (copy), p1 (ref)
			return reactModule.createElement(localizationProvider, { localization = var1 }, {
				FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, { Child = reactModule.createElement(p1, p2) })
			})
		end
	end
}