local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local styleModule = require(parent.Style)
local foundationModule = require(parent.Foundation)
local roactNavigationModule = require(parent.RoactNavigation)
local foundationProvider = foundationModule.FoundationProvider
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local designTokenProvider = styleModule.DesignTokenProvider

local function createStore(_)
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(function()
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 100 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 34 }
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
	name = "UserList",
	storyRoot = userList,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref), roactRoduxModule (ref), createStore (ref), mockNavigation (ref), foundationProvider (ref), foundationModule (ref), designTokenProvider (ref)
		return function(p2)
			-- upvalues: reactModule (copy), styleProviderWithDefaultTheme (copy), roactRoduxModule (copy), createStore (copy), mockNavigation (copy), foundationProvider (copy), foundationModule (copy), designTokenProvider (copy), p1 (ref)
			return reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					navigationProvider = mockNavigation(reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Light }, {
						designTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = p1(p2) })
					}))
				})
			})
		end
	end
}