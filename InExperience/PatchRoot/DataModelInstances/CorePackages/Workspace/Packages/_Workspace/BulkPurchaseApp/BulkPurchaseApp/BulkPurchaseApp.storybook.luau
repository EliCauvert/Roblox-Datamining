local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local UIBloxModule = require(parent.UIBlox)
local designTokenProvider = require(parent.Style).DesignTokenProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.InExperienceLocales).Localization
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
	name = "BulkPurchaseApp",
	storyRoot = bulkPurchaseApp,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), appStyleProvider (ref), t (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref)
		return function(p2)
			-- upvalues: reactModule (copy), localizationProvider (copy), localization (copy), appStyleProvider (copy), t (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), p1 (ref)
			return reactModule.createElement(localizationProvider, { localization = localization.new("en-us") }, {
				AppStyleProvider = reactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, {
					StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore() }, {
						DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = reactModule.createElement(p1, p2) })
					})
				})
			})
		end
	end
}