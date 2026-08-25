local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local mockIdModule = require(script.Parent.mockId)
local _ = require(script.Parent.Parent.roduxFriendsTypes)
local llamaModule = require(parent.llama)
local recommendationContextTypeModule = require(friendsRodux.Enums.RecommendationContextType)
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	local t_1 = {
		id = p0.id,
		entityId = p0.entityId,
		rank = p0.rank,
		contextType = p0.contextType,
		mutualFriendsList = p0.mutualFriendsList,
		mutualFriendsCount = p0.mutualFriendsCount,
		thumbnailEntities = p0.thumbnailEntities,
		entityDisplayName = p0.entityDisplayName
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock(p1)
	-- upvalues: mockIdModule (ref), recommendationContextTypeModule (ref), llamaModule (ref), t (ref)
	local var6 = llamaModule.Dictionary.join({
		id = mockIdModule(),
		contextType = recommendationContextTypeModule.MutualFriends
	}, p1)
	
	return t.new({
		id = var6.id,
		mutualFriendsList = var6.mutualFriendsList,
		rank = var6.rank or tonumber(var6.id),
		contextType = var6.contextType,
		mutualFriendsCount = if var6.mutualFriendsCount then var6.mutualFriendsCount elseif var6.mutualFriendsList then #var6.mutualFriendsList else 0
	})
end

function t.isValid(p2)
	-- upvalues: recommendationContextTypeModule (ref)
	if not p2 then
		return false, "Expected recommendation information to be given"
	elseif not p2.id then
		return false, "Expected user's id to be given"
	elseif not p2.rank then
		return false, "Expected user's rank to be given"
	elseif not p2.contextType or not recommendationContextTypeModule.isEnumValue(p2.contextType) then
		return false, "Expected contextType to be given"
	elseif p2.mutualFriendsList and type(p2.mutualFriendsList) ~= "table" then
		return false, "mutualFriendList must be a table of strings"
	elseif p2.mutualFriendsCount and type(p2.mutualFriendsCount) ~= "number" then
		return false, "mutualFriendsCount must be a number"
	elseif p2.contextType == recommendationContextTypeModule.Contacts and not p2.entityId then
		return false, "entity Id must be given for Contacts recommendation type"
	end
	return true, "Valid Recommendation"
end

function t.isEqual(p3, p4)
	-- upvalues: llamaModule (ref)
	return p3.id == p4.id and (llamaModule.List.equals(p3.mutualFriendsList, p4.mutualFriendsList) and (p3.rank == p4.rank and (p3.contextType == p4.contextType and p3.mutualFriendsCount == p4.mutualFriendsCount)))
end

function t.format(p5)
	-- upvalues: recommendationContextTypeModule (ref), t (ref), llamaModule (ref)
	local var7 = if p5.contextType then recommendationContextTypeModule.fromRawValue(p5.contextType) or recommendationContextTypeModule.None else recommendationContextTypeModule.None
	
	return t.new(llamaModule.Dictionary.join(p5, {
		id = p5.id,
		entityId = if p5.contactId ~= "" then nil else p5.contactId,
		contextType = var7,
		mutualFriendsCount = if p5.mutualFriendsCount then p5.mutualFriendsCount elseif p5.mutualFriendsList then #p5.mutualFriendsList else 0,
		thumbnailEntities = p5.thumbnailEntities,
		entityDisplayName = if var7 == recommendationContextTypeModule.Contacts then p5.displayName else nil
	}))
end

return t