local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local RoduxModule = require(Parent.Dev.Rodux)
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local Signal = require(Parent.AppCommonLib).Signal
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider

local function createStore() --[[ Line: 27 ]]
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(RoduxModule.createReducer({}, {}), nil, { RoduxModule.thunkMiddleware })
end

local config = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local Localization = {
	Format = function(_, p1) --[[ Line: 48 ]]
		return p1
	end,
	GetLocale = function(): string --[[ Line: 51 ]]
		return "en-us"
	end,
	changed = Signal.new()
}

return {
	name = Groups and Groups.Name or "Groups",
	storyRoot = Groups,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1) --[[ Line: 62 ]]
		-- upvalues: config (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), FoundationProvider (copy), AppStyleProvider (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy)
		return function(p2) --[[ Line: 63 ]]
			-- upvalues: config (upval), ReactModule (upval), LocalizationProvider (upval), Localization (upval), FoundationProvider (upval), AppStyleProvider (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), p1 (copy)
			local Entry = p2 and config[p2.theme] or config.Default
			
			return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, { device = "Desktop", colorMode = Entry.themeName }, {
					AppStyleProvider = ReactModule.createElement(AppStyleProvider, { style = Entry }, {
						StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
							DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = ReactModule.createElement(p1, p2) })
						})
					})
				})
			})
		end
	end
}