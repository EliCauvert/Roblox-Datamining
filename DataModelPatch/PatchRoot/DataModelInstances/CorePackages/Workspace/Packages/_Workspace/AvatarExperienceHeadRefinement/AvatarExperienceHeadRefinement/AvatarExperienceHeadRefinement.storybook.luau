local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.AppLocales).Localization
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore()
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}), nil, { RoduxModule.makeThunkMiddleware({}) })
end

local config = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}

return {
	name = "AvatarExperienceHeadRefinement",
	storyRoot = AvatarExperienceHeadRefinement,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), AppStyleProvider (copy), config (copy), config1 (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (upval), AppStyleProvider (upval), config (upval), config1 (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = Localization.new("en-us") }, {
				AppStyleProvider = ReactModule.createElement(AppStyleProvider, {
					style = p2 and config[p2.theme] or config.Default,
					device = p2 and config1[p2.platform] or "Desktop"
				}, {
					StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
						DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = ReactModule.createElement(p1, p2) })
					})
				})
			})
		end
	end
}