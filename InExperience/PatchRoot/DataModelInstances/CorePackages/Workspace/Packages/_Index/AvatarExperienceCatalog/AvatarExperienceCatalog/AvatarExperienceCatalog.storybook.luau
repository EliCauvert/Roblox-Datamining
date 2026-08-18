local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local localizationProvider = require(parent.Localization).LocalizationProvider
local appStyleProvider = require(parent.UIBlox).App.Style.AppStyleProvider
local designTokenProvider = require(parent.Dev.Style).DesignTokenProvider
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local localization = require(parent.Dev.AppLocales).Localization
local appStyleProvider_1 = require(parent.Dev.Style).AppStyleProvider

local function createStore() --[[ line: 19 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(roduxModule.createReducer({}, {}))
end

local t = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_1 = { Console = device.Console, Desktop = device.Desktop }
local t_2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceCatalog",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p0) --[[ line: 48 ]]
		-- upvalues: t (ref), reactModule (ref), localizationProvider (ref), localization (ref), appStyleProvider (ref), t_2 (ref), appStyleProvider_1 (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref), foundationProvider (ref), t_1 (ref)
		return function(p1) --[[ line: 49 ]]
			-- upvalues: t (copy), reactModule (copy), localizationProvider (copy), localization (copy), appStyleProvider (copy), t_2 (copy), appStyleProvider_1 (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), foundationProvider (copy), t_1 (copy), p0 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				LocalizationProvider = reactModule.createElement(localizationProvider, { localization = localization.new("en-us") }, {
					AppStyleProvider = reactModule.createElement(appStyleProvider, { style = if p1 then t_2[p1.theme] else t_2.Default }, {
						StyleProvider = reactModule.createElement(appStyleProvider_1, { style = if p1 then t_2[p1.theme] else t_2.Default }, {
							StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore() }, {
								DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
									FoundationProvider = reactModule.createElement(foundationProvider, {
										colorMode = t[p1.theme],
										device = t_1[p1.platform],
										preferences = p1.settings
									}, { Child = reactModule.createElement(p0, p1) })
								})
							})
						})
					})
				})
			})
		end
	end
}