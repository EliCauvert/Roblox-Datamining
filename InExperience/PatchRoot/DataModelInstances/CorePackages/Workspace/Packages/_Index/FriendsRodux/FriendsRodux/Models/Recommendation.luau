local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local MockIdModule = require(script.Parent.mockId)
local _ = require(script.Parent.Parent.roduxFriendsTypes)
local LlamaModule = require(FriendsRodux.Parent.llama)
local RecommendationContextTypeModule = require(FriendsRodux.Enums.RecommendationContextType)
local RecommendationModule = {}

function RecommendationModule.new(JoinResult)
	-- upvalues: RecommendationModule (copy)
	assert(RecommendationModule.isValid(JoinResult))
	RecommendationModule.__index = RecommendationModule
	local config = {
		id = JoinResult.id,
		entityId = JoinResult.entityId,
		rank = JoinResult.rank,
		contextType = JoinResult.contextType,
		mutualFriendsList = JoinResult.mutualFriendsList,
		mutualFriendsCount = JoinResult.mutualFriendsCount,
		thumbnailEntities = JoinResult.thumbnailEntities,
		entityDisplayName = JoinResult.entityDisplayName
	}
	setmetatable(config, RecommendationModule)
	
	return config
end

function RecommendationModule.mock(p1)
	-- upvalues: MockIdModule (copy), RecommendationContextTypeModule (copy), LlamaModule (copy), RecommendationModule (copy)
	local JoinResult = LlamaModule.Dictionary.join({
		id = MockIdModule(),
		contextType = RecommendationContextTypeModule.MutualFriends
	}, p1)
	
	return (RecommendationModule.new({
		id = JoinResult.id,
		mutualFriendsList = JoinResult.mutualFriendsList,
		rank = JoinResult.rank or tonumber(JoinResult.id),
		contextType = JoinResult.contextType,
		mutualFriendsCount = if JoinResult.mutualFriendsCount then JoinResult.mutualFriendsCount else JoinResult.mutualFriendsList and #JoinResult.mutualFriendsList or 0
	}))
end

function RecommendationModule.isValid(p1)
	-- upvalues: RecommendationContextTypeModule (copy)
	if not p1 then
		return false, "Expected recommendation information to be given"
	elseif not p1.id then
		return false, "Expected user's id to be given"
	elseif not p1.rank then
		return false, "Expected user's rank to be given"
	elseif not p1.contextType or not RecommendationContextTypeModule.isEnumValue(p1.contextType) then
		return false, "Expected contextType to be given"
	elseif p1.mutualFriendsList and type(p1.mutualFriendsList) ~= "table" then
		return false, "mutualFriendList must be a table of strings"
	elseif p1.mutualFriendsCount and type(p1.mutualFriendsCount) ~= "number" then
		return false, "mutualFriendsCount must be a number"
	elseif p1.contextType == RecommendationContextTypeModule.Contacts and not p1.entityId then
		return false, "entity Id must be given for Contacts recommendation type"
	else
		return true, "Valid Recommendation"
	end
end

function RecommendationModule.isEqual(p1, p2): boolean
	-- upvalues: LlamaModule (copy)
	return p1.id == p2.id and (LlamaModule.List.equals(p1.mutualFriendsList, p2.mutualFriendsList) and (p1.rank == p2.rank and p1.contextType == p2.contextType and p1.mutualFriendsCount == p2.mutualFriendsCount))
end

function RecommendationModule.format(p1)
	-- upvalues: RecommendationContextTypeModule (copy), RecommendationModule (copy), LlamaModule (copy)
	local FromRawValueResult = p1.contextType and RecommendationContextTypeModule.fromRawValue(p1.contextType) or RecommendationContextTypeModule.None
	
	return RecommendationModule.new(LlamaModule.Dictionary.join(p1, {
		id = p1.id,
		entityId = if p1.contactId == "" then nil else p1.contactId,
		contextType = FromRawValueResult,
		mutualFriendsCount = if p1.mutualFriendsCount then p1.mutualFriendsCount elseif p1.mutualFriendsList then #p1.mutualFriendsList else 0,
		thumbnailEntities = p1.thumbnailEntities,
		entityDisplayName = if FromRawValueResult == RecommendationContextTypeModule.Contacts then p1.displayName else nil
	}))
end

return RecommendationModule