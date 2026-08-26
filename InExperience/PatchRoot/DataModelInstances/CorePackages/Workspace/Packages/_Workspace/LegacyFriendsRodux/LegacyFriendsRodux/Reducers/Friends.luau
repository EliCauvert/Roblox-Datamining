local legacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local parent = legacyFriendsRodux.Parent
local immutable = require(parent.AppCommonLib).Immutable
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local fetchUserFriendsStarted = require(legacyFriendsRodux.Actions).FetchUserFriendsStarted
local fetchUserFriendsFailed = require(legacyFriendsRodux.Actions).FetchUserFriendsFailed
local fetchUserFriendsCompleted = require(legacyFriendsRodux.Actions).FetchUserFriendsCompleted

local function setFieldPerUser(value, p1, p2, p3)
	-- upvalues: immutable (ref)
	return immutable.JoinDictionaries(value, {
		[p1] = immutable.JoinDictionaries(value[p1] or {}, { [p2] = p3 })
	})
end

local function _(value, p1, p2)
	-- upvalues: setFieldPerUser (ref)
	return setFieldPerUser(value, "retrievalStatus", p1, p2)
end

local _ = function(value, p1, p2)
	-- upvalues: setFieldPerUser (ref)
	return setFieldPerUser(value, "retrievalFailureResponse", p1, p2)
end

return function(p1, p2)
	-- upvalues: fetchUserFriendsStarted (ref), retrievalStatus (ref), setFieldPerUser (ref), fetchUserFriendsFailed (ref), fetchUserFriendsCompleted (ref)
	p1 = p1 or { retrievalStatus = {}, retrievalFailureResponse = {} }
	
	if p2.type == fetchUserFriendsStarted.name then
		p1 = setFieldPerUser(p1, "retrievalStatus", p2.userId, retrievalStatus.Fetching)
		
		return p1
	elseif p2.type == fetchUserFriendsFailed.name then
		p1 = setFieldPerUser(setFieldPerUser(p1, "retrievalStatus", p2.userId, retrievalStatus.Failed), "retrievalFailureResponse", p2.userId, p2.response)
		
		return p1
	elseif p2.type == fetchUserFriendsCompleted.name then
		p1 = setFieldPerUser(p1, "retrievalStatus", p2.userId, retrievalStatus.Done)
	end
	return p1
end