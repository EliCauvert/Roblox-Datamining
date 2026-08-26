local localizationService = game:GetService("LocalizationService")
local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local reactRobloxModule = require(parent_1.ReactRoblox)
local localization = require(parent_1.InExperienceLocales).Localization
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local keybindContextProviderModule = require(parent.Context.KeybindContextProvider)
local var1 = localization.new(localizationService.RobloxLocaleId)
local foundationProvider = foundationModule.FoundationProvider

return {
	name = parent.Name,
	storyRoot = parent,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), localizationProvider (ref), var1 (ref), keybindContextProviderModule (ref), foundationProvider (ref), foundationModule (ref)
		return function(p2)
			-- upvalues: reactModule (copy), localizationProvider (copy), var1 (copy), keybindContextProviderModule (copy), foundationProvider (copy), foundationModule (copy), p1 (ref)
			return reactModule.createElement(localizationProvider, { localization = var1 }, {
				KeybindContextProvider = reactModule.createElement(keybindContextProviderModule, nil, {
					FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, { reactModule.createElement(p1, p2) })
				})
			})
		end
	end
}