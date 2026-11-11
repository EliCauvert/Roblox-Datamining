local Parent = script:FindFirstAncestor("AddFriends").Parent
local RoduxModule = require(Parent.Rodux)
local LlamaModule = require(Parent.llama)
local GetBaseTestStatesFunction = require(Parent.Dev.SocialTestHelpers).TestHelpers.getBaseTestStates
local RODUXKEY = require(Parent.AddFriendsState).RODUX_KEY

return function(p1, p2, p3, p4)
	-- upvalues: GetBaseTestStatesFunction (copy), RODUXKEY (copy), LlamaModule (copy), RoduxModule (copy)
	local RecommendationsOnly = if p2 and not p1 then GetBaseTestStatesFunction({ roduxKey = RODUXKEY }).recommendationsOnly elseif p2 and p1 then GetBaseTestStatesFunction({ roduxKey = RODUXKEY }).friendsAndRecommendations else GetBaseTestStatesFunction({ roduxKey = RODUXKEY }).smallNumbersOfFriends
	local RecommendationsOnlyEntry = RecommendationsOnly[RODUXKEY]
	local RequestsById = {}
	
	for i = 1, 40 do
		RequestsById[tostring(i)] = i
	end
	local ByUserId = {}
	local ReceivedCount = 0
	local NextPageCursor: string? = nil
	local UserFollowers = {}
	local IsUserFollowing = {}
	local ByGameId = {}
	local SourceUniverseIds = {}
	local MutualFriends = {}
	local Recommendations = {}
	
	if p1 then
		ByUserId = RecommendationsOnlyEntry.Users.byUserId
		ReceivedCount = p4 or #LlamaModule.Dictionary.keys(RecommendationsOnlyEntry.Users.byUserId)
		NextPageCursor = "next"
		SourceUniverseIds = {
			["36"] = "game_universe_id_36",
			["37"] = "game_universe_id_37",
			["38"] = "game_universe_id_39"
		}
		IsUserFollowing = {
			["36"] = { isFollowing = true, isFollowed = true },
			["37"] = { isFollowing = false, isFollowed = true },
			["38"] = { isFollowing = true, isFollowed = false },
			["39"] = { isFollowing = true, isFollowed = true }
		}
		ByGameId = {
			game_universe_id_36 = { name = "test game" },
			game_universe_id_37 = { name = "test game" },
			game_universe_id_38 = { name = "test game" }
		}
		MutualFriends = {
			["1"] = { "Bob", "Corey", "Andrew" },
			["2"] = {},
			["3"] = {}
		}
	end
	if p2 then
		Recommendations = GetBaseTestStatesFunction({ roduxKey = RODUXKEY }).recommendationsOnly[RODUXKEY].Friends.recommendations
	end
	return RoduxModule.Store.new(function()
		-- upvalues: RecommendationsOnly (copy), LlamaModule (upval), RecommendationsOnlyEntry (copy), RODUXKEY (upval), RequestsById (copy), ByUserId (ref), ReceivedCount (ref), NextPageCursor (ref), SourceUniverseIds (ref), MutualFriends (ref), Recommendations (ref), UserFollowers (copy), IsUserFollowing (ref), ByGameId (ref), p3 (copy)
		return {
			ScreenSize = Vector2.new(540, 960),
			TopBar = { topBarHeight = 60 },
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			LocalUserId = RecommendationsOnly.LocalUserId,
			FriendStatuses = LlamaModule.Dictionary.map(RecommendationsOnlyEntry.Users.byUserId, function()
				return Enum.FriendStatus.FriendRequestReceived
			end),
			[RODUXKEY] = LlamaModule.Dictionary.join({
				Friends = {
					requests = {
						order = { requestsById = RequestsById },
						byUserId = ByUserId,
						receivedCount = ReceivedCount,
						nextPageCursor = NextPageCursor,
						sourceUniverseIds = SourceUniverseIds,
						mutualFriends = MutualFriends
					},
					recommendations = Recommendations
				},
				Users = RecommendationsOnlyEntry.Users,
				Presence = RecommendationsOnlyEntry.Presence,
				NetworkStatus = RecommendationsOnlyEntry.NetworkStatus,
				UserFollowers = UserFollowers,
				IsUserFollowing = IsUserFollowing,
				Games = { byGameId = ByGameId }
			}, p3 or {})
		}
	end, {}, { RoduxModule.thunkMiddleware })
end