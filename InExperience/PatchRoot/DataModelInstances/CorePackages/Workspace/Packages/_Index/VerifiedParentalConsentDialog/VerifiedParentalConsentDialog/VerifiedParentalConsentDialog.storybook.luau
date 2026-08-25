local verifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local parent = verifiedParentalConsentDialog.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local UIBloxModule = require(parent.UIBlox)
local designTokenProvider = require(parent.Style).DesignTokenProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore()
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(roduxModule.createReducer({}, {}), nil, { roduxModule.makeThunkMiddleware({}) })
end

local t = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "VerifiedParentalConsentDialog",
	storyRoot = verifiedParentalConsentDialog,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p0)
		-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), appStyleProvider (ref), t (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref)
		return function(p1)
			-- upvalues: reactModule (copy), localizationProvider (copy), localization (copy), appStyleProvider (copy), t (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), p0 (ref)
			return reactModule.createElement(localizationProvider, { localization = localization.new("en-us") }, {
				AppStyleProvider = reactModule.createElement(appStyleProvider, { style = if p1 then t[p1.theme] else t.Default }, {
					StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore() }, {
						DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = reactModule.createElement(p0, p1) })
					})
				})
			})
		end
	end
}