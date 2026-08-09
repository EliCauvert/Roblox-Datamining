local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local styleModule = require(parent.Style)
local apolloClientModule = require(parent.ApolloClient)
local foundationModule = require(parent.Foundation)
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local foundationProvider = foundationModule.FoundationProvider
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local designTokenProvider = require(parent.Style).DesignTokenProvider
local mockApolloClient = require(parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local theme = foundationModule.Enums.Theme
local device = foundationModule.Enums.Device
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local t = { language = "en-us" }
local t_1 = { Light = theme.Light, Dark = theme.Dark }
local t_2 = { Console = device.Console, Desktop = device.Desktop }

local var14 = function(p0) --[[ line: 40 ]]
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.Store.new(function() --[[ line: 41 ]]
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.Dictionary.join(p0, {
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
	mapDefinition = function(p1) --[[ line: 63 ]]
		-- upvalues: cryoModule (ref), t (ref)
		return cryoModule.Dictionary.join(p1, {
			controls = cryoModule.Dictionary.join(t, p1.controls or {})
		})
	end,
	mapStory = function(p2) --[[ line: 67 ]]
		-- upvalues: t_1 (ref), reactModule (ref), styleProviderWithDefaultTheme (ref), roactRoduxModule (ref), var14 (ref), universalAppPolicyModule (ref), apolloClientModule (ref), mockApolloClient (ref), foundationProvider (ref), t_2 (ref), designTokenProvider (ref), mockLocale (ref)
		return function(p3) --[[ line: 68 ]]
			-- upvalues: t_1 (copy), reactModule (copy), styleProviderWithDefaultTheme (copy), roactRoduxModule (copy), var14 (copy), universalAppPolicyModule (copy), apolloClientModule (copy), mockApolloClient (copy), foundationProvider (copy), t_2 (copy), designTokenProvider (copy), mockLocale (copy), p2 (ref)
			return reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true, withUiModeSupport = false }, {
				storeProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var14(p3.definition.state or {}) }, {
					policyProvider = reactModule.createElement(universalAppPolicyModule.RoactAppPolicy.Provider, { policy = { universalAppPolicyModule.AppFeaturePolicies } }, {
						apolloClient = reactModule.createElement(apolloClientModule.ApolloProvider, { client = mockApolloClient({}) }, {
							foundationProvider = reactModule.createElement(foundationProvider, {
								theme = t_1[p3.theme],
								device = t_2[p3.platform],
								preferences = p3.settings
							}, {
								designTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, { Child = mockLocale(p2, p3) })
							})
						})
					})
				})
			})
		end
	end
}