local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local roduxFriends = dependenciesModule.RoduxFriends
local players = dependenciesModule.Players
local llama = dependenciesModule.llama
local transformOmniRecommendationsToActionsModule = require(script.Parent.transformOmniRecommendationsToActions)
local _ = require(PYMKCarousel.Common.OmniTypes)
local constantsModule = require(PYMKCarousel.Common.Constants)
local recommendationContextType = roduxFriends.Enums.RecommendationContextType
local socialCommon = dependenciesModule.SocialCommon
local recommendationSourceEnum = socialCommon.Enums.RecommendationSourceEnum
local contextualInfoTypes = socialCommon.Enums.ContextualInfoTypes

local _ = function(p1)
	-- upvalues: recommendationContextType (ref)
	local var1 = recommendationContextType.fromRawValue(p1)
	
	return var1 and var1 ~= recommendationContextType.None
end

local var1 = function(p1, p2, p3)
	-- upvalues: recommendationContextType (ref), contextualInfoTypes (ref), constantsModule (ref)
	local var2 = recommendationContextType.fromRawValue(p1.contextType)
	local var3 = if var2 and var2 ~= recommendationContextType.None then p1.contextType else p3.contextType
	local mutualFriendsCount = p3.mutualFriendsCount and tonumber(p3.mutualFriendsCount) or 0
	
	if var3 == recommendationContextType.MutualFriends.rawValue() and mutualFriendsCount == 0 then
		var3 = recommendationContextType.None.rawValue()
	end
	return {
		id = if var3 == contextualInfoTypes.Contacts then p1.ContactId else tostring(p1.userId),
		contextType = var3,
		mutualFriendsList = p1.mutualFriendDisplayName,
		rank = if p3.rank then tonumber(p3.rank) else p2,
		mutualFriendsCount = mutualFriendsCount,
		hasIncomingFriendRequest = p3.hasPendingFriendRequest == constantsModule.BE_TRUE_VALUE,
		thumbnailEntities = if var3 == contextualInfoTypes.Contacts then {
			avatarImageUrl = p1.AvatarThumbnailUrl,
			headshotImageUrl = p1.HeadshotThumbnailUrl
		} else nil,
		contactId = p1.ContactId,
		displayName = p1.ContactName
	}
end

local var2 = function(p1, p2, p3)
	-- upvalues: players (ref), roduxFriends (ref), var1 (ref)
	local localPlayer = players.LocalPlayer
	assert(localPlayer, "LocalPlayer must be non-nil")
	
	return roduxFriends.Actions.RecommendationCreated({
		baseUserId = tostring(localPlayer.UserId),
		recommendedUser = var1(p1, p2, p3)
	})
end

local var3 = function(_, p1)
	-- upvalues: llama (ref), roduxFriends (ref), recommendationSourceEnum (ref)
	return roduxFriends.Actions.RecommendationSourceCreated({
		source = recommendationSourceEnum.HomepagePYMKCarousel,
		recommendationIds = llama.Dictionary.keys(p1 or {})
	})
end

return function(p1)
	-- upvalues: transformOmniRecommendationsToActionsModule (ref), var2 (ref), var3 (ref)
	return {
		AddContentMetadata = function(p2)
			return { p2 }
		end,
		AddOmniRecommendations = function(p2)
			-- upvalues: transformOmniRecommendationsToActionsModule (copy), p1 (ref), var2 (copy), var3 (copy)
			return transformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, var2, var3)
		end
	}
end