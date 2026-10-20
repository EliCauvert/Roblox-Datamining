local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local Rodux = DependenciesModule.Rodux
local RoactRodux = DependenciesModule.RoactRodux
local UnitTestHelpers = require(FriendsLanding.devDependencies).UnitTestHelpers
local InstallReducerModule = require(FriendsLanding.installReducer)
local ApolloClientModule = require(Parent.ApolloClient)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient

return function(Callback)
	-- upvalues: Roact (copy), Rodux (copy), InstallReducerModule (copy), UnitTestHelpers (copy), ApolloClientModule (copy), MockApolloClientFunction (copy), RoactRodux (copy)
	return function(p1, p2, Size)
		-- upvalues: Roact (upval), Rodux (upval), InstallReducerModule (upval), UnitTestHelpers (upval), ApolloClientModule (upval), MockApolloClientFunction (upval), RoactRodux (upval), Callback (copy)
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = game:GetService("CoreGui")
		local MountResult = Roact.mount(Callback((Roact.createFragment({
			styleProvider = UnitTestHelpers.createStyleProvider({
				apolloClient = Roact.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientFunction({}) }, {
					StoreProvider = Roact.createElement(RoactRodux.StoreProvider, {
						store = Rodux.Store.new(Rodux.combineReducers({
							FriendsLanding = InstallReducerModule(),
							LocalUserId = function(p3)
								return p3
							end
						}), {}, { Rodux.thunkMiddleware })
					}, {
						myElement = if Size then Roact.createElement("Frame", { Size = Size }, { testElement = Roact.createElement(p1, p2) }) else Roact.createElement(p1, p2)
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
end