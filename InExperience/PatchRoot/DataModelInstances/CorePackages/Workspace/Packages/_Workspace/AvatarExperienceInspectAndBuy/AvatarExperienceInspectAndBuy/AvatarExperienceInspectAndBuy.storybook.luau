local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createLocalization() --[[ Line: 23 ]]
	return {
		Format = function(_, p1) --[[ Line: 25 ]]
			return p1
		end,
		GetLocale = function(): string --[[ Line: 28 ]]
			return "locale"
		end
	}
end

local function createStore() --[[ Line: 34 ]]
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}), nil, { RoduxModule.makeThunkMiddleware({}) })
end

local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }
local config2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceInspectAndBuy",
	storyRoot = AvatarExperienceInspectAndBuy,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1) --[[ Line: 71 ]]
		-- upvalues: config (copy), ReactModule (copy), LocalizationProvider (copy), createLocalization (copy), AppStyleProvider (copy), config2 (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy), FoundationProvider (copy), config1 (copy)
		return function(p2) --[[ Line: 72 ]]
			-- upvalues: config (upval), ReactModule (upval), LocalizationProvider (upval), createLocalization (upval), AppStyleProvider (upval), config2 (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), FoundationProvider (upval), config1 (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = createLocalization() }, {
				AppStyleProvider = ReactModule.createElement(AppStyleProvider, { style = p2 and config2[p2.theme] or config2.Default }, {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
							FoundationProvider = ReactModule.createElement(FoundationProvider, {
								colorMode = config[p2.theme],
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