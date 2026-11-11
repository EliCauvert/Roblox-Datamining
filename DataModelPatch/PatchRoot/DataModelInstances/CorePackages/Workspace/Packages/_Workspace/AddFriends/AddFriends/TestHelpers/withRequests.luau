local Parent = script:FindFirstAncestor("AddFriends").Parent
local RoduxModule = require(Parent.Rodux)
local LlamaModule = require(Parent.llama)
local AddFriendsStateModule = require(Parent.AddFriendsState)
local PresenceType = AddFriendsStateModule.RoduxPresence.Enums.PresenceType
local GetBaseTestStatesFunction = require(Parent.Dev.SocialTestHelpers).TestHelpers.getBaseTestStates
local RODUXKEY = AddFriendsStateModule.RODUX_KEY
local SmallNumbersOfFriends = GetBaseTestStatesFunction({ roduxKey = RODUXKEY }).smallNumbersOfFriends
local config = {
	[Enum.FriendStatus.Friend] = "Friend",
	[Enum.FriendStatus.FriendRequestReceived] = "RequestReceived"
}
local KeysResult = LlamaModule.Dictionary.keys(config)

local function _(p1: number)
	-- upvalues: KeysResult (copy)
	return KeysResult[1 + p1 % #KeysResult]
end

local function CreateStore(p1)
	-- upvalues: RoduxModule (copy), LlamaModule (copy), KeysResult (copy), RODUXKEY (copy)
	return RoduxModule.Store.new(function()
		-- upvalues: LlamaModule (upval), p1 (copy), KeysResult (upval), RODUXKEY (upval)
		return {
			LocalUserId = "0",
			FriendStatuses = LlamaModule.Dictionary.map(p1, function(p2, p3: number)
				-- upvalues: KeysResult (upval)
				return KeysResult[1 + p3 % #KeysResult], p2.id
			end),
			ScreenSize = Vector2.new(360, 720),
			TopBar = { topBarHeight = 60 },
			GlobalGuiInset = { top = 20, bottom = 20, left = 20, right = 20 },
			[RODUXKEY] = { Friends = { requests = { receivedCount = #p1 } } }
		}
	end, { RoduxModule.thunkMiddleware })
end

local function v11(ManyFriends)
	-- upvalues: RODUXKEY (copy), LlamaModule (copy), KeysResult (copy), config (copy), PresenceType (copy)
	local t = {}
	LlamaModule.List.every(ManyFriends[RODUXKEY].Friends.byUserId.test, function(Id, Key: number): boolean
		-- upvalues: KeysResult (upval), t (copy), config (upval), PresenceType (upval)
		t[Key] = {
			lastLocation = "Last Location",
			username = "",
			id = Id,
			displayName = config[KeysResult[1 + Key % #KeysResult]],
			userPresenceType = PresenceType.InGame
		}
		
		return true
	end)
	
	return t
end

local FriendRequests = v11(GetBaseTestStatesFunction({ roduxKey = RODUXKEY }).manyFriends)

return {
	friendRequests = FriendRequests,
	manyFriendRequests = FriendRequests,
	smallNumbersOfFriendRequests = v11(SmallNumbersOfFriends),
	createStore = CreateStore
}