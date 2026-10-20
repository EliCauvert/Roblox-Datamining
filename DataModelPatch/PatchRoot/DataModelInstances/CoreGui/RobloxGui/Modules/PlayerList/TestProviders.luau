local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Parent = script.Parent
local ReducerModule = require(Parent.Reducers.Reducer)
local Provider = require(script.Parent.Components.Connection.LayoutValues).Provider
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local LayoutValuesContext = PlayerListModule.Common.LayoutValuesContext
local LeaderboardStoreContext = PlayerListModule.LeaderboardStoreContext
local v1 = require(CorePackages.Workspace.Packages.LeaderboardStore).dev.createMockLeaderboardStore()()
local ApolloProvider = require(CorePackages.Packages.ApolloClient).ApolloProvider
local MockApolloClientFunction = require(CorePackages.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local Array = require(CorePackages.Packages.LuauPolyfill).Array
local CreateLayoutValuesModule = require(Parent.CreateLayoutValues)

return function(p1)
	-- upvalues: RoduxModule (copy), ReducerModule (copy), MockApolloClientFunction (copy), Array (copy), RoactModule (copy), RoactRoduxModule (copy), ApolloProvider (copy), Provider (copy), CreateLayoutValuesModule (copy), UIBloxModule (copy), FoundationModule (copy), LayoutValuesContext (copy), LeaderboardStoreContext (copy), v1 (copy)
	local NewResult = RoduxModule.Store.new(ReducerModule)
	local MockApolloClientResult = MockApolloClientFunction({
		mockResolvers = {
			Query = {
				userProfiles = function(_, p2, _, _)
					-- upvalues: Array (upval)
					return (Array.map(p2.userIds, function(UserId)
						return {
							userId = UserId,
							names = {
								alias = `alias{UserId}`,
								combinedName = `combinedName{UserId}`,
								contactName = `contactName{UserId}`,
								displayName = `displayName{UserId}`,
								username = `username{UserId}`,
								platformName = `platformName{UserId}`,
								inExperienceCombinedName = `inExperienceCombinedName{UserId}`
							}
						}
					end))
				end
			},
			UserProfile = {
				id = function(p2): string
					return (tostring(p2.userId))
				end,
				names = function(p2)
					return p2.names
				end
			}
		}
	})
	
	return RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p1.store or NewResult }, {
		ApolloProvider = RoactModule.createElement(ApolloProvider, { client = p1.client or MockApolloClientResult }, {
			LayoutValuesProvider_DEPRECATED = RoactModule.createElement(Provider, {
				layoutValues = p1.layoutValues or CreateLayoutValuesModule(false)
			}, {
				ThemeProvider = RoactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {}, {
					FoundationProvider = RoactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
						LayoutValuesProvider = RoactModule.createElement(LayoutValuesContext.Provider, {
							value = p1.layoutValues or CreateLayoutValuesModule(false)
						}, {
							LeaderboardStoreProvider = RoactModule.createElement(LeaderboardStoreContext.Provider, { value = p1.leaderboardStore or v1 }, p1.children)
						})
					})
				})
			})
		})
	})
end