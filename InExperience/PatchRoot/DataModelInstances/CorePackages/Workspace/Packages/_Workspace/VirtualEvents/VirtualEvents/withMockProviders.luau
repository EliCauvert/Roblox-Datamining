local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ApolloClientModule = require(VirtualEvents.Parent.ApolloClient)
local GraphQLServerModule = require(VirtualEvents.Parent.GraphQLServer)
local ReactModule = require(VirtualEvents.Parent.React)
local RoduxModule = require(VirtualEvents.Parent.Rodux)
local RoactNavigationModule = require(VirtualEvents.Parent.RoactNavigation)
local RoactRoduxModule = require(VirtualEvents.Parent.RoactRodux)
local RobloxAppLocalesModule = require(VirtualEvents.Parent.RobloxAppLocales)
local LocalizationModule = require(VirtualEvents.Parent.Localization)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local DesignTokenProvider = require(VirtualEvents.Parent.Style).DesignTokenProvider
local MockContentProvider = UIBloxModule.UnitTestHelpers.MockContentProvider
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local ContentProvider = UIBloxModule.App.Context.ContentProvider
local CombineReducersResult = RoduxModule.combineReducers({
	VirtualEvents = require(VirtualEvents.Parent.VirtualEventsState).installReducer()
})

return function(p1, p2)
	-- upvalues: RoduxModule (copy), CombineReducersResult (copy), ReactModule (copy), RoactRoduxModule (copy), ContentProvider (copy), MockContentProvider (copy), LocalizationModule (copy), RobloxAppLocalesModule (copy), FoundationProvider (copy), ColorMode (copy), AppStyleProvider (copy), Constants (copy), RoactNavigationModule (copy), DesignTokenProvider (copy), GraphQLServerModule (copy), ApolloClientModule (copy)
	local config = {
		StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = (if p2 then p2.store else nil) or RoduxModule.Store.new(CombineReducersResult, if p2 then p2.initialStoreState else nil, { RoduxModule.thunkMiddleware })
		}, {
			ContentProvider = ReactModule.createElement(ContentProvider.Provider, { value = MockContentProvider.new() }, {
				LocalizationProvider = ReactModule.createElement(LocalizationModule.LocalizationProvider, {
					localization = RobloxAppLocalesModule.Localization.new("en-us")
				}, {
					FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
						StyleProvider = ReactModule.createElement(AppStyleProvider, {
							style = {
								themeName = ColorMode.Dark,
								fontName = Constants.FontName.Gotham
							}
						}, {
							NavigationProvider = ReactModule.createElement(RoactNavigationModule.Provider, {
								value = {
									isFocused = function(): boolean
										return true
									end,
									goBack = function() end,
									addListener = function()
										return { remove = function() end }
									end
								}
							}, {
								DesignTokenProvider = ReactModule.createElement(DesignTokenProvider, { tokenMappers = {} }, {
									Children = ReactModule.createElement(ReactModule.Fragment, nil, p1)
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
			local NewResult = GraphQLServerModule.GraphQLServer.new({ mockResolvers = p2.mockResolvers })
			config = {
				ApolloProvider = ReactModule.createElement(ApolloClientModule.ApolloProvider, {
					client = ApolloClientModule.ApolloClient.new({
						cache = ApolloClientModule.InMemoryCache.new({}),
						link = ApolloClientModule.HttpLink.new({
							uri = "/api",
							fetch = function(_, p3)
								-- upvalues: NewResult (copy)
								return NewResult:fetchLocal(p3)
							end
						})
					})
				}, config)
			}
		end
		if p2.mockNavigation then
			config = {
				NavigationProvider = ReactModule.createElement(RoactNavigationModule.Provider, { value = p2.mockNavigation }, config)
			}
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, config)
end