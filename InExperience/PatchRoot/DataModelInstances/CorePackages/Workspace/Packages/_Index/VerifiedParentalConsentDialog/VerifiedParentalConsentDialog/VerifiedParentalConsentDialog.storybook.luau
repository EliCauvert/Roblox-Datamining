local VerifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local Parent = VerifiedParentalConsentDialog.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore() --[[ Line: 16 ]]
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}), nil, { RoduxModule.makeThunkMiddleware({}) })
end

local config = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "VerifiedParentalConsentDialog",
	storyRoot = VerifiedParentalConsentDialog,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1) --[[ Line: 43 ]]
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), AppStyleProvider (copy), config (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy)
		return function(p2) --[[ Line: 44 ]]
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (upval), AppStyleProvider (upval), config (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = Localization.new("en-us") }, {
				AppStyleProvider = ReactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = ReactModule.createElement(p1, p2) })
					})
				})
			})
		end
	end
}