local SocialTestHelpers = script:FindFirstAncestor("SocialTestHelpers")
local Parent = SocialTestHelpers.Parent
local DependenciesModule = require(SocialTestHelpers.dependencies)
local Roact = DependenciesModule.Roact
local RoactNavigation = DependenciesModule.RoactNavigation
local RoactRodux = DependenciesModule.RoactRodux
local Rodux = DependenciesModule.Rodux
local LocalizationProvider = DependenciesModule.LocalizationProvider
local UnitTestHelpers = DependenciesModule.UnitTestHelpers
local MockNavigationFunction = UnitTestHelpers.mockNavigation
local MockPolicyProviderFunction = UnitTestHelpers.mockPolicyProvider
local CreateStyleProviderFunction = UnitTestHelpers.createStyleProvider
local ApolloProvider = DependenciesModule.ApolloClient.ApolloProvider
local MockApolloClientFunction = DependenciesModule.GraphQLServer.ApolloClientTestUtils.mockApolloClient
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local DesignTokenProvider = require(Parent.Style).DesignTokenProvider
local Localization = DependenciesModule.Mock.MagicMock.new({ name = "Localization" })

function Localization:Format(p1, _)
	return p1
end

local function v13(State)
	-- upvalues: Rodux (copy)
	return Rodux.Store.new(function()
		-- upvalues: State (copy)
		return State
	end, {}, { Rodux.thunkMiddleware })
end

local NewResult = Rodux.Store.new(function()
	return {}
end, {}, { Rodux.thunkMiddleware })

return function(p1, p2)
	-- upvalues: Roact (copy), RoactRodux (copy), v13 (copy), NewResult (copy), CreateStyleProviderFunction (copy), LocalizationProvider (copy), Localization (copy), ApolloProvider (copy), MockApolloClientFunction (copy), DesignTokenProvider (copy), RoactNavigation (copy), MockNavigationFunction (copy), FoundationProvider (copy), MockPolicyProviderFunction (copy)
	local Fragment = Roact.createFragment({
		storeProvider = Roact.createElement(RoactRodux.StoreProvider, {
			store = if p2.state then v13(p2.state) else p2.store or NewResult
		}, {
			styleProvider = CreateStyleProviderFunction({
				localizationProvider = Roact.createElement(LocalizationProvider, { localization = Localization }, {
					apolloClient = Roact.createElement(ApolloProvider, { client = p2.apolloClient or MockApolloClientFunction({}) }, {
						designTokenProvider = Roact.createElement(DesignTokenProvider, {
							tokenMappers = {
								App = function(_, p3)
									return {
										Page = {
											BackgroundColor = p3.Color.Surface.Surface_0.Color3,
											BackgroundTransparency = p3.Color.Surface.Surface_0.Transparency,
											SafeAreaMargin = Vector2.new(p3.Size.Size_1600, p3.Size.Size_600)
										}
									}
								end,
								FriendsLanding = function(_, _)
									return {
										AddFriendsPage = {
											GridViewItemMetrics = { minimumItemsPerRow = 6, minimumItemWidth = 258 }
										},
										FriendsLandingPage = {
											GridHorizontalSpacing = 24,
											GridVerticalSpacing = 24,
											GridViewItemMetrics = { minimumItemsPerRow = 6, minimumItemWidth = 258 }
										},
										ShowMore = {}
									}
								end
							}
						}, {
							myElement = if p2.navigation then Roact.createElement(RoactNavigation.Provider, { value = p2.navigation }, Roact.createElement(p1, p2.props)) else MockNavigationFunction(Roact.createElement(p1, p2.props))
						})
					})
				})
			})
		})
	})
	
	if p2.includeFoundationProvider then
		Fragment = Roact.createElement(FoundationProvider, { device = "Phone", theme = "Dark" }, Fragment)
	end
	if p2.includeMockPolicyProvider then
		Fragment = MockPolicyProviderFunction(Fragment, p2.mockPolicy)
	end
	if p2.mockProvider then
		Fragment = p2.mockProvider(Fragment)
	end
	return Fragment
end