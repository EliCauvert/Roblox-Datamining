local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local StyleModule = require(Parent.Style)
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local FoundationProvider = FoundationModule.FoundationProvider
local DesignTokenProvider = StyleModule.DesignTokenProvider
local RoduxModule = require(Parent.Rodux)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactRoduxModule = require(Parent.RoactRodux)
local Theme = FoundationModule.Enums.Theme
local config = { Light = Theme.Light, Dark = Theme.Dark }

local function createStore(_)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function()
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 100 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		}
	end, {}, { RoduxModule.thunkMiddleware })
end

local function mockNavigation(Child)
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy)
	return ReactModule.createElement(RoactNavigationModule.Provider, {
		value = {
			state = { routeName = "appPage" },
			isFocused = function(): boolean
				return true
			end,
			addListener = function()
				return { remove = function() end }
			end,
			getParam = function(_, p1)
				return p1
			end,
			navigate = function() end
		}
	}, { Child = Child })
end

return {
	name = "UserTile",
	storyRoot = UserTile.Stories,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(Callback)
		-- upvalues: config (copy), ReactModule (copy), StyleProviderWithDefaultTheme (copy), RoactRoduxModule (copy), createStore (copy), mockNavigation (copy), FoundationProvider (copy), DesignTokenProvider (copy)
		return function(p1)
			-- upvalues: config (upval), ReactModule (upval), StyleProviderWithDefaultTheme (upval), RoactRoduxModule (upval), createStore (upval), mockNavigation (upval), FoundationProvider (upval), DesignTokenProvider (upval), Callback (copy)
			return ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					navigationProvider = mockNavigation(ReactModule.createElement(FoundationProvider, { theme = config[p1.theme] }, {
						designTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = Callback(p1) })
					}))
				})
			})
		end
	end
}