local LocalizationService = game:GetService("LocalizationService")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local Localization = require(Parent.Dev.RobloxAppLocales).Localization
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local FoundationProvider = FoundationModule.FoundationProvider
local config = { Dark = ColorMode.Dark, Light = ColorMode.Light }

return {
	name = "Moments",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), LocalizationProvider (copy), FoundationProvider (copy), config (copy), ColorMode (copy), Device (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), Localization (upval), LocalizationService (upval), LocalizationProvider (upval), FoundationProvider (upval), config (upval), ColorMode (upval), Device (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, {
				localization = ReactModule.useMemo(function()
					-- upvalues: Localization (upval), LocalizationService (upval)
					return Localization.new(LocalizationService.RobloxLocaleId)
				end, {})
			}, {
				Foundation = ReactModule.createElement(FoundationProvider, {
					colorMode = config[p2.theme] or ColorMode.Dark,
					device = Device[p2.platform] or Device.Phone,
					preferences = p2.settings,
					scale = p2.settings and p2.settings.scale
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end,
	storyRoots = { Moments }
}