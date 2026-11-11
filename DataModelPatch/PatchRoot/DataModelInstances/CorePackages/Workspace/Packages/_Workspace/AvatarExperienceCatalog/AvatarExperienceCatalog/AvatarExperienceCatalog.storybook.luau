local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local AppStyleProvider = require(Parent.UIBlox).App.Style.AppStyleProvider
local DesignTokenProvider = require(Parent.Dev.Style).DesignTokenProvider
local Localization = require(Parent.Dev.AppLocales).Localization
local AppStyleProvider1 = require(Parent.Dev.Style).AppStyleProvider

local function createStore()
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}))
end

local config = { Light = Theme.Light, Dark = Theme.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }
local config2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceCatalog",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), AppStyleProvider (copy), config2 (copy), AppStyleProvider1 (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy), FoundationProvider (copy), config1 (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), LocalizationProvider (upval), Localization (upval), AppStyleProvider (upval), config2 (upval), AppStyleProvider1 (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), FoundationProvider (upval), config1 (upval), p1 (copy)
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
				LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = Localization.new("en-us") }, {
					AppStyleProvider = ReactModule.createElement(AppStyleProvider, { style = p2 and config2[p2.theme] or config2.Default }, {
						StyleProvider = ReactModule.createElement(AppStyleProvider1, { style = p2 and config2[p2.theme] or config2.Default }, {
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
				})
			})
		end
	end
}