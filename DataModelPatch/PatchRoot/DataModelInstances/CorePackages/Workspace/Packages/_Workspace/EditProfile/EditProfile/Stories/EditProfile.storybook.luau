local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local StyleModule = require(Parent.Style)
local ApolloClientModule = require(Parent.ApolloClient)
local FoundationModule = require(Parent.Foundation)
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
require(Parent.UIBlox).init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local FoundationProvider = FoundationModule.FoundationProvider
local StyleProviderWithDefaultTheme = StyleModule.StyleProviderWithDefaultTheme
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local config = { language = "en-us" }
local config1 = { Light = Theme.Light, Dark = Theme.Dark }
local config2 = { Console = Device.Console, Desktop = Device.Desktop }

local function v19(State)
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return RoduxModule.Store.new(function()
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
	reactRoblox = ReactRobloxModule,
	roactRodux = RoactRoduxModule,
	mapDefinition = function(p1)
		-- upvalues: CryoModule (copy), config (copy)
		return CryoModule.Dictionary.join(p1, {
			controls = CryoModule.Dictionary.join(config, p1.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: config1 (copy), ReactModule (copy), StyleProviderWithDefaultTheme (copy), RoactRoduxModule (copy), v19 (copy), UniversalAppPolicyModule (copy), ApolloClientModule (copy), MockApolloClientFunction (copy), FoundationProvider (copy), config2 (copy), DesignTokenProvider (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: config1 (upval), ReactModule (upval), StyleProviderWithDefaultTheme (upval), RoactRoduxModule (upval), v19 (upval), UniversalAppPolicyModule (upval), ApolloClientModule (upval), MockApolloClientFunction (upval), FoundationProvider (upval), config2 (upval), DesignTokenProvider (upval), MockLocaleFunction (upval), p1 (copy)
			return ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				storeProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = v19(p2.definition.state or {}) }, {
					policyProvider = ReactModule.createElement(UniversalAppPolicyModule.RoactAppPolicy.Provider, { policy = { UniversalAppPolicyModule.AppFeaturePolicies } }, {
						apolloClient = ReactModule.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, {
							foundationProvider = ReactModule.createElement(FoundationProvider, {
								theme = config1[p2.theme],
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