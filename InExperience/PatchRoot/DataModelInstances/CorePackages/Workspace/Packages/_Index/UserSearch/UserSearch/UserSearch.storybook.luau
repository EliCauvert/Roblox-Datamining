local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local roactModule = require(parent.Roact)
local dashModule = require(parent.Dash)
local UIBloxModule = require(parent.UIBlox)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local apolloClientModule = require(parent.ApolloClient)
local mockApolloClient = require(parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roactModule.setGlobalConfig({ elementTracing = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

local var1 = function(p1)
	-- upvalues: roduxModule (ref)
	return roduxModule.Store.new(function()
		-- upvalues: p1 (ref)
		return p1
	end, {}, { roduxModule.thunkMiddleware })
end

return {
	name = "UserSearch",
	storyRoot = userSearch,
	roact = roactModule,
	mapDefinition = function(p1)
		-- upvalues: dashModule (ref), t_1 (ref)
		return dashModule.join(p1, {
			controls = dashModule.join(t_1, p1.controls or {}),
			state = p1.state or {}
		})
	end,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), appStyleProvider (ref), t (ref), roactRoduxModule (ref), var1 (ref), apolloClientModule (ref), mockApolloClient (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: roactModule (copy), appStyleProvider (copy), t (copy), roactRoduxModule (copy), var1 (copy), apolloClientModule (copy), mockApolloClient (copy), mockLocale (copy), p1 (ref)
			return roactModule.createElement(appStyleProvider, { style = if p2 then t[p2.theme] else t.Default }, {
				storeProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = var1(p2.definition.state or {}) }, {
					apolloClient = roactModule.createElement(apolloClientModule.ApolloProvider, { client = mockApolloClient({}) }, { Child = mockLocale(p1, p2) })
				})
			})
		end
	end
}