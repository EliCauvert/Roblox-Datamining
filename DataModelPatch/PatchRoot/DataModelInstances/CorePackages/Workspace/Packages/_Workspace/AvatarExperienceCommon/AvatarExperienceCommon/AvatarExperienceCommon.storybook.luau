local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local RoduxModule = require(Parent.Rodux)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local RoactRoduxModule = require(Parent.RoactRodux)
local AppStyleProvider = require(Parent.Style).AppStyleProvider
local AppStyleProvider1 = UIBloxModule.App.Style.AppStyleProvider

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
	name = "AvatarExperienceCommon",
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), AppStyleProvider1 (copy), config2 (copy), AppStyleProvider (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy), FoundationProvider (copy), config1 (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), AppStyleProvider1 (upval), config2 (upval), AppStyleProvider (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), FoundationProvider (upval), config1 (upval), p1 (copy)
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
				AppStyleProvider = ReactModule.createElement(AppStyleProvider1, { style = p2 and config2[p2.theme] or config2.Default }, {
					StyleProvider = ReactModule.createElement(AppStyleProvider, { style = p2 and config2[p2.theme] or config2.Default }, {
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
		end
	end
}