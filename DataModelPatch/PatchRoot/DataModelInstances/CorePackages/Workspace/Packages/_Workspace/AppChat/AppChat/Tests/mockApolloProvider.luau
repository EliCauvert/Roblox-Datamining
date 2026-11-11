local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local ApolloClientModule = require(Parent.ApolloClient)
local Queries = require(Parent.ApolloLocalState).queries
local MockUserDataModule = require(AppChat.Users.MockUserData)
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient

return function(AnalyticsElement)
	-- upvalues: MockApolloClientFunction (copy), MockUserDataModule (copy), UserProfilesModule (copy), Queries (copy), ReactModule (copy), ApolloClientModule (copy)
	local MockApolloClientResult = MockApolloClientFunction({})
	UserProfilesModule.TestUtils.writeProfileDataToCache(MockApolloClientResult, (MockUserDataModule.createMockApolloProfiles()))
	MockApolloClientResult:writeQuery({
		loading = false,
		variables = { userId = "1", sort = 1, nextCursor = "" },
		query = Queries.allFriendsByUserId,
		data = {
			allFriendsByUserId = {
				__typename = "FriendsListPage",
				prevCursor = "",
				curCursor = "",
				nextCursor = "",
				targetUserId = "1",
				friends = {
					{
						__typename = "Friend",
						id = "2",
						hasVerifiedBadge = false,
						targetUserId = "1"
					}
				}
			}
		}
	})
	MockApolloClientResult:writeQuery({
		loading = false,
		variables = { userId = "1", sort = 1 },
		query = Queries.onlineFriendsByUserId,
		data = {
			onlineFriendsByUserId = {
				{
					__typename = "Friend",
					id = "3",
					targetUserId = "1",
					sortScore = 30,
					presence = {
						__typename = "UserPresence",
						id = "3",
						userPresenceType = "InGame",
						lastLocation = "location",
						lastOnline = "time",
						gameId = "game-id",
						placeId = "123",
						rootPlaceId = "456",
						universeId = "789"
					}
				},
				{
					__typename = "Friend",
					id = "422502",
					targetUserId = "1",
					sortScore = 30.3,
					presence = {
						__typename = "UserPresence",
						id = "422502",
						userPresenceType = "InGame",
						lastLocation = "location",
						lastOnline = "time",
						gameId = "game-id",
						placeId = "123",
						rootPlaceId = "456",
						universeId = "789"
					}
				}
			}
		}
	})
	
	return ReactModule.createElement(ApolloClientModule.ApolloProvider, { client = MockApolloClientResult }, { AnalyticsElement = AnalyticsElement })
end