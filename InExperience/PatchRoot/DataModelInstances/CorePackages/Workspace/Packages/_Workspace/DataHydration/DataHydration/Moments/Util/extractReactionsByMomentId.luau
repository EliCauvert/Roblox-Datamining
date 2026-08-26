local dataHydration = script:FindFirstAncestor("DataHydration")
local momentsTypesModule = require(dataHydration.Parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local hardcodedMomentsEmojisModule = require(dataHydration.Moments.Util.hardcodedMomentsEmojis)
local resolveEmoteIdModule = require(dataHydration.Moments.Util.resolveEmoteId)
local resolveMomentsEmojiCatalogModule = require(dataHydration.Moments.Util.resolveMomentsEmojiCatalog)
local fFlagMomentsEmojiSetsApiModule = require(dataHydration.Moments.FFlagMomentsEmojiSetsApi)
local t = {}

for i, v in momentsTypesModule.Enums.ReactionType do
	t[v] = true
end
local function _(p1)
	-- upvalues: t (ref), resolveEmoteIdModule (ref)
	return if t[p1] ~= true then t[resolveEmoteIdModule.normalizeName(p1)] == true else true
end

local _ = function(p1)
	-- upvalues: resolveEmoteIdModule (ref), t (ref)
	local var1 = resolveEmoteIdModule.normalizeName(p1)
	
	return if t[var1] then var1 else nil
end

local function convertReactionCountsArray(p1, p2)
	-- upvalues: resolveEmoteIdModule (ref), t (ref)
	local t_1 = {}
	local var1 = false
	local var2 = nil
	
	for i, v in p1 do
		if type(v) == "table" then
			local count = v.count
			
			if type(count) == "number" and count > 0 then
				local var3 = nil
				
				if type(v.name) == "string" then
					local var4 = resolveEmoteIdModule.normalizeName(v.name)
					var3 = if t[var4] then var4 else nil
				end
				if var3 == nil then
					local emoteId = v.emote_id or v.emoteId
					
					if type(emoteId) == "string" then
						local var5 = resolveEmoteIdModule.reactionTypeForEmoteId(p2, emoteId)
						
						if var5 ~= nil then
							local var6 = resolveEmoteIdModule.normalizeName(var5)
							var3 = if t[var6] then var6 else nil
						end
					end
				end
				if var3 ~= nil then
					t_1[var3] = count
					var1 = true
					local hasUserReacted = v.has_user_reacted
					
					if hasUserReacted == nil then
						hasUserReacted = v.hasUserReacted
					end
					if hasUserReacted == true then
						var2 = var3
					end
				end
			end
		end
	end
	if var2 ~= nil then
		t_1.userReaction = var2
		var1 = true
	end
	return if var1 then t_1 else nil
end

local function convertLegacyApiReactions(p3)
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), t (ref), resolveEmoteIdModule (ref)
	local t_1 = {}
	local var7 = false
	local counts = p3.counts
	
	if type(counts) == "table" then
		for i, v in counts do
			if type(i) == "string" and type(v) == "number" and v > 0 then
				if fFlagMomentsEmojiSetsApiModule then
					local var8 = if t[i] ~= true then t[resolveEmoteIdModule.normalizeName(i)] == true else true
					
					if var8 then
						local var9 = resolveEmoteIdModule.normalizeName(i)
						var8 = if t[var9] then var9 else nil
						
						if var8 ~= nil then
							t_1[var8] = v
							var7 = true
						end
					end
				elseif t[i] then
					t_1[i] = v
					var7 = true
				end
			end
		end
	end
	local userReaction = p3.userReaction or p3.viewerReaction
	
	if type(userReaction) == "string" then
		if fFlagMomentsEmojiSetsApiModule then
			local var10 = resolveEmoteIdModule.normalizeName(userReaction)
			local var11 = if t[var10] then var10 else nil
			
			if var11 ~= nil then
				t_1.userReaction = var11
				var7 = true
			end
		elseif t[userReaction] then
			t_1.userReaction = userReaction
			var7 = true
		end
	end
	return if var7 then t_1 else nil
end

local _ = function(p4, p5)
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), convertReactionCountsArray (ref), convertLegacyApiReactions (ref)
	if type(p4) ~= "table" then
		return nil
	elseif fFlagMomentsEmojiSetsApiModule then
		local reactionCounts = p4.reaction_counts or p4.reactionCounts
		
		if type(reactionCounts) == "table" then
			local var12 = convertReactionCountsArray(reactionCounts, p5)
			
			return if var12 == nil then convertLegacyApiReactions(p4) else var12
		end
	end
end

return function(p4)
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), resolveMomentsEmojiCatalogModule (ref), hardcodedMomentsEmojisModule (ref), convertReactionCountsArray (ref), convertLegacyApiReactions (ref)
	local t = {}
	local var12 = if fFlagMomentsEmojiSetsApiModule then resolveMomentsEmojiCatalogModule.resolveMomentsEmojiCatalog(nil).emojis else hardcodedMomentsEmojisModule
	
	if p4 == nil then
		return t
	end
	for i, v in p4 do
		local entityId = v.entityId or v.id
		
		if entityId ~= nil then
			local var13
			local reactions = v.reactions
			
			if type(reactions) == "table" then
				if fFlagMomentsEmojiSetsApiModule then
					local reactionCounts = reactions.reaction_counts or reactions.reactionCounts
					
					if type(reactionCounts) == "table" then
						local var14 = convertReactionCountsArray(reactionCounts, var12)
						var13 = if var14 == nil then convertLegacyApiReactions(reactions) else var14
					end
				end
			else
				var13 = nil
			end
			if var13 ~= nil then
				t[entityId] = var13
			end
		end
	end
	return t
end