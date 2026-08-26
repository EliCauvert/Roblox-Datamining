local momentsTypesModule = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local decodeEmojiSetsModule = require(script.Parent.decodeEmojiSets)
local resolveEmoteIdModule = require(script.Parent.resolveEmoteId)
local reactionType = momentsTypesModule.Enums.ReactionType
local list = {
	reactionType.ThumbsUp, reactionType.Heart, reactionType.LaughJoy,
	reactionType.Wow, reactionType.Cry, reactionType.Fire, reactionType.Skull
}

local function isValidMomentsEmojiCatalog(p1)
	-- upvalues: list (ref), resolveEmoteIdModule (ref)
	if #p1 == 0 then
		return false
	end
	for i = 1, #list do
		local var1 = list[i]
		local var2 = resolveEmoteIdModule.resolveEmoteIdForReaction(p1, var1)
		
		if var2 ~= var1 and string.find(var2, "-", 1, true) ~= nil then
			continue
		end
		return false
	end
	return true
end

return {
	isValidMomentsEmojiCatalog = isValidMomentsEmojiCatalog,
	isValidGetEmojiSetsResponseShape = function(value)
		-- upvalues: decodeEmojiSetsModule (ref), isValidMomentsEmojiCatalog (ref)
		return type(value) == "table" and type(value.emoji_sets) == "table" and #value.emoji_sets ~= 0 and isValidMomentsEmojiCatalog(decodeEmojiSetsModule.flattenEmojis(decodeEmojiSetsModule.decodeGetEmojiSetsResponse(value)))
	end,
	isValidCachedGetEmojiSetsResponse = function(value)
		-- upvalues: isValidMomentsEmojiCatalog (ref), decodeEmojiSetsModule (ref)
		return if value == nil then false else isValidMomentsEmojiCatalog(decodeEmojiSetsModule.flattenEmojis(value))
	end,
	isUuidLikeEmoteId = function(p2)
		return string.find(p2, "-", 1, true) ~= nil
	end
}