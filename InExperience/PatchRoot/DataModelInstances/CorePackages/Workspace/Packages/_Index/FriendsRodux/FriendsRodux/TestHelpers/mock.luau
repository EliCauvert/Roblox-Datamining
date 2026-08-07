local roduxModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux)

return {
	mockGetFriendsFromUserId = "GET_FRIENDS_SUCCEEDED_ACTION",
	mockGetFriendsFromUserIdAction = roduxModule.makeActionCreator("GET_FRIENDS_SUCCEEDED_ACTION", function(p0, p1, p2) --[[ line: 8 ]]
		return {
			responseBody = { data = p1 },
			namedIds = { users = p0 },
			queryArgs = { userSort = p2 }
		}
	end),
	mockGetFriendsCountFromUserId = "GET_FRIENDS_COUNT_SUCCEEDED_ACTION",
	mockGetFriendsCountFromUserIdAction = roduxModule.makeActionCreator("GET_FRIENDS_COUNT_SUCCEEDED_ACTION", function(p3, p4) --[[ line: 20 ]]
		return { responseBody = { count = p4 }, namedIds = { users = p3 } }
	end),
	mockRequestCount = "GET_REQUEST_COUNT",
	mockRequestCountAction = roduxModule.makeActionCreator("GET_REQUEST_COUNT", function(p5) --[[ line: 29 ]]
		return { responseBody = { count = p5 } }
	end),
	mockGetNewRequestsCount = "GET_NEW_FRIEND_REQUEST_COUNT",
	mockNewFriendRequestsCountAction = roduxModule.makeActionCreator("GET_NEW_FRIEND_REQUEST_COUNT", function(p6) --[[ line: 38 ]]
		return { responseBody = { count = p6 } }
	end),
	mockClearNewFriendRequests = "CLEAR_NEW_FRIEND_REQUEST_COUNT",
	mockClearNewFriendRequestsAction = roduxModule.makeActionCreator("GET_NEW_FRIEND_REQUEST_COUNT", function(p7) --[[ line: 47 ]]
		return { responseBody = { status = p7 } }
	end),
	mockUnfriendTargetUserId = "UNFRIEND_TARGET_USER_ID",
	mockUnfriendTargetUserIdAction = roduxModule.makeActionCreator("UNFRIEND_TARGET_USER_ID", function(p8) --[[ line: 56 ]]
		return {
			namedIds = { users = p8.targetUserId },
			additionalData = { currentUserId = p8.currentUserId }
		}
	end),
	mockAcceptFriendRequestFromUserId = "ACCEPT_REQUEST_FROM_USER_ID",
	mockAcceptFriendRequestFromUserIdAction = roduxModule.makeActionCreator("ACCEPT_REQUEST_FROM_USER_ID", function(p9) --[[ line: 66 ]]
		return {
			ids = p9.ids,
			additionalData = { currentUserId = p9.currentUserId }
		}
	end),
	mockRequestFriendshipFromUserId = "REQUEST_FRIENDSHIP_FROM_USER_ID",
	mockRequestFriendshipFromUserIdAction = roduxModule.makeActionCreator("REQUEST_FRIENDSHIP_FROM_USER_ID", function(p10) --[[ line: 75 ]]
		return {
			namedIds = { users = p10.users },
			additionalData = { currentUserId = p10.currentUserId }
		}
	end),
	mockRequestFriendshipFromContactId = "REQUEST_FRIENDSHIP_FROM_CONTACT_ID",
	mockRequestFriendshipFromContactIdAction = roduxModule.makeActionCreator("REQUEST_FRIENDSHIP_FROM_CONTACT_ID", function(p11) --[[ line: 85 ]]
		return {
			namedIds = { contacts = p11.contacts },
			additionalData = { currentUserId = p11.currentUserId }
		}
	end),
	mockDeclineFriendRequestFromUserId = "DECLINE_REQUEST_FROM_USER_ID",
	mockDeclineFriendRequestFromUserIdAction = roduxModule.makeActionCreator("DECLINE_REQUEST_FROM_USER_ID", function(p12) --[[ line: 96 ]]
		return { ids = p12.ids }
	end),
	mockGetFriendRequests = "GET_FRIEND_REQUESTS",
	mockGetFriendRequestsAction = roduxModule.makeActionCreator("GET_FRIEND_REQUESTS", function(p13) --[[ line: 104 ]]
		return {
			responseBody = if p13 then p13.data else {
				previousPageCursor = nil,
				nextPageCursor = "637699238608300000-46587081730_1_986dd841c63787446d580a8055b3fa73",
				data = {
					{
						mutualFriendsList = nil,
						description = "me dan robux :) gracias",
						created = "2021-01-19T02:01:21.997Z",
						isBanned = false,
						externalAppDisplayName = nil,
						id = 123,
						name = "TestUser_1",
						displayName = "TestUser_1",
						friendRequest = {
							sentAt = "2021-10-22T23:20:18.163Z",
							senderId = 123,
							sourceUniverseId = nil,
							contactName = "Name",
							senderNickname = "nickname"
						}
					},
					{
						description = "me dan robux :) gracias",
						created = "2021-01-19T02:01:21.997Z",
						isBanned = false,
						externalAppDisplayName = nil,
						id = 456,
						name = "TestUser_2",
						displayName = "TestUser_2",
						friendRequest = {
							sentAt = "2021-10-22T23:20:18.163Z",
							senderId = 456,
							sourceUniverseId = 2092410051,
							contactName = nil,
							senderNickname = nil,
							originSourceType = "qrCode"
						},
						mutualFriendsList = { 123, 345 }
					}
				}
			},
			additionalData = { currentUserId = if p13 then p13.currentUserId else nil }
		}
	end),
	mockDeclineAllFriendRequests = "DECLINE_ALL_FRIEND_REQUESTS",
	mockDeclineAllFriendRequestsAction = roduxModule.makeActionCreator("DECLINE_ALL_FRIEND_REQUESTS", function(p14) --[[ line: 152 ]]
		return { ids = p14.ids }
	end),
	mockGetFriendRecommendationsFromUserId = "GET_FRIEND_RECOMMENDATIONS_FROM_USER_ID",
	mockGetFriendRecommendationsFromUserIdAction = roduxModule.makeActionCreator("GET_FRIEND_RECOMMENDATIONS_FROM_USER_ID", function(p15, p16) --[[ line: 161 ]]
		return {
			responseBody = {
				data = p16 or {
					{
						friendRequest = nil,
						rank = 2,
						description = "string",
						created = "2022-02-25T21:22:29.217Z",
						isBanned = true,
						externalAppDisplayName = "string",
						id = 89,
						name = "red",
						displayName = "coolDisplayName",
						mutualFriendsList = { "1", "2" }
					},
					{
						friendRequest = nil,
						rank = 4,
						description = "string",
						created = "2022-02-25T21:22:29.217Z",
						isBanned = true,
						externalAppDisplayName = "string",
						id = 19,
						name = "reputation",
						contextType = "MutualFriends",
						displayName = "anotherCoolName",
						mutualFriendsList = {}
					},
					{
						rank = 3,
						description = "string",
						created = "2022-02-25T21:22:29.217Z",
						isBanned = true,
						externalAppDisplayName = "string",
						id = 25,
						name = "reputation",
						contextType = "MutualFriends",
						displayName = "anotherCoolName",
						mutualFriendsList = {},
						friendRequest = {
							sentAt = "2021-10-22T23:20:18.163Z",
							senderId = 123,
							sourceUniverseId = nil,
							contactName = nil
						}
					},
					{
						rank = 1,
						description = "string",
						created = "2022-02-25T21:22:29.217Z",
						isBanned = true,
						externalAppDisplayName = "string",
						id = 0,
						contactId = "contactId",
						name = "reputation",
						contextType = "Contacts",
						displayName = "Contact Name",
						mutualFriendsList = {},
						thumbnailEntities = {
							avatarImageUrl = "avatarImageUrl",
							headshotImageUrl = "headshotImageUrl"
						}
					}
				}
			},
			namedIds = { users = p15 or 678 }
		}
	end),
	mockGetFriendshipStatus = "GET_FRIENDSHIP_STATUS",
	mockGetFriendshipStatusAction = roduxModule.makeActionCreator("GET_FRIENDSHIP_STATUS", function(_) --[[ line: 236 ]]
		return {
			responseBody = {
				data = {
					{ id = 123, status = "NotFriends" },
					{ id = 355, status = "Friends" }
				}
			}
		}
	end),
	mockGetFriendshipStatuses = "GET_FRIENDSHIP_STATUSES",
	mockGetFriendshipStatusesAction = roduxModule.makeActionCreator("GET_FRIENDSHIP_STATUSES", function(_) --[[ line: 254 ]]
		return {
			responseBody = {
				data = {
					{ id = 123, status = "NotFriends" },
					{ id = 355, status = "Friends" }
				}
			}
		}
	end),
	mockGetUserExtendedFriendshipStatus = "GET_EXTENDED_FRIENDSHIP_STATUS",
	mockGetUserExtendedFriendshipStatusAction = roduxModule.makeActionCreator("GET_EXTENDED_FRIENDSHIP_STATUS", function(p17, p18) --[[ line: 274 ]]
		return { responseBody = p18, ids = { p17 } }
	end),
	mockGetFollowingExists = "GET_FOLLOWING_EXISTS",
	mockGetFollowingExistsAction = roduxModule.makeActionCreator("GET_FOLLOWING_EXISTS", function(_, _) --[[ line: 292 ]]
		return {
			responseBody = {
				followings = {
					{ userId = 123, isFollowing = true, isFollowed = true },
					{ userId = 355, isFollowing = false, isFollowed = true }
				}
			}
		}
	end),
	mockBlockUserById = "BLOCK_USER_BY_ID",
	mockBlockUserByIdAction = roduxModule.makeActionCreator("BLOCK_USER_BY_ID", function(p19, p20) --[[ line: 283 ]]
		return {
			responseBody = p20,
			namedIds = { users = p19.userId },
			additionalData = { currentUserId = p19.currentUserId }
		}
	end),
	friendsNetworkingMock = {
		GetFriendshipStatus = { Succeeded = { name = "GET_FRIENDSHIP_STATUS" } },
		GetFriendshipStatuses = { Succeeded = { name = "GET_FRIENDSHIP_STATUSES" } },
		GetFriendsFromUserId = { Succeeded = { name = "GET_FRIENDS_SUCCEEDED_ACTION" } },
		GetFriendsCountFromUserId = {
			Succeeded = { name = "GET_FRIENDS_COUNT_SUCCEEDED_ACTION" }
		},
		UnfriendTargetUserId = { Succeeded = { name = "UNFRIEND_TARGET_USER_ID" } },
		GetFriendRequestsCount = { Succeeded = { name = "GET_REQUEST_COUNT" } },
		GetNewFriendRequestsCount = { Succeeded = { name = "GET_NEW_FRIEND_REQUEST_COUNT" } },
		ClearNewFriendRequests = { Succeeded = { name = "CLEAR_NEW_FRIEND_REQUEST_COUNT" } },
		AcceptFriendRequestFromUserId = { Succeeded = { name = "ACCEPT_REQUEST_FROM_USER_ID" } },
		DeclineFriendRequestFromUserId = { Succeeded = { name = "DECLINE_REQUEST_FROM_USER_ID" } },
		GetFriendRequests = { Succeeded = { name = "GET_FRIEND_REQUESTS" } },
		DeclineAllFriendRequests = { Succeeded = { name = "DECLINE_ALL_FRIEND_REQUESTS" } },
		GetFriendRecommendationsFromUserId = {
			Succeeded = { name = "GET_FRIEND_RECOMMENDATIONS_FROM_USER_ID" }
		},
		RequestFriendshipFromUserId = { Succeeded = { name = "REQUEST_FRIENDSHIP_FROM_USER_ID" } },
		RequestFriendshipFromContactId = {
			Succeeded = { name = "REQUEST_FRIENDSHIP_FROM_CONTACT_ID" }
		},
		GetExtendedFriendshipStatus = { Succeeded = { name = "GET_EXTENDED_FRIENDSHIP_STATUS" } },
		GetFollowingExists = { Succeeded = { name = "GET_FOLLOWING_EXISTS" } }
	},
	networkingBlockingMock = {
		BlockUserById = { Succeeded = { name = "BLOCK_USER_BY_ID" } }
	},
	userBlockingNetworkingMock = {
		BlockUserById = { Succeeded = { name = "BLOCK_USER_BY_ID" } }
	}
}