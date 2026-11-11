local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.Dev.AppLocales).Localization
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore()
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}), nil, { RoduxModule.makeThunkMiddleware({}) })
end

local config = { Light = Theme.Light, Dark = Theme.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }
local config2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceSlotBasedEditor",
	storyRoot = AvatarExperienceSlotBasedEditor,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), AppStyleProvider (copy), config2 (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy), FoundationProvider (copy), config1 (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), LocalizationProvider (upval), Localization (upval), AppStyleProvider (upval), config2 (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), FoundationProvider (upval), config1 (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = Localization.new("en-us") }, {
				AppStyleProvider = ReactModule.createElement(AppStyleProvider, { style = p2 and config2[p2.theme] or config2.Default }, {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
							FoundationProvider = ReactModule.createElement(FoundationProvider, {
								theme = config[p2.theme],
								device = config1[p2.platform],
								preferences = p2.settings
							}, { Child = ReactModule.createElement(p1, p2) })
						})
					})
				})
			})
		end
	end
}