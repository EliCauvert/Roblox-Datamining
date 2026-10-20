local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("DiscoveryTestHelpers").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local PromiseModule = require(Parent.Promise)
local ResponsiveModule = require(Parent.Responsive)
local RoactRoduxModule = require(Parent.RoactRodux)
local StyleModule = require(Parent.Style)
local AppStyleProvider = StyleModule.AppStyleProvider
local DesignTokenProvider = StyleModule.DesignTokenProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 1000, 0, 1000)
local Ref = ReactModule.createRef()
Ref.current = Frame

return function(p1, p2)
	-- upvalues: Parent (copy), ReactModule (copy), ResponsiveModule (copy), Ref (copy), RoactRoduxModule (copy), RoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), FoundationProvider (copy), FoundationModule (copy), AppStyleProvider (copy), DesignTokenProvider (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoactServices (copy), CryoModule (copy), RoactNetworking (copy), PromiseModule (copy), RoactNavigationModule (copy)
	local P1 = p2 or {}
	
	return (ReactModule.createElement(ResponsiveModule.ContainerRef.Provider, { value = Ref }, {
		StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = P1.store or RoduxModule.Store.new(function(p3)
				return p3
			end, {
				ScreenSize = Vector2.new(1920, 1080),
				TopBar = { topBarHeight = 10 },
				GlobalGuiInset = { bottom = 0, left = 0, right = 0, top = 0 },
				GamesProductInfoKey = {},
				PlayabilityStatus = {},
				FetchingStatus = {},
				GameDetails = {},
				Personalization = { GameInfosKey = {} },
				GameIconsKey = {},
				UserGameVotes = {},
				AgeRecommendations = {},
				ShowAgeVerificationOverlay = {}
			}, {})
		}, {
			ApolloProvider = ReactModule.createElement(require(Parent.Dev.ApolloClient).ApolloProvider, {
				client = require(Parent.Dev.GraphQLServer).ApolloClientTestUtils.mockApolloClient({})
			}, {
				RoactAppPolicy = ReactModule.createElement(RoactAppPolicy.Provider, {
					policy = { AppFeaturePolicies },
					policyData = P1.policyData
				}, {
					FoundationProvider = ReactModule.createElement(FoundationProvider, {
						theme = FoundationModule.Enums.Theme.Dark,
						device = FoundationModule.Enums.Device.Desktop,
						overlayGui = P1.overlayGui,
						preferences = { reducedMotion = true }
					}, {
						AppStyleProvider = ReactModule.createElement(AppStyleProvider, {
							style = {
								themeName = "dark",
								fontName = "gotham",
								deviceType = "Desktop"
							}
						}, {
							DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = P1.tokenMappers or {} }, {
								LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
									localization = Localization.new(LocalizationService.RobloxLocaleId)
								}, {
									AppInteractionFeedbackProvider = ReactModule.createElement(require(Parent.AppInteractionFeedbackConfig).AppInteractionFeedbackProvider, {}, {
										RoactServices = ReactModule.createElement(RoactServices.ServiceProvider, {
											services = CryoModule.Dictionary.join({
												[RoactNetworking] = function(...)
													-- upvalues: PromiseModule (upval), P1 (copy)
													return PromiseModule.resolve(if P1.mockNetworkResponse then P1.mockNetworkResponse(...) else { responseBody = "" })
												end
											}, P1.services or {})
										}, {
											NavigationProvider = ReactModule.createElement(RoactNavigationModule.Provider, {
												value = {
													isFocused = function(): boolean
														return true
													end,
													addListener = function()
														return { remove = function() end }
													end,
													getParam = function(_, p3)
														return p3
													end,
													navigate = function() end,
													goBack = function() end,
													state = { routeName = P1.defaultRouteName or "DummyRoute" }
												}
											}, p1)
										})
									})
								})
							})
						})
					})
				})
			})
		})
	}))
end