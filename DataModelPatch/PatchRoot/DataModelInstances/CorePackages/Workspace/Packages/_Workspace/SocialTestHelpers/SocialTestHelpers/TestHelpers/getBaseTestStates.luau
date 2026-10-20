local Parent = script:FindFirstAncestor("SocialTestHelpers").Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local Llama = LuaSocialLibrariesDepsModule.llama
local Presence = LuaSocialLibrariesDepsModule.RoduxPresence.config({}).Models.Presence
local User = LuaSocialLibrariesDepsModule.RoduxUsers.config({}).Models.User
local RecommendationContextType = require(Parent.FriendsRodux).config().Enums.RecommendationContextType
local ByUserId = {}

for i = 1, 40 do
	local MockResult = User.mock({
		hasVerifiedBadge = false,
		id = tostring(i),
		displayName = "displayName" .. tostring(i),
		username = "username" .. tostring(i)
	})
	ByUserId[MockResult.id] = MockResult
end
local KeysResult = Llama.Dictionary.keys(ByUserId)
ByUserId["40"].displayName = "offlineFriend1"
ByUserId["39"].displayName = "offlineFriend2"
ByUserId["38"].displayName = "onlineFriend"
ByUserId["37"].displayName = "inGameFriend"
ByUserId["36"].displayName = "inStudioFriend"
local Test = {
	ByUserId["40"].id,
	ByUserId["39"].id,
	ByUserId["38"].id,
	ByUserId["37"].id,
	ByUserId["36"].id
}
local ByUserId1 = Llama.List.reduce(ByUserId, function(p1, p2)
	-- upvalues: Llama (copy), Presence (copy)
	return Llama.Dictionary.join(p1, {
		[p2.id] = Presence.format(Presence.mock({ userPresenceType = 0 }))
	})
end)
local Test1 = {
	recom1 = {
		id = "recom1",
		rank = 3,
		mutualFriendsList = {},
		contextType = RecommendationContextType.MutualFriends
	},
	recom2 = {
		id = "recom2",
		rank = 1,
		mutualFriendsList = {},
		contextType = RecommendationContextType.MutualFriends
	},
	recom3 = {
		id = "recom3",
		rank = 5,
		mutualFriendsList = {},
		contextType = RecommendationContextType.MutualFriends
	},
	recom4 = {
		id = "recom4",
		rank = 4,
		mutualFriendsList = {},
		contextType = RecommendationContextType.MutualFriends
	}
}
local ReduceResult = Llama.List.reduce(Llama.Dictionary.keys(Test1), function(p1, Key)
	-- upvalues: Test1 (copy)
	p1[Key] = {
		id = tostring(Key),
		displayName = "displayName" .. tostring(Key),
		username = "username" .. tostring(Key),
		rank = Test1[Key].rank,
		contextType = Test1[Key].contextType
	}
	
	return p1
end, {})
ByUserId1 = {
	["40"] = Presence.format(Presence.mock({ userPresenceType = 0 })),
	["39"] = Presence.format(Presence.mock({ userPresenceType = 0 })),
	["38"] = Presence.format(Presence.mock({ userPresenceType = 1 })),
	["37"] = Presence.format(Presence.mock({ userPresenceType = 2 })),
	["36"] = Presence.format(Presence.mock({ userPresenceType = 3 }))
}

return function(p1)
	-- upvalues: Test (copy), ByUserId (copy), ByUserId1 (ref), KeysResult (copy), Test1 (copy), Llama (copy), ReduceResult (copy)
	local RoduxKey = p1 and p1.roduxKey or "FriendsLanding"
	
	return {
		noFriends = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = { byUserId = {}, countsByUserId = {} },
				Users = {},
				Presence = {},
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done"
				}
			},
			ScreenSize = Vector2.new(1000, 100)
		},
		smallNumbersOfFriends = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = {
					byUserId = { test = Test },
					countsByUserId = { test = #Test },
					friendsRankByUserId = {
						test = {
							["36"] = 10,
							["37"] = 1,
							["38"] = 3,
							["39"] = 2,
							["40"] = 5
						}
					},
					recommendations = {}
				},
				Users = { byUserId = ByUserId },
				Presence = { byUserId = ByUserId1 },
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done"
				}
			},
			ScreenSize = Vector2.new(1000, 100)
		},
		manyFriends = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = {
					byUserId = { test = KeysResult },
					countsByUserId = { test = #KeysResult },
					requests = { receivedCount = 12 },
					recommendations = {}
				},
				Users = { byUserId = ByUserId },
				Presence = { byUserId = ByUserId1 },
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done",
					["https://friends.roblox.com/v1/users/test/friends/inactive"] = "Done"
				}
			},
			ScreenSize = Vector2.new(1000, 100)
		},
		deletedFriends = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = { byUserId = {}, countsByUserId = {} },
				DeletedUsers = { byUserId = {} },
				Users = {},
				Presence = {},
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done"
				}
			},
			ScreenSize = Vector2.new(600, 300)
		},
		friendsAndRecommendations = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = {
					byUserId = { test = Test },
					countsByUserId = { test = #Test },
					recommendations = { byUserId = { test = Test1 }, bySource = {} },
					requests = { receivedCount = 28 },
					friendshipStatus = {
						recom1 = Enum.FriendStatus.NotFriend,
						recom2 = Enum.FriendStatus.NotFriend,
						recom3 = Enum.FriendStatus.Unknown,
						recom4 = Enum.FriendStatus.FriendRequestSent
					}
				},
				Users = { byUserId = Llama.Dictionary.join(ByUserId, ReduceResult) },
				Presence = { byUserId = ByUserId1 },
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done"
				}
			},
			ScreenSize = Vector2.new(1000, 100)
		},
		recommendationsOnly = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = {
					byUserId = {},
					countsByUserId = {},
					recommendations = {
						byUserId = { test = Test1 },
						bySource = {
							AddFriendsPage = {
								recom1 = true,
								recom2 = true,
								recom3 = true,
								recom4 = true
							}
						}
					},
					requests = { receivedCount = 28 },
					friendshipStatus = {
						recom1 = Enum.FriendStatus.NotFriend,
						recom2 = Enum.FriendStatus.NotFriend,
						recom3 = Enum.FriendStatus.Unknown,
						recom4 = Enum.FriendStatus.FriendRequestSent
					}
				},
				Users = { byUserId = Llama.Dictionary.join(ByUserId, ReduceResult) },
				Presence = { byUserId = ByUserId1 },
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done"
				}
			},
			ScreenSize = Vector2.new(1000, 100)
		},
		manyFriendsAndRecommendations = {
			LocalUserId = "test",
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RoduxKey] = {
				Friends = {
					byUserId = { test = KeysResult },
					countsByUserId = { test = #KeysResult },
					recommendations = { byUserId = { test = Test1 }, bySource = {} }
				},
				Users = { byUserId = Llama.Dictionary.join(ByUserId, ReduceResult) },
				Presence = { byUserId = ByUserId1 },
				NetworkStatus = {
					["https://friends.roblox.com/v1/users/test/friends"] = "Done"
				}
			},
			ScreenSize = Vector2.new(1000, 100)
		}
	}
end