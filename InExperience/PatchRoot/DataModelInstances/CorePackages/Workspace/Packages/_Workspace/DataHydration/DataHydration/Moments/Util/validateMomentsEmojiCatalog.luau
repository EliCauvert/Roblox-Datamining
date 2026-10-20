local DecodeEmojiSetsModule = require(script.Parent.decodeEmojiSets)
local ResolveEmoteIdModule = require(script.Parent.resolveEmoteId)
local ReactionType = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes).Enums.ReactionType
local list = {
	ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
	ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
}

local function isValidMomentsEmojiCatalog(FlattenEmojisResult): boolean
	-- upvalues: list (copy), ResolveEmoteIdModule (copy)
	if #FlattenEmojisResult == 0 then
		return false
	end
	for i = 1, #list do
		local Entry = list[i]
		local ResolveEmoteIdForReactionResult: string = ResolveEmoteIdModule.resolveEmoteIdForReaction(FlattenEmojisResult, Entry)
		
		if ResolveEmoteIdForReactionResult == Entry or string.find(ResolveEmoteIdForReactionResult, "-", 1, true) == nil then
			return false
		end
	end
	return true
end

return {
	isValidMomentsEmojiCatalog = isValidMomentsEmojiCatalog,
	isValidGetEmojiSetsResponseShape = function(p1)
		-- upvalues: DecodeEmojiSetsModule (copy), isValidMomentsEmojiCatalog (copy)
		return type(p1) == "table" and type(p1.emoji_sets) == "table" and #p1.emoji_sets ~= 0 and isValidMomentsEmojiCatalog(DecodeEmojiSetsModule.flattenEmojis((DecodeEmojiSetsModule.decodeGetEmojiSetsResponse(p1))))
	end,
	isValidCachedGetEmojiSetsResponse = function(p1)
		-- upvalues: isValidMomentsEmojiCatalog (copy), DecodeEmojiSetsModule (copy)
		return p1 ~= nil and isValidMomentsEmojiCatalog(DecodeEmojiSetsModule.flattenEmojis(p1))
	end,
	isUuidLikeEmoteId = function(Text: string): boolean
		return string.find(Text, "-", 1, true) ~= nil
	end
}