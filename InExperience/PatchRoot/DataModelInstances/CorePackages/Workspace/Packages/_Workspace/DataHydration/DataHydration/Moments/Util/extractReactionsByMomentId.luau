local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local HardcodedMomentsEmojisModule = require(DataHydration.Moments.Util.hardcodedMomentsEmojis)
local ResolveEmoteIdModule = require(DataHydration.Moments.Util.resolveEmoteId)
local ResolveMomentsEmojiCatalogModule = require(DataHydration.Moments.Util.resolveMomentsEmojiCatalog)
local FFlagMomentsEmojiSetsApiModule = require(DataHydration.Moments.FFlagMomentsEmojiSetsApi)
local t = {}

for _, value in require(DataHydration.Parent.MomentsTypes).Enums.ReactionType do
	t[value] = true
end
local function _(p1): boolean --[[ Line: 33 | Named "isValidReactionType" ]]
	-- upvalues: t (copy), ResolveEmoteIdModule (copy)
	return t[p1] == true or t[ResolveEmoteIdModule.normalizeName(p1)] == true
end

local _ = function(p1) --[[ Line: 37 | Named "asReactionType" ]]
	-- upvalues: ResolveEmoteIdModule (copy), t (copy)
	local NormalizeNameResult = ResolveEmoteIdModule.normalizeName(p1)
	
	return if t[NormalizeNameResult] then NormalizeNameResult else nil
end

local function convertReactionCountsArray(ReactionCounts, Emojis) --[[ Line: 45 ]]
	-- upvalues: ResolveEmoteIdModule (copy), t (copy)
	local t1 = {}
	local Flag = false
	local UserReaction = nil
	
	for _, reactionCount in ReactionCounts do
		if type(reactionCount) == "table" then
			local Count: number = reactionCount.count
			
			if type(Count) == "number" and Count > 0 then
				local v1 = nil
				
				if type(reactionCount.name) == "string" then
					local NormalizeNameResult = ResolveEmoteIdModule.normalizeName(reactionCount.name)
					v1 = if t[NormalizeNameResult] then NormalizeNameResult else nil
				end
				if v1 == nil then
					local EmoteId = reactionCount.emote_id or reactionCount.emoteId
					
					if type(EmoteId) == "string" then
						local ReactionTypeForEmoteIdResult = ResolveEmoteIdModule.reactionTypeForEmoteId(Emojis, EmoteId)
						
						if ReactionTypeForEmoteIdResult ~= nil then
							local NormalizeNameResult = ResolveEmoteIdModule.normalizeName(ReactionTypeForEmoteIdResult)
							v1 = if t[NormalizeNameResult] then NormalizeNameResult else nil
						end
					end
				end
				if v1 ~= nil then
					t1[v1] = Count
					Flag = true
					local HasUserReacted = reactionCount.has_user_reacted
					
					if HasUserReacted == nil then
						HasUserReacted = reactionCount.hasUserReacted
					end
					if HasUserReacted == true then
						UserReaction = v1
					end
				end
			end
		end
	end
	if UserReaction ~= nil then
		t1.userReaction = UserReaction
		Flag = true
	end
	return if Flag then t1 else nil
end

local function convertLegacyApiReactions(Reactions) --[[ Line: 106 ]]
	-- upvalues: FFlagMomentsEmojiSetsApiModule (copy), t (copy), ResolveEmoteIdModule (copy)
	local t2 = {}
	local Flag = false
	local Counts = Reactions.counts
	
	if type(Counts) == "table" then
		for i, count in Counts do
			if type(i) == "string" and type(count) == "number" and count > 0 then
				if FFlagMomentsEmojiSetsApiModule then
					if t[i] == true or t[ResolveEmoteIdModule.normalizeName(i)] == true then
						local NormalizeNameResult = ResolveEmoteIdModule.normalizeName(i)
						local NormalizeNameResult1 = if t[NormalizeNameResult] then NormalizeNameResult else nil
						
						if NormalizeNameResult1 ~= nil then
							t2[NormalizeNameResult1] = count
							Flag = true
						end
					end
				elseif t[i] then
					t2[i] = count
					Flag = true
				end
			end
		end
	end
	local UserReaction = Reactions.userReaction or Reactions.viewerReaction
	
	if type(UserReaction) == "string" then
		if FFlagMomentsEmojiSetsApiModule then
			local NormalizeNameResult = ResolveEmoteIdModule.normalizeName(UserReaction)
			local NormalizeNameResult2 = if t[NormalizeNameResult] then NormalizeNameResult else nil
			
			if NormalizeNameResult2 ~= nil then
				t2.userReaction = NormalizeNameResult2
				Flag = true
			end
		elseif t[UserReaction] then
			t2.userReaction = UserReaction
			Flag = true
		end
	end
	return if Flag then t2 else nil
end

local _ = function(p1, p2) --[[ Line: 151 | Named "convertApiReactions" ]]
	-- upvalues: FFlagMomentsEmojiSetsApiModule (copy), convertReactionCountsArray (copy), convertLegacyApiReactions (copy)
	if type(p1) ~= "table" then
		return nil
	end
	if FFlagMomentsEmojiSetsApiModule then
		local ReactionCounts = p1.reaction_counts or p1.reactionCounts
		
		if type(ReactionCounts) == "table" then
			local ConvertReactionCountsArrayResult = convertReactionCountsArray(ReactionCounts, p2)
			
			if ConvertReactionCountsArrayResult ~= nil then
				return ConvertReactionCountsArrayResult
			end
		end
	end
	return (convertLegacyApiReactions(p1))
end

return function(List) --[[ Line: 169 | Named "extractReactionsByMomentId" ]]
	-- upvalues: FFlagMomentsEmojiSetsApiModule (copy), ResolveMomentsEmojiCatalogModule (copy), HardcodedMomentsEmojisModule (copy), convertReactionCountsArray (copy), convertLegacyApiReactions (copy)
	local t = {}
	local Emojis = if FFlagMomentsEmojiSetsApiModule then ResolveMomentsEmojiCatalogModule.resolveMomentsEmojiCatalog(nil).emojis else HardcodedMomentsEmojisModule
	
	if List == nil then
		return t
	end
	for _, value in List do
		local EntityId = value.entityId or value.id
		
		if EntityId ~= nil then
			local Reactions = value.reactions
			local v2 = nil
			
			if type(Reactions) == "table" then
				if FFlagMomentsEmojiSetsApiModule then
					local ReactionCounts = Reactions.reaction_counts or Reactions.reactionCounts
					
					if type(ReactionCounts) == "table" then
						local ConvertReactionCountsArrayResult = convertReactionCountsArray(ReactionCounts, Emojis)
						
						if ConvertReactionCountsArrayResult ~= nil then
							v2 = ConvertReactionCountsArrayResult
						end
					end
				end
				v2 = convertLegacyApiReactions(Reactions)
			else
				v2 = nil
			end
			if v2 ~= nil then
				t[EntityId] = v2
			end
		end
	end
	return t
end