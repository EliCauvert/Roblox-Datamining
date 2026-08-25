local avatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local parent = avatarExperienceSlotBasedEditor.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local UIBloxModule = require(parent.UIBlox)
local designTokenProvider = require(parent.Style).DesignTokenProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.Dev.AppLocales).Localization
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore()
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(roduxModule.createReducer({}, {}), nil, { roduxModule.makeThunkMiddleware({}) })
end

local t = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_1 = { Console = device.Console, Desktop = device.Desktop }
local t_2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceSlotBasedEditor",
	storyRoot = avatarExperienceSlotBasedEditor,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p0)
		-- upvalues: t (ref), reactModule (ref), localizationProvider (ref), localization (ref), appStyleProvider (ref), t_2 (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref), foundationProvider (ref), t_1 (ref)
		return function(p1)
			-- upvalues: t (copy), reactModule (copy), localizationProvider (copy), localization (copy), appStyleProvider (copy), t_2 (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), foundationProvider (copy), t_1 (copy), p0 (ref)
			return reactModule.createElement(localizationProvider, { localization = localization.new("en-us") }, {
				AppStyleProvider = reactModule.createElement(appStyleProvider, { style = if p1 then t_2[p1.theme] else t_2.Default }, {
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
		end
	end
}