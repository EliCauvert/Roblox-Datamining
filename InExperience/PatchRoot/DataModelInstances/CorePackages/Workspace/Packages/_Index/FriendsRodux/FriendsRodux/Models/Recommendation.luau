local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local mockIdModule = require(script.Parent.mockId)
local _ = require(script.Parent.Parent.roduxFriendsTypes)
local llamaModule = require(parent.llama)
local recommendationContextTypeModule = require(friendsRodux.Enums.RecommendationContextType)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	local t_1 = {
		id = p1.id,
		entityId = p1.entityId,
		rank = p1.rank,
		contextType = p1.contextType,
		mutualFriendsList = p1.mutualFriendsList,
		mutualFriendsCount = p1.mutualFriendsCount,
		thumbnailEntities = p1.thumbnailEntities,
		entityDisplayName = p1.entityDisplayName
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock(p1)
	-- upvalues: mockIdModule (ref), recommendationContextTypeModule (ref), llamaModule (ref), t (ref)
	local var1 = llamaModule.Dictionary.join({
		id = mockIdModule(),
		contextType = recommendationContextTypeModule.MutualFriends
	}, p1)
	
	return t.new({
		id = var1.id,
		mutualFriendsList = var1.mutualFriendsList,
		rank = var1.rank or tonumber(var1.id),
		contextType = var1.contextType,
		mutualFriendsCount = if var1.mutualFriendsCount then var1.mutualFriendsCount elseif var1.mutualFriendsList then #var1.mutualFriendsList else 0
	})
end

function t.isValid(p1)
	-- upvalues: recommendationContextTypeModule (ref)
	if not p1 then
		return false, "Expected recommendation information to be given"
	elseif not p1.id then
		return false, "Expected user's id to be given"
	elseif not p1.rank then
		return false, "Expected user's rank to be given"
	elseif not p1.contextType or not recommendationContextTypeModule.isEnumValue(p1.contextType) then
		return false, "Expected contextType to be given"
	elseif p1.mutualFriendsList and type(p1.mutualFriendsList) ~= "table" then
		return false, "mutualFriendList must be a table of strings"
	elseif p1.mutualFriendsCount and type(p1.mutualFriendsCount) ~= "number" then
		return false, "mutualFriendsCount must be a number"
	elseif p1.contextType == recommendationContextTypeModule.Contacts and not p1.entityId then
		return false, "entity Id must be given for Contacts recommendation type"
	end
	return true, "Valid Recommendation"
end

function t.isEqual(p1, p2)
	-- upvalues: llamaModule (ref)
	return p1.id == p2.id and (llamaModule.List.equals(p1.mutualFriendsList, p2.mutualFriendsList) and (p1.rank == p2.rank and (p1.contextType == p2.contextType and p1.mutualFriendsCount == p2.mutualFriendsCount)))
end

function t.format(p1)
	-- upvalues: recommendationContextTypeModule (ref), t (ref), llamaModule (ref)
	local var1 = if p1.contextType then recommendationContextTypeModule.fromRawValue(p1.contextType) or recommendationContextTypeModule.None else recommendationContextTypeModule.None
	
	return t.new(llamaModule.Dictionary.join(p1, {
		id = p1.id,
		entityId = if p1.contactId ~= "" then nil else p1.contactId,
		contextType = var1,
		mutualFriendsCount = if p1.mutualFriendsCount then p1.mutualFriendsCount elseif p1.mutualFriendsList then #p1.mutualFriendsList else 0,
		thumbnailEntities = p1.thumbnailEntities,
		entityDisplayName = if var1 == recommendationContextTypeModule.Contacts then p1.displayName else nil
	}))
end

return t