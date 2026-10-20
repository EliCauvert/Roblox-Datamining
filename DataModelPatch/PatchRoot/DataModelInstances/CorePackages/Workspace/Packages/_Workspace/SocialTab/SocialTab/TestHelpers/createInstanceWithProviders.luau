local SocialTab = script:FindFirstAncestor("SocialTab")
local AnalyticsModule = require(SocialTab.Analytics)
local SocialTabContextModule = require(SocialTab.SocialTabContext)
local Parent = SocialTab.Parent
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local Rodux = DependenciesModule.Rodux
local RoactRodux = DependenciesModule.RoactRodux
local Mock = DependenciesModule.Mock
local ApolloClientModule = require(Parent.ApolloClient)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local UnitTestHelpers = require(SocialTab.devDependencies).UnitTestHelpers
local NewResult = Rodux.Store.new(function(p1, _)
	return p1
end, { ScreenSize = Vector2.new(100, 100) }, { Rodux.thunkMiddleware })

return function(p1, p2)
	-- upvalues: Mock (copy), MockApolloClientFunction (copy), Roact (copy), ApolloClientModule (copy), RoactRodux (copy), NewResult (copy), UnitTestHelpers (copy), DependenciesModule (copy), AnalyticsModule (copy), SocialTabContextModule (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local NewResult1 = Mock.MagicMock.new()
	NewResult1.wideMode = true
	NewResult1.isLuaProfilePageEnabled = true
	local MountResult = Roact.mount(UnitTestHelpers.mockLocale((Roact.createFragment({
		Roact.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, {
			storeProvider = Roact.createElement(RoactRodux.StoreProvider, { store = p2.store or NewResult }, {
				styleProvider = UnitTestHelpers.createStyleProvider({
					policyProvider = Roact.createElement(DependenciesModule.UniversalAppPolicy.Provider, {
						policy = p2.policy or {
							function()
								return {
									getShowDisplayName = function(): boolean
										return true
									end,
									getFriendFinder = function(): boolean
										return true
									end,
									getAccountProviderName = function(): string
										return ""
									end,
									shouldInviteFromAccountProvider = function(): boolean
										return true
									end,
									getShouldShowGroupsTile = function(): boolean
										return true
									end,
									getChatHeaderNotifications = function(): boolean
										return true
									end,
									getContactImporterEnabled = function(): boolean
										return true
									end,
									getWebViewSupport = function(): boolean
										return true
									end,
									getNotificationsCanReceiveStream = function(): boolean
										return true
									end
								}
							end
						}
					}, {
						analyticsProvider = Roact.createElement(AnalyticsModule.Context.Provider, { value = Mock.MagicMock.new() }, {
							socialTabContext = Roact.createElement(SocialTabContextModule.Provider, { value = NewResult1 }, { myElement = Roact.createElement(p1, p2.props) })
						})
					})
				})
			})
		})
	}))), ScreenGui)
	
	return ScreenGui, function()
		-- upvalues: Roact (upval), MountResult (copy), ScreenGui (copy)
		Roact.unmount(MountResult)
		ScreenGui:Destroy()
	end
end