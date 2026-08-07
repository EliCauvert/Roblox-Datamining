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

local function createStore(_) --[[ line: 18 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(function() --[[ line: 19 ]]
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 100 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 34 }
		}
	end, {}, { roduxModule.thunkMiddleware })
end

local function mockNavigation(p0) --[[ line: 35 ]]
	-- upvalues: reactModule (ref), roactNavigationModule (ref)
	return reactModule.createElement(roactNavigationModule.Provider, {
		value = {
			state = { routeName = "appPage" },
			isFocused = function() --[[ line: 41 ]]
				return true
			end,
			addListener = function() --[[ line: 44 ]]
				return { remove = function() --[[ line: 46 ]] end }
			end,
			getParam = function(_, p1) --[[ line: 49 ]]
				return p1
			end,
			navigate = function() --[[ line: 52 ]] end
		}
	}, { Child = p0 })
end

return {
	name = "UserList",
	storyRoot = userList,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p2) --[[ line: 64 ]]
		-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref), roactRoduxModule (ref), createStore (ref), mockNavigation (ref), foundationProvider (ref), foundationModule (ref), designTokenProvider (ref)
		return function(p3) --[[ line: 65 ]]
			-- upvalues: reactModule (copy), styleProviderWithDefaultTheme (copy), roactRoduxModule (copy), createStore (copy), mockNavigation (copy), foundationProvider (copy), foundationModule (copy), designTokenProvider (copy), p2 (ref)
			return reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					navigationProvider = mockNavigation(reactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Light }, {
						designTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = p2(p3) })
					}))
				})
			})
		end
	end
}