local legacyFriendsRodux = script:FindFirstAncestor("LegacyFriendsRodux")
local parent = legacyFriendsRodux.Parent
local immutable = require(parent.AppCommonLib).Immutable
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local fetchUserFriendsStarted = require(legacyFriendsRodux.Actions).FetchUserFriendsStarted
local fetchUserFriendsFailed = require(legacyFriendsRodux.Actions).FetchUserFriendsFailed
local fetchUserFriendsCompleted = require(legacyFriendsRodux.Actions).FetchUserFriendsCompleted

local function setFieldPerUser(value, p0, p1, p2) --[[ line: 11 ]]
	-- upvalues: immutable (ref)
	return immutable.JoinDictionaries(value, {
		[p0] = immutable.JoinDictionaries(value[p0] or {}, { [p1] = p2 })
	})
end

local function _(value, p3, p4) --[[ line: 20 | named "setRetrievalStatus" ]]
	-- upvalues: setFieldPerUser (ref)
	return setFieldPerUser(value, "retrievalStatus", p3, p4)
end

local _ = function(value, p5, p6) --[[ line: 24 | named "setRetrievalFailureResponse" ]]
	-- upvalues: setFieldPerUser (ref)
	return setFieldPerUser(value, "retrievalFailureResponse", p5, p6)
end

return function(p7, p8) --[[ line: 28 ]]
	-- upvalues: fetchUserFriendsStarted (ref), retrievalStatus (ref), setFieldPerUser (ref), fetchUserFriendsFailed (ref), fetchUserFriendsCompleted (ref)
	p7 = p7 or { retrievalStatus = {}, retrievalFailureResponse = {} }
	
	if p8.type == fetchUserFriendsStarted.name then
		p7 = setFieldPerUser(p7, "retrievalStatus", p8.userId, retrievalStatus.Fetching)
		
		return p7
	elseif p8.type == fetchUserFriendsFailed.name then
		p7 = setFieldPerUser(setFieldPerUser(p7, "retrievalStatus", p8.userId, retrievalStatus.Failed), "retrievalFailureResponse", p8.userId, p8.response)
		
		return p7
	elseif p8.type == fetchUserFriendsCompleted.name then
		p7 = setFieldPerUser(p7, "retrievalStatus", p8.userId, retrievalStatus.Done)
	end
	return p7
end