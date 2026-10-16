local expChat = script:FindFirstAncestor("ExpChat")
local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(expChat.Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local constantsModule = require(expChat.PresetChat.Constants)
local t = { Substring = 0, WordStart = 1 }
local var1 = nil
local var2 = nil

local function flatten(p1)
	-- upvalues: engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p1 do
		for i_1, v_1 in v.categories do
			for i_2, v_2 in if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then v_1.contents else v_1.messages do
				local var3 = if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then v_2.text else v_2.value
				
				if t_2[var3] == nil then
					t_2[var3] = v_2.presetId
					table.insert(t, var3)
					table.insert(t_1, string.lower(var3))
				end
			end
		end
	end
	return { values = t, lowerValues = t_1, presetIdByValue = t_2 }
end

local function getCatalog(p2)
	-- upvalues: constantsModule (ref), var2 (write), var1 (write), flatten (ref)
	if not p2.getIsEnabled(false) or p2.getAccessLevel(false) ~= constantsModule.AccessLevel.Enabled then
		return nil
	end
	local categoryGroups = p2.getCategoryGroups(false)
	
	if var2 == nil or var1 ~= categoryGroups then
		var1 = categoryGroups
		var2 = flatten(categoryGroups)
	end
	return var2
end

local function getRank(p2, p3)
	local matchIndex = string.find(p2, p3, 1, true)
	
	return if matchIndex == nil then nil elseif matchIndex == 1 then 1 elseif string.match(string.sub(p2, matchIndex - 1, matchIndex - 1), "%w") == nil then 2 else 3
end

local function getWordStartRank(p2, p3)
	local matchIndex = string.find(p2, p3, 1, true)
	while matchIndex ~= nil do
		if matchIndex ~= 1 then
			if string.match(string.sub(p2, matchIndex - 1, matchIndex - 1), "%w") ~= nil then
				matchIndex = string.find(p2, p3, matchIndex + 1, true)
				continue
			end
			return 2
		end
		return 1
	end
	return nil
end

return {
	MIN_QUERY_LENGTH = 2,
	SearchMode = t,
	findMatchingPresets = function(value, p4, p5)
		-- upvalues: getCatalog (ref), t (ref), getWordStartRank (ref), getRank (ref)
		if (utf8.len(p4) or #p4) < (if p5 and p5.minQueryLength then p5.minQueryLength else 2) then
			return {}
		end
		local presetCooldownEndsAt = value.getPresetCooldownEndsAt(false)
		
		if presetCooldownEndsAt ~= nil and os.clock() < presetCooldownEndsAt then
			return {}
		end
		local var4 = getCatalog(value)
		
		if var4 == nil then
			return {}
		end
		local lowerText = string.lower(p4)
		local var5 = if p5 and p5.mode == t.WordStart then getWordStartRank else getRank
		local t_1 = {}
		
		for i, v in var4.lowerValues do
			local var6 = var5(v, lowerText)
			
			if var6 ~= nil then
				table.insert(t_1, { rank = var6, index = i })
			end
		end
		table.sort(t_1, function(p6, p7)
			return if p6.rank == p7.rank then p6.index < p7.index else p6.rank < p7.rank
		end)
		local list = table.create(#t_1)
		
		for i_1, v_1 in t_1 do
			table.insert(list, var4.values[v_1.index])
		end
		return list
	end,
	getPresetIdForValue = function(value, p6)
		-- upvalues: getCatalog (ref)
		local var7 = getCatalog(value)
		
		return if var7 == nil then nil else var7.presetIdByValue[p6]
	end
}