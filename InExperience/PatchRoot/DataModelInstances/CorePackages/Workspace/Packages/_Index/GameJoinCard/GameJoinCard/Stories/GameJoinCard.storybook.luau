local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local cryoModule = require(parent.Dev.Cryo)
local styleModule = require(parent.Style)
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local designTokenProvider = styleModule.DesignTokenProvider
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local roduxModule = require(parent.Dev.Rodux)
local roactRoduxModule = require(parent.Dev.RoactRodux)
local t = {}

local function createStore(_) --[[ line: 15 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(function() --[[ line: 16 ]]
		return {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 0 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		}
	end, {}, { roduxModule.thunkMiddleware })
end

return {
	name = "GameJoinCard",
	storyRoot = gameJoinCard.Stories,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapDefinition = function(p0) --[[ line: 37 ]]
		-- upvalues: cryoModule (ref), t (ref)
		return cryoModule.Dictionary.join(p0, {
			controls = cryoModule.Dictionary.join(t, p0.controls or {})
		})
	end,
	mapStory = function(p1) --[[ line: 41 ]]
		-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref), roactRoduxModule (ref), createStore (ref), designTokenProvider (ref), mockLocale (ref)
		return function(p2) --[[ line: 42 ]]
			-- upvalues: reactModule (copy), styleProviderWithDefaultTheme (copy), roactRoduxModule (copy), createStore (copy), designTokenProvider (copy), mockLocale (copy), p1 (ref)
			return reactModule.createElement(styleProviderWithDefaultTheme, {
				withUiModeSupport = false,
				withDarkTheme = if p2.theme ~= nil then p2.theme ~= "Light" else true
			}, {
				reactModule.createElement(roactRoduxModule.StoreProvider, { store = createStore(nil) }, {
					designTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = mockLocale(p1, p2) })
				})
			})
		end
	end
}