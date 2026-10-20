local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local RoduxModule = require(Parent.Dev.Rodux)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local AppStyleProvider = require(Parent.Style).AppStyleProvider
local AppStyleProvider1 = UIBloxModule.App.Style.AppStyleProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider

local function createLocalization()
	return {
		Format = function(_, p1)
			return p1
		end,
		GetLocale = function(): string
			return "locale"
		end
	}
end

local function createStore()
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}))
end

local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }
local config2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "UIKit",
	group = "AvatarExperience",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), RoactRoduxModule (copy), createStore (copy), FoundationProvider (copy), config1 (copy), AppStyleProvider1 (copy), config2 (copy), AppStyleProvider (copy), DesignTokenProvider (copy), LocalizationProvider (copy), createLocalization (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), RoactRoduxModule (upval), createStore (upval), FoundationProvider (upval), config1 (upval), p1 (copy), AppStyleProvider1 (upval), config2 (upval), AppStyleProvider (upval), DesignTokenProvider (upval), LocalizationProvider (upval), createLocalization (upval)
			local Entry = config[p2.theme]
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = createLocalization() }, if p2.definition.foundationOnly then {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
						FoundationProvider = ReactModule.createElement(FoundationProvider, {
							colorMode = Entry,
							device = config1[p2.platform],
							preferences = p2.settings,
							scale = p2.settings and p2.settings.scale
						}, { Child = ReactModule.createElement(p1, p2) })
					})
				} else {
					AppStyleProvider = ReactModule.createElement(AppStyleProvider1, { style = p2 and config2[p2.theme] or config2.Default }, {
						StyleProvider = ReactModule.createElement(AppStyleProvider, { style = p2 and config2[p2.theme] or config2.Default }, {
							StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
								DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
									FoundationProvider = ReactModule.createElement(FoundationProvider, {
										colorMode = Entry,
										device = config1[p2.platform],
										preferences = p2.settings,
										scale = p2.settings and p2.settings.scale
									}, { Child = ReactModule.createElement(p1, p2) })
								})
							})
						})
					})
				})
			})
		end
	end
}