local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Dev.Cryo)
local StyleModule = require(Parent.Style)
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local DesignTokenProvider = StyleModule.DesignTokenProvider
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local RoduxModule = require(Parent.Dev.Rodux)
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local t = {}

local function createStore(_)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function()
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 0 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		}
	end, {}, { RoduxModule.thunkMiddleware })
end

return {
	name = "GameJoinCard",
	storyRoot = GameJoinCard.Stories,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapDefinition = function(p1)
		-- upvalues: CryoModule (copy), t (copy)
		return CryoModule.Dictionary.join(p1, {
			controls = CryoModule.Dictionary.join(t, p1.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), StyleProviderWithDefaultTheme (copy), RoactRoduxModule (copy), createStore (copy), DesignTokenProvider (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), StyleProviderWithDefaultTheme (upval), RoactRoduxModule (upval), createStore (upval), DesignTokenProvider (upval), MockLocaleFunction (upval), p1 (copy)
			return ReactModule.createElement(StyleProviderWithDefaultTheme, {
				withUiModeSupport = false,
				withDarkTheme = p2.theme == nil or p2.theme ~= "Light"
			}, {
				ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					designTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = MockLocaleFunction(p1, p2) })
				})
			})
		end
	end
}