local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local StyleModule = require(Parent.Style)
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local FoundationProvider = FoundationModule.FoundationProvider
local DesignTokenProvider = StyleModule.DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local RoduxModule = require(Parent.Rodux)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactRoduxModule = require(Parent.RoactRodux)
local ColorMode = FoundationModule.Enums.ColorMode
local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }

local function createStore(_) --[[ Line: 21 ]]
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function() --[[ Line: 22 ]]
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 100 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		}
	end, {}, { RoduxModule.thunkMiddleware })
end

local Localization = {
	Format = function(_, p1) --[[ Line: 39 ]]
		return p1
	end,
	GetLocale = function(): string --[[ Line: 42 ]]
		return "en-us"
	end,
	changed = {
		connect = function(_, _) --[[ Line: 46 ]]
			return { disconnect = function() --[[ Line: 48 ]] end }
		end
	}
}

local function mockNavigation(Child) --[[ Line: 54 ]]
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy)
	return ReactModule.createElement(RoactNavigationModule.Provider, {
		value = {
			state = { routeName = "appPage" },
			isFocused = function(): boolean --[[ Line: 60 ]]
				return true
			end,
			addListener = function() --[[ Line: 63 ]]
				return { remove = function() --[[ Line: 65 ]] end }
			end,
			getParam = function(_, p1) --[[ Line: 68 ]]
				return p1
			end,
			navigate = function() --[[ Line: 71 ]] end
		}
	}, { Child = Child })
end

return {
	name = "UserTile",
	storyRoot = UserTile.Stories,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(Callback) --[[ Line: 83 ]]
		-- upvalues: config (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), StyleProviderWithDefaultTheme (copy), RoactRoduxModule (copy), createStore (copy), mockNavigation (copy), FoundationProvider (copy), DesignTokenProvider (copy)
		return function(p1) --[[ Line: 84 ]]
			-- upvalues: config (upval), ReactModule (upval), LocalizationProvider (upval), Localization (upval), StyleProviderWithDefaultTheme (upval), RoactRoduxModule (upval), createStore (upval), mockNavigation (upval), FoundationProvider (upval), DesignTokenProvider (upval), Callback (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
				StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
					ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore(nil) }, {
						navigationProvider = mockNavigation(ReactModule.createElement(FoundationProvider, { colorMode = config[p1.theme] }, {
							designTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = Callback(p1) })
						}))
					})
				})
			})
		end
	end
}