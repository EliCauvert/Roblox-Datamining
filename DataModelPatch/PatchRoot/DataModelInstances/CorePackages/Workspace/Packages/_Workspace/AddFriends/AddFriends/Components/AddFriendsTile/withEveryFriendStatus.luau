local Parent = script:FindFirstAncestor("AddFriends").Parent
local RoduxModule = require(Parent.Rodux)
local LlamaModule = require(Parent.llama)
local FriendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType
local AddFriendsStateModule = require(Parent.AddFriendsState)
local User = AddFriendsStateModule.RoduxUsers.Models.User
local FriendStatuses = {
	["36"] = Enum.FriendStatus.NotFriend,
	["37"] = Enum.FriendStatus.FriendRequestSent,
	["38"] = Enum.FriendStatus.FriendRequestReceived,
	["39"] = Enum.FriendStatus.Friend,
	["40"] = Enum.FriendStatus.FriendRequestReceived,
	["41"] = Enum.FriendStatus.FriendRequestReceived
}
local FullContextInfo = {
	tileProps = {
		sentFromExperienceName = "TestSentFrom",
		amIFollowingUser = true,
		isUserFollowingMe = true
	},
	userProps = {
		lastLocation = "TestLastLocation",
		mutualFriends = { {}, {}, {} },
		userPresenceType = AddFriendsStateModule.RoduxPresence.Enums.PresenceType.InGame
	}
}

return {
	localUserId = "0",
	friendWithContextInfo = {
		FriendWithFullContextInfo = LlamaModule.Dictionary.joinDeep(FullContextInfo, {
			userProps = {
				username = "FriendRequestReceived",
				displayName = "WithFullContextInfo"
			}
		}),
		FriendWithMutualFriends = {
			tileProps = {},
			userProps = {
				username = "FriendRequestReceived",
				displayName = "WithMutualFriends",
				mutualFriends = FullContextInfo.userProps.mutualFriends
			}
		},
		Contact = {
			tileProps = {},
			userProps = {
				entityDisplayName = "entityDisplayName",
				thumbnailEntities = { avatarImageUrl = "avatarImageUrl" },
				contextType = AddFriendsStateModule.RoduxFriends.Enums.RecommendationContextType.Contacts
			}
		},
		FriendWithSentFrom = {
			tileProps = {
				sentFromExperienceName = FullContextInfo.tileProps.sentFromExperienceName
			},
			userProps = {
				username = "FriendRequestReceived",
				displayName = "WithSentContext",
				id = "40"
			}
		},
		FriendYouAreFollowing = {
			tileProps = {
				amIFollowingUser = FullContextInfo.tileProps.amIFollowingUser
			},
			userProps = {
				username = "FriendRequestReceived",
				displayName = "WithYouAreFollowing",
				id = "38"
			}
		},
		FriendFollowingMe = {
			tileProps = {
				isUserFollowingMe = FullContextInfo.tileProps.isUserFollowingMe
			},
			userProps = {
				username = "FriendRequestReceived",
				displayName = "WithFollowingMe",
				id = "37",
				followers = {}
			}
		},
		FriendViaQRCode = {
			tileProps = {
				originSourceType = FriendshipOriginSourceType.QrCode.rawValue()
			},
			userProps = {
				username = "FriendRequestReceived",
				displayName = "WithQRCode",
				id = "41"
			}
		},
		FriendNoFriend = {
			tileProps = {},
			userProps = { username = "NotFriend", displayName = "Friend to add" }
		},
		FriendNoFriendWithNickname = {
			tileProps = {},
			userProps = {
				username = "NotFriend",
				displayName = "Friend to add",
				senderNickname = "SenderNickname"
			}
		},
		FriendPending = {
			tileProps = {},
			userProps = {
				username = "FriendRequestSent",
				displayName = "Friend pending"
			}
		}
	},
	fullContextInfo = FullContextInfo,
	userForStatus = function(p1, p2)
		-- upvalues: LlamaModule (copy), FriendStatuses (copy), User (copy)
		return LlamaModule.Dictionary.join(User.mock({ id = LlamaModule.Dictionary.flip(FriendStatuses)[p1] }), p2)
	end,
	baseStore = RoduxModule.Store.new(function()
		-- upvalues: FriendStatuses (copy), FriendshipOriginSourceType (copy)
		return {
			LocalUserId = "0",
			FriendStatuses = FriendStatuses,
			ScreenSize = Vector2.new(500, 500),
			AddFriends = {
				RequestsFromOriginSourceType = { ["41"] = FriendshipOriginSourceType.QrCode.rawValue() },
				IsUserFollowing = {
					["36"] = { isFollowing = false, isFollowed = false },
					["37"] = { isFollowing = false, isFollowed = true },
					["38"] = { isFollowing = true, isFollowed = false },
					["39"] = { isFollowing = true, isFollowed = true },
					["40"] = { isFollowing = false, isFollowed = false },
					["41"] = { isFollowing = false, isFollowed = false }
				},
				Friends = {
					requests = {
						sourceUniverseIds = {
							["36"] = 0,
							["37"] = 0,
							["38"] = 0,
							["39"] = 0,
							["40"] = 1,
							["41"] = 0
						},
						mutualFriends = {
							["36"] = { 1, 2, 4, 4 },
							["37"] = {},
							["38"] = {},
							["39"] = {},
							["40"] = {},
							["41"] = {}
						}
					}
				},
				Games = { byGameId = { ["1"] = { name = "someGameName" } } },
				NetworkStatus = {}
			}
		}
	end, {}, { RoduxModule.thunkMiddleware })
}