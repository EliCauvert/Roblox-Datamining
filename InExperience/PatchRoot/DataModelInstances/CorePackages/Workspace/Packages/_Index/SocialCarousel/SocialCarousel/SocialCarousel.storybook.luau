local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local roactModule = require(parent.Dev.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local styleModule = require(parent.Style)
local apolloClientModule = require(parent.ApolloClient)
local foundationModule = require(parent.Foundation)
local roactNavigationModule = require(parent.RoactNavigation)
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local universalAppPolicy = require(parent.UniversalAppPolicy).UniversalAppPolicy
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local foundationProvider = foundationModule.FoundationProvider
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local designTokenProvider = require(parent.Style).DesignTokenProvider
local mockApolloClient = require(parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
roactModule.setGlobalConfig({ elementTracing = true })
local t = { language = "en-us" }
local t_1 = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_2 = { Console = device.Console, Desktop = device.Desktop }

local var13 = function(p0) --[[ line: 44 ]]
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.Store.new(function() --[[ line: 45 ]]
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.Dictionary.join(p0, {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 0 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		})
	end, {}, { roduxModule.thunkMiddleware })
end

return {
	name = "SocialCarousel",
	storyRoot = socialCarousel,
	roact = roactModule,
	roactRodux = roactRoduxModule,
	mapDefinition = function(p1) --[[ line: 66 ]]
		-- upvalues: cryoModule (ref), t (ref)
		return cryoModule.Dictionary.join(p1, {
			controls = cryoModule.Dictionary.join(t, p1.controls or {})
		})
	end,
	mapStory = function(p2) --[[ line: 70 ]]
		-- upvalues: t_1 (ref), roactModule (ref), styleProviderWithDefaultTheme (ref), universalAppPolicy (ref), roactNavigationModule (ref), roactRoduxModule (ref), var13 (ref), apolloClientModule (ref), mockApolloClient (ref), foundationProvider (ref), t_2 (ref), designTokenProvider (ref), mockLocale (ref)
		return function(p3) --[[ line: 71 ]]
			-- upvalues: t_1 (copy), roactModule (copy), styleProviderWithDefaultTheme (copy), universalAppPolicy (copy), roactNavigationModule (copy), roactRoduxModule (copy), var13 (copy), apolloClientModule (copy), mockApolloClient (copy), foundationProvider (copy), t_2 (copy), designTokenProvider (copy), mockLocale (copy), p2 (ref)
			return roactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				roactModule.createElement(universalAppPolicy.Provider, {
					policy = {
						function() --[[ line: 80 ]]
							return {
								useGridPageLayout = function() --[[ line: 82 ]]
									return true
								end
							}
						end
					}
				}, {
					navigationProvider = roactModule.createElement(roactNavigationModule.Provider, {
						value = {
							state = { routeName = "appPage" },
							isFocused = function() --[[ line: 94 ]]
								return false
							end,
							addListener = function() --[[ line: 97 ]]
								return { remove = function() --[[ line: 99 ]] end }
							end,
							getParam = function(_, p4) --[[ line: 102 ]]
								return p4
							end,
							navigate = function() --[[ line: 105 ]] end
						}
					}, {
						storeProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = var13(p3.definition.state or {}) }, {
							apolloClient = roactModule.createElement(apolloClientModule.ApolloProvider, { client = mockApolloClient({}) }, {
								foundationProvider = roactModule.createElement(foundationProvider, {
									colorMode = t_1[p3.theme],
									device = t_2[p3.platform],
									preferences = p3.settings
								}, {
									designTokenProvider = roactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = mockLocale(p2, p3) })
								})
							})
						})
					})
				})
			})
		end
	end
}