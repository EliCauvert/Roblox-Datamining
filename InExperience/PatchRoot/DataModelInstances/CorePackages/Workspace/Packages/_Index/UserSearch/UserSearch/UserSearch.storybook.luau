local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local RoactModule = require(Parent.Roact)
local DashModule = require(Parent.Dash)
local UIBloxModule = require(Parent.UIBlox)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local ApolloClientModule = require(Parent.ApolloClient)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
RoactModule.setGlobalConfig({ elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

local function v11(State)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function()
		-- upvalues: State (copy)
		return State
	end, {}, { RoduxModule.thunkMiddleware })
end

return {
	name = "UserSearch",
	storyRoot = UserSearch,
	roact = RoactModule,
	mapDefinition = function(p1)
		-- upvalues: DashModule (copy), config1 (copy)
		return DashModule.join(p1, {
			controls = DashModule.join(config1, p1.controls or {}),
			state = p1.state or {}
		})
	end,
	mapStory = function(p1)
		-- upvalues: RoactModule (copy), AppStyleProvider (copy), config (copy), RoactRoduxModule (copy), v11 (copy), ApolloClientModule (copy), MockApolloClientFunction (copy), MockLocaleFunction (copy)
		return function(p2)
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), config (upval), RoactRoduxModule (upval), v11 (upval), ApolloClientModule (upval), MockApolloClientFunction (upval), MockLocaleFunction (upval), p1 (copy)
			return RoactModule.createElement(AppStyleProvider, { style = p2 and config[p2.theme] or config.Default }, {
				storeProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = v11(p2.definition.state or {}) }, {
					apolloClient = RoactModule.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, { Child = MockLocaleFunction(p1, p2) })
				})
			})
		end
	end
}