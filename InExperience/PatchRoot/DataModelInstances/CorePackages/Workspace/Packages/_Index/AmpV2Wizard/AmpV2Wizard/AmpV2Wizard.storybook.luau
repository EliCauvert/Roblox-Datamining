local Parent = script:FindFirstAncestor("AmpV2Wizard").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(Parent.UniversalAppPolicy).AppFeaturePolicies
local RoduxModule = require(Parent.Dev.Rodux)
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.Dev.AppLocales).Localization
local FoundationProvider = FoundationModule.FoundationProvider
local NewResult = RoduxModule.Store.new(function()
	return { ScreenSize = Vector2.new(390, 844) }
end, { ScreenSize = Vector2.new(390, 844) }, { RoduxModule.thunkMiddleware })
local EnUs = Localization.new("en-us")
local config = {
	Default = FoundationModule.Enums.ColorMode.Dark,
	Light = FoundationModule.Enums.ColorMode.Light,
	Dark = FoundationModule.Enums.ColorMode.Dark
}
local config1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Tablet = "Tablet",
	Phone = "Phone",
	Console = "Console"
}

return {
	name = script.Parent.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), RoactRoduxModule (copy), NewResult (copy), LocalizationProvider (copy), EnUs (copy), FoundationProvider (copy), config (copy), config1 (copy), AppStyleProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), RoactAppPolicy (upval), AppFeaturePolicies (upval), RoactRoduxModule (upval), NewResult (upval), LocalizationProvider (upval), EnUs (upval), FoundationProvider (upval), config (upval), config1 (upval), AppStyleProvider (upval), p1 (copy)
			return ReactModule.createElement(RoactAppPolicy.Provider, {
				policy = { AppFeaturePolicies },
				policyData = { hasWebViewSupportForFAE = true }
			}, {
				Store = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = NewResult }, {
					Localization = ReactModule.createElement(LocalizationProvider, { localization = EnUs }, {
						Foundation = ReactModule.createElement(FoundationProvider, {
							colorMode = p2 and config[p2.theme] or config.Default,
							device = p2 and config1[p2.platform] or "Desktop"
						}, {
							AppStyle = ReactModule.createElement(AppStyleProvider, {
								style = {
									fontName = "Gotham",
									themeName = p2 and config[p2.theme] or config.Default
								}
							}, { Story = ReactModule.createElement(p1, p2) })
						})
					})
				})
			})
		end
	end,
	storyRoots = { script.Parent }
}