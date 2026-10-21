local SocialProof = script:FindFirstAncestor("SocialProof")
local Parent = SocialProof.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local StyleModule = require(Parent.Style)
local FoundationModule = require(Parent.Foundation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FoundationProvider = FoundationModule.FoundationProvider
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local DesignTokenProvider = StyleModule.DesignTokenProvider

local function createStore(_)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function()
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 100 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 34 }
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
	name = "SocialProof",
	storyRoot = SocialProof,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(Callback)
		-- upvalues: ReactModule (copy), StyleProviderWithDefaultTheme (copy), RoactRoduxModule (copy), createStore (copy), mockNavigation (copy), FoundationProvider (copy), FoundationModule (copy), DesignTokenProvider (copy)
		return function(p1)
			-- upvalues: ReactModule (upval), StyleProviderWithDefaultTheme (upval), RoactRoduxModule (upval), createStore (upval), mockNavigation (upval), FoundationProvider (upval), FoundationModule (upval), DesignTokenProvider (upval), Callback (copy)
			return ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					navigationProvider = mockNavigation(ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Light }, {
						designTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = Callback(p1) })
					}))
				})
			})
		end
	end
}