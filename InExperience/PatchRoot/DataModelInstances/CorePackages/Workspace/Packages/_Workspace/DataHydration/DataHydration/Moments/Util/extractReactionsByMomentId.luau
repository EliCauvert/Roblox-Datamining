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
local function _(p0)
	-- upvalues: t (ref), resolveEmoteIdModule (ref)
	return if t[p0] ~= true then t[resolveEmoteIdModule.normalizeName(p0)] == true else true
end

local _ = function(p1)
	-- upvalues: resolveEmoteIdModule (ref), t (ref)
	local var9 = resolveEmoteIdModule.normalizeName(p1)
	
	return if t[var9] then var9 else nil
end

local function convertReactionCountsArray(p2, p3)
	-- upvalues: resolveEmoteIdModule (ref), t (ref)
	local t_1 = {}
	local var11 = false
	local var12 = nil
	
	for i, v in p2 do
		if type(v) == "table" then
			local count = v.count
			
			if type(count) == "number" and count > 0 then
				local var13 = nil
				
				if type(v.name) == "string" then
					local var14 = resolveEmoteIdModule.normalizeName(v.name)
					var13 = if t[var14] then var14 else nil
				end
				if var13 == nil then
					local emoteId = v.emote_id or v.emoteId
					
					if type(emoteId) == "string" then
						local var16 = resolveEmoteIdModule.reactionTypeForEmoteId(p3, emoteId)
						
						if var16 ~= nil then
							local var17 = resolveEmoteIdModule.normalizeName(var16)
							var13 = if t[var17] then var17 else nil
						end
					end
				end
				if var13 ~= nil then
					t_1[var13] = count
					var11 = true
					local hasUserReacted = v.has_user_reacted
					
					if hasUserReacted == nil then
						hasUserReacted = v.hasUserReacted
					end
					if hasUserReacted == true then
						var12 = var13
					end
				end
			end
		end
	end
	if var12 ~= nil then
		t_1.userReaction = var12
		var11 = true
	end
	return if var11 then t_1 else nil
end

local function convertLegacyApiReactions(p4)
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), t (ref), resolveEmoteIdModule (ref)
	local t_1 = {}
	local var19 = false
	local counts = p4.counts
	
	if type(counts) == "table" then
		for i, v in counts do
			if type(i) == "string" and type(v) == "number" and v > 0 then
				if fFlagMomentsEmojiSetsApiModule then
					local var20 = if t[i] ~= true then t[resolveEmoteIdModule.normalizeName(i)] == true else true
					
					if var20 then
						local var21 = resolveEmoteIdModule.normalizeName(i)
						var20 = if t[var21] then var21 else nil
						
						if var20 ~= nil then
							t_1[var20] = v
							var19 = true
						end
					end
				elseif t[i] then
					t_1[i] = v
					var19 = true
				end
			end
		end
	end
	local userReaction = p4.userReaction or p4.viewerReaction
	
	if type(userReaction) == "string" then
		if fFlagMomentsEmojiSetsApiModule then
			local var23 = resolveEmoteIdModule.normalizeName(userReaction)
			local var24 = if t[var23] then var23 else nil
			
			if var24 ~= nil then
				t_1.userReaction = var24
				var19 = true
			end
		elseif t[userReaction] then
			t_1.userReaction = userReaction
			var19 = true
		end
	end
	return if var19 then t_1 else nil
end

local _ = function(p5, p6)
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), convertReactionCountsArray (ref), convertLegacyApiReactions (ref)
	if type(p5) ~= "table" then
		return nil
	elseif fFlagMomentsEmojiSetsApiModule then
		local reactionCounts = p5.reaction_counts or p5.reactionCounts
		
		if type(reactionCounts) == "table" then
			local var26 = convertReactionCountsArray(reactionCounts, p6)
			
			return if var26 == nil then convertLegacyApiReactions(p5) else var26
		end
	end
end

return function(p7)
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), resolveMomentsEmojiCatalogModule (ref), hardcodedMomentsEmojisModule (ref), convertReactionCountsArray (ref), convertLegacyApiReactions (ref)
	local t = {}
	local var28 = if fFlagMomentsEmojiSetsApiModule then resolveMomentsEmojiCatalogModule.resolveMomentsEmojiCatalog(nil).emojis else hardcodedMomentsEmojisModule
	
	if p7 == nil then
		return t
	end
	for i, v in p7 do
		local entityId = v.entityId or v.id
		
		if entityId ~= nil then
			local var30
			local reactions = v.reactions
			
			if type(reactions) == "table" then
				if fFlagMomentsEmojiSetsApiModule then
					local reactionCounts = reactions.reaction_counts or reactions.reactionCounts
					
					if type(reactionCounts) == "table" then
						local var32 = convertReactionCountsArray(reactionCounts, var28)
						var30 = if var32 == nil then convertLegacyApiReactions(reactions) else var32
					end
				end
			else
				var30 = nil
			end
			if var30 ~= nil then
				t[entityId] = var30
			end
		end
	end
	return t
end