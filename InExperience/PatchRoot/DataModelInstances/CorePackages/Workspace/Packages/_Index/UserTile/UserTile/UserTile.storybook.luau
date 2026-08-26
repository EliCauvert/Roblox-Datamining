local userTile = script:FindFirstAncestor("UserTile")
local parent = userTile.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)
local styleModule = require(parent.Style)
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local foundationProvider = foundationModule.FoundationProvider
local designTokenProvider = styleModule.DesignTokenProvider
local roduxModule = require(parent.Rodux)
local roactNavigationModule = require(parent.RoactNavigation)
local roactRoduxModule = require(parent.RoactRodux)
local colorMode = foundationModule.Enums.ColorMode
local t = { Light = colorMode.Light, Dark = colorMode.Dark }

local function createStore(_)
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(function()
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 100 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		}
	end, {}, { roduxModule.thunkMiddleware })
end

local function mockNavigation(p1)
	-- upvalues: reactModule (ref), roactNavigationModule (ref)
	return reactModule.createElement(roactNavigationModule.Provider, {
		value = {
			state = { routeName = "appPage" },
			isFocused = function()
				return true
			end,
			addListener = function()
				return { remove = function() end }
			end,
			getParam = function(_, p2)
				return p2
			end,
			navigate = function() end
		}
	}, { Child = p1 })
end

return {
	name = "UserTile",
	storyRoot = userTile.Stories,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: t (ref), reactModule (ref), styleProviderWithDefaultTheme (ref), roactRoduxModule (ref), createStore (ref), mockNavigation (ref), foundationProvider (ref), designTokenProvider (ref)
		return function(p2)
			-- upvalues: t (copy), reactModule (copy), styleProviderWithDefaultTheme (copy), roactRoduxModule (copy), createStore (copy), mockNavigation (copy), foundationProvider (copy), designTokenProvider (copy), p1 (ref)
			return reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					navigationProvider = mockNavigation(reactModule.createElement(foundationProvider, { colorMode = t[p2.theme] }, {
						designTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = p1(p2) })
					}))
				})
			})
		end
	end
}