local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UserSearchTileModule = require(UserSearch.Components.UserSearchTile)

local function _(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy)
	local User = p1.user
	
	return function(p2)
		-- upvalues: ReactModule (upval), UserSearchTileModule (upval), DashModule (upval), User (copy), p1 (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 200, 0, 350)
		}, {
			UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
				index = 1,
				size = UDim2.new(0, 200, 0, 250),
				user = {
					id = User.id,
					name = User.name or "Name:" .. User.id,
					displayName = User.displayName or "DisplayName:" .. User.id,
					previousUsernames = User.previousUsernames or {}
				},
				profileInsight = User.profileInsight,
				searchParameters = p1.searchParameters or { searchKeyword = "" },
				luaAppNetworkingRequests = {
					requestFriendship = function() end,
					acceptFriendRequest = function() end
				},
				luaAppNavigation = { navigateToUserInfo = function() end },
				fireAnalyticsEvent = DashModule.noop,
				shouldUseCompactTiles = p1.shouldUseCompactTiles
			}, p2))
		})
	end
end

local Users = require(UserSearch.TestHelpers.mockedUsersInfo).users
local config = { user = Users.yourself }
local User = config.user

local function Yourself(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User (copy), config (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User.id,
				name = User.name or "Name:" .. User.id,
				displayName = User.displayName or "DisplayName:" .. User.id,
				previousUsernames = User.previousUsernames or {}
			},
			profileInsight = User.profileInsight,
			searchParameters = config.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config.shouldUseCompactTiles
		}, p1))
	})
end

local config1 = { user = Users.following }
local User1 = config1.user

local function Following(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User1 (copy), config1 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User1.id,
				name = User1.name or "Name:" .. User1.id,
				displayName = User1.displayName or "DisplayName:" .. User1.id,
				previousUsernames = User1.previousUsernames or {}
			},
			profileInsight = User1.profileInsight,
			searchParameters = config1.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config1.shouldUseCompactTiles
		}, p1))
	})
end

local config2 = { user = Users.friend }
local User2 = config2.user

local function Friend(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User2 (copy), config2 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User2.id,
				name = User2.name or "Name:" .. User2.id,
				displayName = User2.displayName or "DisplayName:" .. User2.id,
				previousUsernames = User2.previousUsernames or {}
			},
			profileInsight = User2.profileInsight,
			searchParameters = config2.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config2.shouldUseCompactTiles
		}, p1))
	})
end

local config3 = { user = Users.incomingFriendship }
local User3 = config3.user

local function IncomingFriendship(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User3 (copy), config3 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User3.id,
				name = User3.name or "Name:" .. User3.id,
				displayName = User3.displayName or "DisplayName:" .. User3.id,
				previousUsernames = User3.previousUsernames or {}
			},
			profileInsight = User3.profileInsight,
			searchParameters = config3.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config3.shouldUseCompactTiles
		}, p1))
	})
end

local config4 = { user = Users.outgoingFriendship }
local User4 = config4.user

local function OutgoingFriendship(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User4 (copy), config4 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User4.id,
				name = User4.name or "Name:" .. User4.id,
				displayName = User4.displayName or "DisplayName:" .. User4.id,
				previousUsernames = User4.previousUsernames or {}
			},
			profileInsight = User4.profileInsight,
			searchParameters = config4.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config4.shouldUseCompactTiles
		}, p1))
	})
end

local config5 = {
	user = Users.previousUserName,
	searchParameters = { searchKeyword = "searchKeyword" }
}
local User5 = config5.user

local function PreviousUserName(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User5 (copy), config5 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User5.id,
				name = User5.name or "Name:" .. User5.id,
				displayName = User5.displayName or "DisplayName:" .. User5.id,
				previousUsernames = User5.previousUsernames or {}
			},
			profileInsight = User5.profileInsight,
			searchParameters = config5.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config5.shouldUseCompactTiles
		}, p1))
	})
end

local config6 = { user = Users.random }
local User6 = config6.user

local function v27(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User6 (copy), config6 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User6.id,
				name = User6.name or "Name:" .. User6.id,
				displayName = User6.displayName or "DisplayName:" .. User6.id,
				previousUsernames = User6.previousUsernames or {}
			},
			profileInsight = User6.profileInsight,
			searchParameters = config6.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config6.shouldUseCompactTiles
		}, p1))
	})
end

local config7 = { user = Users.notFriend }
local User7 = config7.user

local function NotFriend(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User7 (copy), config7 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User7.id,
				name = User7.name or "Name:" .. User7.id,
				displayName = User7.displayName or "DisplayName:" .. User7.id,
				previousUsernames = User7.previousUsernames or {}
			},
			profileInsight = User7.profileInsight,
			searchParameters = config7.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config7.shouldUseCompactTiles
		}, p1))
	})
end

local config8 = { user = Users.mutualFriends }
local User8 = config8.user

local function MutualFriends(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User8 (copy), config8 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User8.id,
				name = User8.name or "Name:" .. User8.id,
				displayName = User8.displayName or "DisplayName:" .. User8.id,
				previousUsernames = User8.previousUsernames or {}
			},
			profileInsight = User8.profileInsight,
			searchParameters = config8.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config8.shouldUseCompactTiles
		}, p1))
	})
end

local config9 = { user = Users.frequents }
local User9 = config9.user

local function Frequents(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User9 (copy), config9 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User9.id,
				name = User9.name or "Name:" .. User9.id,
				displayName = User9.displayName or "DisplayName:" .. User9.id,
				previousUsernames = User9.previousUsernames or {}
			},
			profileInsight = User9.profileInsight,
			searchParameters = config9.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config9.shouldUseCompactTiles
		}, p1))
	})
end

local config10 = {
	shouldUseCompactTiles = true,
	user = Users.incomingFriendship
}
local User10 = config10.user

local function CompactTileIncomingFriendship(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User10 (copy), config10 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User10.id,
				name = User10.name or "Name:" .. User10.id,
				displayName = User10.displayName or "DisplayName:" .. User10.id,
				previousUsernames = User10.previousUsernames or {}
			},
			profileInsight = User10.profileInsight,
			searchParameters = config10.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config10.shouldUseCompactTiles
		}, p1))
	})
end

local config11 = {
	shouldUseCompactTiles = true,
	user = Users.outgoingFriendship
}
local User11 = config11.user

local function CompactTileOutgoingFriendship(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User11 (copy), config11 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User11.id,
				name = User11.name or "Name:" .. User11.id,
				displayName = User11.displayName or "DisplayName:" .. User11.id,
				previousUsernames = User11.previousUsernames or {}
			},
			profileInsight = User11.profileInsight,
			searchParameters = config11.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config11.shouldUseCompactTiles
		}, p1))
	})
end

local config12 = { shouldUseCompactTiles = true, user = Users.mutualFriends }
local User12 = config12.user

local function CompactTileMutualFriends(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User12 (copy), config12 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User12.id,
				name = User12.name or "Name:" .. User12.id,
				displayName = User12.displayName or "DisplayName:" .. User12.id,
				previousUsernames = User12.previousUsernames or {}
			},
			profileInsight = User12.profileInsight,
			searchParameters = config12.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config12.shouldUseCompactTiles
		}, p1))
	})
end

local config13 = { user = Users.friendInGame }
local User13 = config13.user

local function FriendInGame(p1)
	-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User13 (copy), config13 (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 350)
	}, {
		UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
			index = 1,
			size = UDim2.new(0, 200, 0, 250),
			user = {
				id = User13.id,
				name = User13.name or "Name:" .. User13.id,
				displayName = User13.displayName or "DisplayName:" .. User13.id,
				previousUsernames = User13.previousUsernames or {}
			},
			profileInsight = User13.profileInsight,
			searchParameters = config13.searchParameters or { searchKeyword = "" },
			luaAppNetworkingRequests = {
				requestFriendship = function() end,
				acceptFriendRequest = function() end
			},
			luaAppNavigation = { navigateToUserInfo = function() end },
			fireAnalyticsEvent = DashModule.noop,
			shouldUseCompactTiles = config13.shouldUseCompactTiles
		}, p1))
	})
end

local config14 = { user = Users.friendInStudio }
local User14 = config14.user

return {
	yourself = Yourself,
	following = Following,
	friend = Friend,
	incomingFriendship = IncomingFriendship,
	outgoingFriendship = OutgoingFriendship,
	previousUserName = PreviousUserName,
	random = v27,
	notFriend = NotFriend,
	mutualFriends = MutualFriends,
	frequents = Frequents,
	compactTileIncomingFriendship = CompactTileIncomingFriendship,
	compactTileOutgoingFriendship = CompactTileOutgoingFriendship,
	compactTileMutualFriends = CompactTileMutualFriends,
	friendInGame = FriendInGame,
	friendInStudio = function(p1)
		-- upvalues: ReactModule (copy), UserSearchTileModule (copy), DashModule (copy), User14 (copy), config14 (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 200, 0, 350)
		}, {
			UserSearchTile = ReactModule.createElement(UserSearchTileModule, DashModule.join({
				index = 1,
				size = UDim2.new(0, 200, 0, 250),
				user = {
					id = User14.id,
					name = User14.name or "Name:" .. User14.id,
					displayName = User14.displayName or "DisplayName:" .. User14.id,
					previousUsernames = User14.previousUsernames or {}
				},
				profileInsight = User14.profileInsight,
				searchParameters = config14.searchParameters or { searchKeyword = "" },
				luaAppNetworkingRequests = {
					requestFriendship = function() end,
					acceptFriendRequest = function() end
				},
				luaAppNavigation = { navigateToUserInfo = function() end },
				fireAnalyticsEvent = DashModule.noop,
				shouldUseCompactTiles = config14.shouldUseCompactTiles
			}, p1))
		})
	end
}