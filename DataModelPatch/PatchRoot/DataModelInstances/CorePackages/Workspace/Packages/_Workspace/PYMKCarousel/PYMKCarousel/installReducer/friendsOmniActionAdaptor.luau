local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local RoduxFriends = DependenciesModule.RoduxFriends
local Players = DependenciesModule.Players
local Llama = DependenciesModule.llama
local TransformOmniRecommendationsToActionsModule = require(script.Parent.transformOmniRecommendationsToActions)
local _ = require(PYMKCarousel.Common.OmniTypes)
local ConstantsModule = require(PYMKCarousel.Common.Constants)
local RecommendationContextType = RoduxFriends.Enums.RecommendationContextType
local SocialCommon = DependenciesModule.SocialCommon
local RecommendationSourceEnum = SocialCommon.Enums.RecommendationSourceEnum
local ContextualInfoTypes = SocialCommon.Enums.ContextualInfoTypes

local function _(p1): boolean
	-- upvalues: RecommendationContextType (copy)
	local FromRawValueResult = RecommendationContextType.fromRawValue(p1)
	
	return FromRawValueResult and FromRawValueResult ~= RecommendationContextType.None
end

local function v13(p1, p2, p3)
	-- upvalues: RecommendationContextType (copy), ContextualInfoTypes (copy), ConstantsModule (copy)
	local FromRawValueResult = RecommendationContextType.fromRawValue(p1.contextType)
	local IsNotFromRawValueResultMatch: boolean = FromRawValueResult and FromRawValueResult ~= RecommendationContextType.None
	local ContextType = if IsNotFromRawValueResultMatch then p1.contextType else p3.contextType
	local Number: number = p3.mutualFriendsCount and tonumber(p3.mutualFriendsCount) or 0
	
	if ContextType == RecommendationContextType.MutualFriends.rawValue() and Number == 0 then
		ContextType = RecommendationContextType.None.rawValue()
	end
	return {
		id = if ContextType == ContextualInfoTypes.Contacts then p1.ContactId else tostring(p1.userId),
		contextType = ContextType,
		mutualFriendsList = p1.mutualFriendDisplayName,
		rank = if p3.rank then tonumber(p3.rank) else p2,
		mutualFriendsCount = Number,
		hasIncomingFriendRequest = p3.hasPendingFriendRequest == ConstantsModule.BE_TRUE_VALUE,
		thumbnailEntities = if ContextType == ContextualInfoTypes.Contacts then {
			avatarImageUrl = p1.AvatarThumbnailUrl,
			headshotImageUrl = p1.HeadshotThumbnailUrl
		} else nil,
		contactId = p1.ContactId,
		displayName = p1.ContactName
	}
end

local function v14(p1, p2, p3)
	-- upvalues: Players (copy), RoduxFriends (copy), v13 (copy)
	local LocalPlayer = Players.LocalPlayer
	assert(LocalPlayer, "LocalPlayer must be non-nil")
	
	return RoduxFriends.Actions.RecommendationCreated({
		baseUserId = tostring(LocalPlayer.UserId),
		recommendedUser = v13(p1, p2, p3)
	})
end

local function v15(_, p1)
	-- upvalues: Llama (copy), RoduxFriends (copy), RecommendationSourceEnum (copy)
	return RoduxFriends.Actions.RecommendationSourceCreated({
		source = RecommendationSourceEnum.HomepagePYMKCarousel,
		recommendationIds = Llama.Dictionary.keys(p1 or {})
	})
end

return function(p1)
	-- upvalues: TransformOmniRecommendationsToActionsModule (copy), v14 (copy), v15 (copy)
	return {
		AddContentMetadata = function(p2)
			return { p2 }
		end,
		AddOmniRecommendations = function(p2)
			-- upvalues: TransformOmniRecommendationsToActionsModule (upval), p1 (copy), v14 (upval), v15 (upval)
			return TransformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, v14, v15)
		end
	}
end