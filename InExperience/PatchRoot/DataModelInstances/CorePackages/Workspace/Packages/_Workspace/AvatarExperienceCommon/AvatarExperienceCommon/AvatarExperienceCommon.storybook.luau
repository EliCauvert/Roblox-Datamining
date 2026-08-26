local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local roduxModule = require(parent.Rodux)
local designTokenProvider = require(parent.Style).DesignTokenProvider
local roactRoduxModule = require(parent.RoactRodux)
local appStyleProvider = require(parent.Style).AppStyleProvider
local appStyleProvider_1 = UIBloxModule.App.Style.AppStyleProvider
local reactRobloxModule = require(parent.ReactRoblox)

local function createStore()
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
	name = "AvatarExperienceCommon",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: t (ref), reactModule (ref), appStyleProvider_1 (ref), t_2 (ref), appStyleProvider (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref), foundationProvider (ref), t_1 (ref)
		return function(p2)
			-- upvalues: t (copy), reactModule (copy), appStyleProvider_1 (copy), t_2 (copy), appStyleProvider (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), foundationProvider (copy), t_1 (copy), p1 (ref)
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
				AppStyleProvider = reactModule.createElement(appStyleProvider_1, { style = if p2 then t_2[p2.theme] else t_2.Default }, {
					StyleProvider = reactModule.createElement(appStyleProvider, { style = if p2 then t_2[p2.theme] else t_2.Default }, {
						StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore() }, {
							DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
								FoundationProvider = reactModule.createElement(foundationProvider, {
									colorMode = t[p2.theme],
									device = t_1[p2.platform],
									preferences = p2.settings
								}, { Child = reactModule.createElement(p1, p2) })
							})
						})
					})
				})
			})
		end
	end
}