local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
require(Parent.UIBlox).init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local ApolloClientModule = require(Parent.ApolloClient)
local FoundationModule = require(Parent.Foundation)
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local FoundationProvider = FoundationModule.FoundationProvider
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local config = { language = "en-us" }
local config1 = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local config2 = { Console = Device.Console, Desktop = Device.Desktop }

local function v17(State) --[[ Line: 43 ]]
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return RoduxModule.Store.new(function() --[[ Line: 44 ]]
		-- upvalues: CryoModule (upval), State (copy)
		return CryoModule.Dictionary.join(State, {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 0 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		})
	end, {}, { RoduxModule.thunkMiddleware })
end

return {
	name = "EditProfile",
	storyRoot = EditProfile,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	roactRodux = RoactRoduxModule,
	mapDefinition = function(p1) --[[ Line: 66 ]]
		-- upvalues: CryoModule (copy), config (copy)
		return CryoModule.Dictionary.join(p1, {
			controls = CryoModule.Dictionary.join(config, p1.controls or {})
		})
	end,
	mapStory = function(p1) --[[ Line: 70 ]]
		-- upvalues: config1 (copy), ReactModule (copy), StyleProviderWithDefaultTheme (copy), RoactRoduxModule (copy), v17 (copy), UniversalAppPolicyModule (copy), ApolloClientModule (copy), MockApolloClientFunction (copy), FoundationProvider (copy), config2 (copy), DesignTokenProvider (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 71 ]]
			-- upvalues: config1 (upval), ReactModule (upval), StyleProviderWithDefaultTheme (upval), RoactRoduxModule (upval), v17 (upval), UniversalAppPolicyModule (upval), ApolloClientModule (upval), MockApolloClientFunction (upval), FoundationProvider (upval), config2 (upval), DesignTokenProvider (upval), MockLocaleFunction (upval), p1 (copy)
			return ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				storeProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = v17(p2.definition.state or {}) }, {
					policyProvider = ReactModule.createElement(UniversalAppPolicyModule.RoactAppPolicy.Provider, { policy = { UniversalAppPolicyModule.AppFeaturePolicies } }, {
						apolloClient = ReactModule.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, {
							foundationProvider = ReactModule.createElement(FoundationProvider, {
								colorMode = config1[p2.theme],
								device = config2[p2.platform],
								preferences = p2.settings
							}, {
								designTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, { Child = MockLocaleFunction(p1, p2) })
							})
						})
					})
				})
			})
		end
	end
}