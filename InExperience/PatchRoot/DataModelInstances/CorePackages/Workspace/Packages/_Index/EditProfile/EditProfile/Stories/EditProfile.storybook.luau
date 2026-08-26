local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
require(parent.UIBlox).init(require(parent.Dev.RobloxAppUIBloxConfig))
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local styleModule = require(parent.Style)
local apolloClientModule = require(parent.ApolloClient)
local foundationModule = require(parent.Foundation)
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local foundationProvider = foundationModule.FoundationProvider
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local designTokenProvider = require(parent.Style).DesignTokenProvider
local mockApolloClient = require(parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local t = { language = "en-us" }
local t_1 = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_2 = { Console = device.Console, Desktop = device.Desktop }

local var1 = function(p1)
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.Store.new(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.Dictionary.join(p1, {
			ScreenSize = Vector2.new(600, 600),
			TopBar = { topBarHeight = 0 },
			GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
		})
	end, {}, { roduxModule.thunkMiddleware })
end

return {
	name = "EditProfile",
	storyRoot = editProfile,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	roactRodux = roactRoduxModule,
	mapDefinition = function(p1)
		-- upvalues: cryoModule (ref), t (ref)
		return cryoModule.Dictionary.join(p1, {
			controls = cryoModule.Dictionary.join(t, p1.controls or {})
		})
	end,
	mapStory = function(p1)
		-- upvalues: t_1 (ref), reactModule (ref), styleProviderWithDefaultTheme (ref), roactRoduxModule (ref), var1 (ref), universalAppPolicyModule (ref), apolloClientModule (ref), mockApolloClient (ref), foundationProvider (ref), t_2 (ref), designTokenProvider (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: t_1 (copy), reactModule (copy), styleProviderWithDefaultTheme (copy), roactRoduxModule (copy), var1 (copy), universalAppPolicyModule (copy), apolloClientModule (copy), mockApolloClient (copy), foundationProvider (copy), t_2 (copy), designTokenProvider (copy), mockLocale (copy), p1 (ref)
			return reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				storeProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var1(p2.definition.state or {}) }, {
					policyProvider = reactModule.createElement(universalAppPolicyModule.RoactAppPolicy.Provider, { policy = { universalAppPolicyModule.AppFeaturePolicies } }, {
						apolloClient = reactModule.createElement(apolloClientModule.ApolloProvider, { client = mockApolloClient({}) }, {
							foundationProvider = reactModule.createElement(foundationProvider, {
								colorMode = t_1[p2.theme],
								device = t_2[p2.platform],
								preferences = p2.settings
							}, {
								designTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = mockLocale(p1, p2) })
							})
						})
					})
				})
			})
		end
	end
}