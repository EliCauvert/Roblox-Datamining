local momentsTypesModule = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local decodeEmojiSetsModule = require(script.Parent.decodeEmojiSets)
local resolveEmoteIdModule = require(script.Parent.resolveEmoteId)
local reactionType = momentsTypesModule.Enums.ReactionType
local list = {
	reactionType.ThumbsUp, reactionType.Heart, reactionType.LaughJoy,
	reactionType.Wow, reactionType.Cry, reactionType.Fire, reactionType.Skull
}

local function isValidMomentsEmojiCatalog(p0)
	-- upvalues: list (ref), resolveEmoteIdModule (ref)
	if #p0 == 0 then
		return false
	end
	for i = 1, #list do
		local var5 = list[i]
		local var6 = resolveEmoteIdModule.resolveEmoteIdForReaction(p0, var5)
		
		if var6 ~= var5 and string.find(var6, "-", 1, true) ~= nil then
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
	isUuidLikeEmoteId = function(p1)
		return string.find(p1, "-", 1, true) ~= nil
	end
}