local LegacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local Parent = LegacyFriendsRodux.Parent
local Immutable = require(Parent.AppCommonLib).Immutable
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local FetchUserFriendsStarted = require(LegacyFriendsRodux.Actions).FetchUserFriendsStarted
local FetchUserFriendsFailed = require(LegacyFriendsRodux.Actions).FetchUserFriendsFailed
local FetchUserFriendsCompleted = require(LegacyFriendsRodux.Actions).FetchUserFriendsCompleted

local function setFieldPerUser(RetrievalStatus, p1, UserId, Done) --[[ Line: 11 ]]
	-- upvalues: Immutable (copy)
	return Immutable.JoinDictionaries(RetrievalStatus, {
		[p1] = Immutable.JoinDictionaries(RetrievalStatus[p1] or {}, { [UserId] = Done })
	})
end

local function _(p1, p2, p3) --[[ Line: 20 | Named "setRetrievalStatus" ]]
	-- upvalues: setFieldPerUser (copy)
	return setFieldPerUser(p1, "retrievalStatus", p2, p3)
end

local _ = function(p1, p2, p3) --[[ Line: 24 | Named "setRetrievalFailureResponse" ]]
	-- upvalues: setFieldPerUser (copy)
	return setFieldPerUser(p1, "retrievalFailureResponse", p2, p3)
end

return function(p1, p2) --[[ Line: 28 ]]
	-- upvalues: FetchUserFriendsStarted (copy), RetrievalStatus (copy), setFieldPerUser (copy), FetchUserFriendsFailed (copy), FetchUserFriendsCompleted (copy)
	local P10 = p1 or { retrievalStatus = {}, retrievalFailureResponse = {} }
	
	if p2.type == FetchUserFriendsStarted.name then
		P10 = setFieldPerUser(P10, "retrievalStatus", p2.userId, RetrievalStatus.Fetching)
		
		return P10
	end
	if p2.type == FetchUserFriendsFailed.name then
		P10 = setFieldPerUser(setFieldPerUser(P10, "retrievalStatus", p2.userId, RetrievalStatus.Failed), "retrievalFailureResponse", p2.userId, p2.response)
		
		return P10
	end
	if p2.type == FetchUserFriendsCompleted.name then
		P10 = setFieldPerUser(P10, "retrievalStatus", p2.userId, RetrievalStatus.Done)
	end
	return P10
end