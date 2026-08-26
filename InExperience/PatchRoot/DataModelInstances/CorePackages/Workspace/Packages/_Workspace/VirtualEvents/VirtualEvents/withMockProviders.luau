local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local apolloClientModule = require(virtualEvents.Parent.ApolloClient)
local graphQLServerModule = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local roduxModule = require(virtualEvents.Parent.Rodux)
local roactNavigationModule = require(virtualEvents.Parent.RoactNavigation)
local roactRoduxModule = require(virtualEvents.Parent.RoactRodux)
local robloxAppLocalesModule = require(virtualEvents.Parent.RobloxAppLocales)
local localizationModule = require(virtualEvents.Parent.Localization)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local designTokenProvider = require(virtualEvents.Parent.Style).DesignTokenProvider
local virtualEventsStateModule = require(virtualEvents.Parent.VirtualEventsState)
local mockContentProvider = UIBloxModule.UnitTestHelpers.MockContentProvider
local foundationModule = require(virtualEvents.Parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants
local contentProvider = UIBloxModule.App.Context.ContentProvider
local var1 = roduxModule.combineReducers({
	VirtualEvents = virtualEventsStateModule.installReducer()
})

return function(p1, p2)
	-- upvalues: roduxModule (ref), var1 (ref), reactModule (ref), roactRoduxModule (ref), contentProvider (ref), mockContentProvider (ref), localizationModule (ref), robloxAppLocalesModule (ref), foundationProvider (ref), colorMode (ref), appStyleProvider (ref), constants (ref), roactNavigationModule (ref), designTokenProvider (ref), graphQLServerModule (ref), apolloClientModule (ref)
	local t = {
		StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, {
			store = (if p2 then p2.store else nil) or roduxModule.Store.new(var1, if p2 then p2.initialStoreState else nil, { roduxModule.thunkMiddleware })
		}, {
			ContentProvider = reactModule.createElement(contentProvider.Provider, { value = mockContentProvider.new() }, {
				LocalizationProvider = reactModule.createElement(localizationModule.LocalizationProvider, {
					localization = robloxAppLocalesModule.Localization.new("en-us")
				}, {
					FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
						StyleProvider = reactModule.createElement(appStyleProvider, {
							style = {
								themeName = colorMode.Dark,
								fontName = constants.FontName.Gotham
							}
						}, {
							NavigationProvider = reactModule.createElement(roactNavigationModule.Provider, {
								value = {
									isFocused = function()
										return true
									end,
									goBack = function() end,
									addListener = function()
										return { remove = function() end }
									end
								}
							}, {
								DesignTokenProvider = reactModule.createElement(designTokenProvider, { tokenMappers = {} }, {
									Children = reactModule.createElement(reactModule.Fragment, nil, p1)
								})
							})
						})
					})
				})
			})
		})
	}
	
	if p2 then
		if p2.mockResolvers then
			local var2 = graphQLServerModule.GraphQLServer.new({ mockResolvers = p2.mockResolvers })
			t = {
				ApolloProvider = reactModule.createElement(apolloClientModule.ApolloProvider, {
					client = apolloClientModule.ApolloClient.new({
						cache = apolloClientModule.InMemoryCache.new({}),
						link = apolloClientModule.HttpLink.new({
							uri = "/api",
							fetch = function(_, p3)
								-- upvalues: var2 (ref)
								return var2:fetchLocal(p3)
							end
						})
					})
				}, t)
			}
		end
		if p2.mockNavigation then
			t = {
				NavigationProvider = reactModule.createElement(roactNavigationModule.Provider, { value = p2.mockNavigation }, t)
			}
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, t)
end