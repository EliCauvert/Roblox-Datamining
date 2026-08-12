local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local UIBloxModule = require(parent.UIBlox)
local roduxModule = require(parent.Dev.Rodux)
local roactRoduxModule = require(parent.Dev.RoactRodux)
local designTokenProvider = require(parent.Style).DesignTokenProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationProvider = require(parent.Foundation).FoundationProvider
local signal = require(parent.AppCommonLib).Signal
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore() --[[ line: 27 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(roduxModule.createReducer({}, {}), nil, { roduxModule.thunkMiddleware })
end

local t = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = {
	Format = function(_, p0) --[[ line: 48 ]]
		return p0
	end,
	GetLocale = function() --[[ line: 51 ]]
		return "en-us"
	end,
	changed = signal.new()
}

return {
	name = if groups then groups.Name else "Groups",
	storyRoot = groups,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1) --[[ line: 62 ]]
		-- upvalues: t (ref), reactModule (ref), localizationProvider (ref), t_1 (ref), foundationProvider (ref), appStyleProvider (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref)
		return function(p2) --[[ line: 63 ]]
			-- upvalues: t (copy), reactModule (copy), localizationProvider (copy), t_1 (copy), foundationProvider (copy), appStyleProvider (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), p1 (ref)
			local var9 = if p2 then t[p2.theme] else t.Default
			
			return reactModule.createElement(localizationProvider, { localization = t_1 }, {
				FoundationProvider = reactModule.createElement(foundationProvider, { device = "Desktop", theme = var9.themeName }, {
					AppStyleProvider = reactModule.createElement(appStyleProvider, { style = var9 }, {
						StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore() }, {
							DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = reactModule.createElement(p1, p2) })
						})
					})
				})
			})
		end
	end
}