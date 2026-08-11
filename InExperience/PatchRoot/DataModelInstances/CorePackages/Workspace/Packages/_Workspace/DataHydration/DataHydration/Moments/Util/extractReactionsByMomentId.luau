local dataHydration = script:FindFirstAncestor("DataHydration")
local momentsTypesModule = require(dataHydration.Parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local hardcodedMomentsEmojisModule = require(dataHydration.Moments.Util.hardcodedMomentsEmojis)
local resolveEmoteIdModule = require(dataHydration.Moments.Util.resolveEmoteId)
local fFlagMomentsEmojiSetsApiModule = require(dataHydration.Moments.FFlagMomentsEmojiSetsApi)
local t = {}

for i, v in momentsTypesModule.Enums.ReactionType do
	t[v] = true
end
local function _(p0) --[[ line: 32 | named "isValidReactionType" ]]
	-- upvalues: t (ref), resolveEmoteIdModule (ref)
	return if t[p0] ~= true then t[resolveEmoteIdModule.normalizeName(p0)] == true else true
end

local _ = function(p1) --[[ line: 36 | named "asReactionType" ]]
	-- upvalues: resolveEmoteIdModule (ref), t (ref)
	local var8 = resolveEmoteIdModule.normalizeName(p1)
	
	return if t[var8] then var8 else nil
end

local function convertReactionCountsArray(p2, p3) --[[ line: 44 ]]
	-- upvalues: resolveEmoteIdModule (ref), t (ref)
	local t_1 = {}
	local var10 = false
	local var11 = nil
	
	for i, v in p2 do
		if type(v) == "table" then
			local count = v.count
			
			if type(count) == "number" and count > 0 then
				local var12 = nil
				
				if type(v.name) == "string" then
					local var13 = resolveEmoteIdModule.normalizeName(v.name)
					var12 = if t[var13] then var13 else nil
				end
				if var12 == nil then
					local emoteId = v.emote_id or v.emoteId
					
					if type(emoteId) == "string" then
						local var15 = resolveEmoteIdModule.reactionTypeForEmoteId(p3, emoteId)
						
						if var15 ~= nil then
							local var16 = resolveEmoteIdModule.normalizeName(var15)
							var12 = if t[var16] then var16 else nil
						end
					end
				end
				if var12 ~= nil then
					t_1[var12] = count
					var10 = true
					local hasUserReacted = v.has_user_reacted
					
					if hasUserReacted == nil then
						hasUserReacted = v.hasUserReacted
					end
					if hasUserReacted == true then
						var11 = var12
					end
				end
			end
		end
	end
	if var11 ~= nil then
		t_1.userReaction = var11
		var10 = true
	end
	return if var10 then t_1 else nil
end

local function convertLegacyApiReactions(p4) --[[ line: 105 ]]
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), t (ref), resolveEmoteIdModule (ref)
	local t_1 = {}
	local var18 = false
	local counts = p4.counts
	
	if type(counts) == "table" then
		for i, v in counts do
			if type(i) == "string" and type(v) == "number" and v > 0 then
				if fFlagMomentsEmojiSetsApiModule then
					local var19 = if t[i] ~= true then t[resolveEmoteIdModule.normalizeName(i)] == true else true
					
					if var19 then
						local var20 = resolveEmoteIdModule.normalizeName(i)
						var19 = if t[var20] then var20 else nil
						
						if var19 ~= nil then
							t_1[var19] = v
							var18 = true
						end
					end
				elseif t[i] then
					t_1[i] = v
					var18 = true
				end
			end
		end
	end
	local userReaction = p4.userReaction or p4.viewerReaction
	
	if type(userReaction) == "string" then
		if fFlagMomentsEmojiSetsApiModule then
			local var22 = resolveEmoteIdModule.normalizeName(userReaction)
			local var23 = if t[var22] then var22 else nil
			
			if var23 ~= nil then
				t_1.userReaction = var23
				var18 = true
			end
		elseif t[userReaction] then
			t_1.userReaction = userReaction
			var18 = true
		end
	end
	return if var18 then t_1 else nil
end

local _ = function(p5, p6) --[[ line: 150 | named "convertApiReactions" ]]
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), convertReactionCountsArray (ref), convertLegacyApiReactions (ref)
	if type(p5) ~= "table" then
		return nil
	elseif fFlagMomentsEmojiSetsApiModule then
		local reactionCounts = p5.reaction_counts or p5.reactionCounts
		
		if type(reactionCounts) == "table" then
			local var25 = convertReactionCountsArray(reactionCounts, p6)
			
			return if var25 == nil then convertLegacyApiReactions(p5) else var25
		end
	end
end

return function(p7) --[[ line: 168 | named "extractReactionsByMomentId" ]]
	-- upvalues: hardcodedMomentsEmojisModule (ref), fFlagMomentsEmojiSetsApiModule (ref), convertReactionCountsArray (ref), convertLegacyApiReactions (ref)
	local t = {}
	
	if p7 == nil then
		return t
	end
	for i, v in p7 do
		local entityId = v.entityId or v.id
		
		if entityId ~= nil then
			local var28
			local reactions = v.reactions
			
			if type(reactions) == "table" then
				if fFlagMomentsEmojiSetsApiModule then
					local reactionCounts = reactions.reaction_counts or reactions.reactionCounts
					
					if type(reactionCounts) == "table" then
						local var30 = convertReactionCountsArray(reactionCounts, hardcodedMomentsEmojisModule)
						var28 = if var30 == nil then convertLegacyApiReactions(reactions) else var30
					end
				end
			else
				var28 = nil
			end
			if var28 ~= nil then
				t[entityId] = var28
			end
		end
	end
	return t
end