local SocialTab = script:FindFirstAncestor("SocialTab")
local Parent = SocialTab.Parent
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local Rodux = DependenciesModule.Rodux
local RoactRodux = DependenciesModule.RoactRodux
local ApolloClientModule = require(Parent.ApolloClient)
local UserProfilesModule = require(Parent.UserProfiles)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local UnitTestHelpers = require(SocialTab.devDependencies).UnitTestHelpers
local NewResult = Rodux.Store.new(function(p1, _)
	return p1
end, { ScreenSize = Vector2.new(100, 100) }, { Rodux.thunkMiddleware })

return function(p1, p2, Size)
	-- upvalues: MockApolloClientFunction (copy), UserProfilesModule (copy), Roact (copy), ApolloClientModule (copy), RoactRodux (copy), NewResult (copy), UnitTestHelpers (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local MockApolloClientResult = MockApolloClientFunction({})
	MockApolloClientResult:writeQuery({
		variables = { userIds = { "1" } },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
		data = {
			userProfiles = {
				{
					__typename = "UserProfile",
					id = "1",
					names = {
						__typename = "Names",
						combinedName = "Stacey",
						username = "This shouldn't show"
					}
				}
			}
		}
	})
	MockApolloClientResult:writeQuery({
		variables = { userIds = { "test" } },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
		data = {
			userProfiles = {
				{
					__typename = "UserProfile",
					id = "test",
					names = {
						__typename = "Names",
						combinedName = "DisplayName",
						username = "Username"
					}
				}
			}
		}
	})
	local MountResult = Roact.mount(UnitTestHelpers.mockLocale((Roact.createFragment({
		apolloProvider = Roact.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientResult }, {
			storeProvider = Roact.createElement(RoactRodux.StoreProvider, { store = NewResult }, {
				styleProvider = UnitTestHelpers.createStyleProvider({
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