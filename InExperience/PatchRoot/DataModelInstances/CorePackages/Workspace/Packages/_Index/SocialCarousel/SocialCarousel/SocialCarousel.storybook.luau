local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local RoactModule = require(Parent.Dev.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local StyleModule = require(Parent.Style)
local ApolloClientModule = require(Parent.ApolloClient)
local FoundationModule = require(Parent.Foundation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy
require(Parent.UIBlox).init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local FoundationProvider = FoundationModule.FoundationProvider
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
RoactModule.setGlobalConfig({ elementTracing = true })
local config = { language = "en-us" }
local config1 = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local config2 = { Console = Device.Console, Desktop = Device.Desktop }

local function v19(State) --[[ Line: 44 ]]
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return RoduxModule.Store.new(function() --[[ Line: 45 ]]
		-- upvalues: CryoModule (upval), State (copy)
		return CryoModule.Dictionary.join(State, {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 0 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		})
	end, {}, { RoduxModule.thunkMiddleware })
end

return {
	name = "SocialCarousel",
	storyRoot = SocialCarousel,
	roact = RoactModule,
	roactRodux = RoactRoduxModule,
	mapDefinition = function(p1) --[[ Line: 66 ]]
		-- upvalues: CryoModule (copy), config (copy)
		return CryoModule.Dictionary.join(p1, {
			controls = CryoModule.Dictionary.join(config, p1.controls or {})
		})
	end,
	mapStory = function(p1) --[[ Line: 70 ]]
		-- upvalues: config1 (copy), RoactModule (copy), StyleProviderWithDefaultTheme (copy), UniversalAppPolicy (copy), RoactNavigationModule (copy), RoactRoduxModule (copy), v19 (copy), ApolloClientModule (copy), MockApolloClientFunction (copy), FoundationProvider (copy), config2 (copy), DesignTokenProvider (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 71 ]]
			-- upvalues: config1 (upval), RoactModule (upval), StyleProviderWithDefaultTheme (upval), UniversalAppPolicy (upval), RoactNavigationModule (upval), RoactRoduxModule (upval), v19 (upval), ApolloClientModule (upval), MockApolloClientFunction (upval), FoundationProvider (upval), config2 (upval), DesignTokenProvider (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				RoactModule.createElement(UniversalAppPolicy.Provider, {
					policy = {
						function() --[[ Line: 80 ]]
							return {
								useGridPageLayout = function(): boolean --[[ Line: 82 ]]
									return true
								end
							}
						end
					}
				}, {
					navigationProvider = RoactModule.createElement(RoactNavigationModule.Provider, {
						value = {
							state = { routeName = "appPage" },
							isFocused = function(): boolean --[[ Line: 94 ]]
								return false
							end,
							addListener = function() --[[ Line: 97 ]]
								return { remove = function() --[[ Line: 99 ]] end }
							end,
							getParam = function(_, p3) --[[ Line: 102 ]]
								return p3
							end,
							navigate = function() --[[ Line: 105 ]] end
						}
					}, {
						storeProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = v19(p2.definition.state or {}) }, {
							apolloClient = RoactModule.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, {
								foundationProvider = RoactModule.createElement(FoundationProvider, {
									colorMode = config1[p2.theme],
									device = config2[p2.platform],
									preferences = p2.settings
								}, {
									designTokenProvider = RoactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = MockLocaleFunction(p1, p2) })
								})
							})
						})
					})
				})
			})
		end
	end
}