local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local parent = script.Parent
local reducerModule = require(parent.Reducers.Reducer)
local provider = require(script.Parent.Components.Connection.LayoutValues).Provider
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local layoutValuesContext = playerListModule.Common.LayoutValuesContext
local leaderboardStoreContext = playerListModule.LeaderboardStoreContext
local var1 = require(corePackagesService.Workspace.Packages.LeaderboardStore).dev.createMockLeaderboardStore()()
local apolloProvider = require(corePackagesService.Packages.ApolloClient).ApolloProvider
local mockApolloClient = require(corePackagesService.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local array = require(corePackagesService.Packages.LuauPolyfill).Array
local createLayoutValuesModule = require(parent.CreateLayoutValues)

return function(p1)
	-- upvalues: roduxModule (ref), reducerModule (ref), mockApolloClient (ref), array (ref), roactModule (ref), roactRoduxModule (ref), apolloProvider (ref), provider (ref), createLayoutValuesModule (ref), UIBloxModule (ref), foundationModule (ref), layoutValuesContext (ref), leaderboardStoreContext (ref), var1 (ref)
	return roactModule.createElement(roactRoduxModule.StoreProvider, { store = p1.store or roduxModule.Store.new(reducerModule) }, {
		ApolloProvider = roactModule.createElement(apolloProvider, {
			client = p1.client or mockApolloClient({
				mockResolvers = {
					Query = {
						userProfiles = function(_, p2, _, _)
							-- upvalues: array (copy)
							return array.map(p2.userIds, function(p3)
								return {
									userId = p3,
									names = {
										alias = `alias{p3}`,
										combinedName = `combinedName{p3}`,
										contactName = `contactName{p3}`,
										displayName = `displayName{p3}`,
										username = `username{p3}`,
										platformName = `platformName{p3}`,
										inExperienceCombinedName = `inExperienceCombinedName{p3}`
									}
								}
							end)
						end
					},
					UserProfile = {
						id = function(p2)
							return tostring(p2.userId)
						end,
						names = function(p2)
							return p2.names
						end
					}
				}
			})
		}, {
			LayoutValuesProvider_DEPRECATED = roactModule.createElement(provider, {
				layoutValues = p1.layoutValues or createLayoutValuesModule(false)
			}, {
				ThemeProvider = roactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {}, {
					FoundationProvider = roactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
						LayoutValuesProvider = roactModule.createElement(layoutValuesContext.Provider, {
							value = p1.layoutValues or createLayoutValuesModule(false)
						}, {
							LeaderboardStoreProvider = roactModule.createElement(leaderboardStoreContext.Provider, { value = p1.leaderboardStore or var1 }, p1.children)
						})
					})
				})
			})
		})
	})
end