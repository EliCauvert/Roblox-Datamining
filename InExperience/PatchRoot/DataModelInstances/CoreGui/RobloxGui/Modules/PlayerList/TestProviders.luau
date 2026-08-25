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
local var8 = require(corePackagesService.Workspace.Packages.LeaderboardStore).dev.createMockLeaderboardStore()()
local apolloProvider = require(corePackagesService.Packages.ApolloClient).ApolloProvider
local mockApolloClient = require(corePackagesService.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local array = require(corePackagesService.Packages.LuauPolyfill).Array
local createLayoutValuesModule = require(parent.CreateLayoutValues)

return function(p0)
	-- upvalues: roduxModule (ref), reducerModule (ref), mockApolloClient (ref), array (ref), roactModule (ref), roactRoduxModule (ref), apolloProvider (ref), provider (ref), createLayoutValuesModule (ref), UIBloxModule (ref), foundationModule (ref), layoutValuesContext (ref), leaderboardStoreContext (ref), var8 (ref)
	return roactModule.createElement(roactRoduxModule.StoreProvider, { store = p0.store or roduxModule.Store.new(reducerModule) }, {
		ApolloProvider = roactModule.createElement(apolloProvider, {
			client = p0.client or mockApolloClient({
				mockResolvers = {
					Query = {
						userProfiles = function(_, p1, _, _)
							-- upvalues: array (copy)
							return array.map(p1.userIds, function(p2)
								return {
									userId = p2,
									names = {
										alias = `alias{p2}`,
										combinedName = `combinedName{p2}`,
										contactName = `contactName{p2}`,
										displayName = `displayName{p2}`,
										username = `username{p2}`,
										platformName = `platformName{p2}`,
										inExperienceCombinedName = `inExperienceCombinedName{p2}`
									}
								}
							end)
						end
					},
					UserProfile = {
						id = function(p3)
							return tostring(p3.userId)
						end,
						names = function(p4)
							return p4.names
						end
					}
				}
			})
		}, {
			LayoutValuesProvider_DEPRECATED = roactModule.createElement(provider, {
				layoutValues = p0.layoutValues or createLayoutValuesModule(false)
			}, {
				ThemeProvider = roactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {}, {
					FoundationProvider = roactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
						LayoutValuesProvider = roactModule.createElement(layoutValuesContext.Provider, {
							value = p0.layoutValues or createLayoutValuesModule(false)
						}, {
							LeaderboardStoreProvider = roactModule.createElement(leaderboardStoreContext.Provider, { value = p0.leaderboardStore or var8 }, p0.children)
						})
					})
				})
			})
		})
	})
end