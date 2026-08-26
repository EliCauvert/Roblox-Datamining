local expChat = script:FindFirstAncestor("ExpChat")
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local constantsModule = require(expChat.PresetChat.Constants)
local var1 = nil
local var2 = nil

local function flatten(p1)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p1 do
		for i_1, v_1 in v.categories do
			for i_2, v_2 in v_1.messages do
				if t_2[v_2.value] == nil then
					t_2[v_2.value] = v_2.presetId
					table.insert(t, v_2.value)
					table.insert(t_1, string.lower(v_2.value))
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

local function _(p2, p3)
	local matchIndex = string.find(p2, p3, 1, true)
	
	return if matchIndex == nil then nil elseif matchIndex == 1 then 1 elseif string.match(string.sub(p2, matchIndex - 1, matchIndex - 1), "%w") == nil then 2 else 3
end

return {
	MIN_QUERY_LENGTH = 2,
	findMatchingPresets = function(value, p2)
		-- upvalues: getCatalog (ref)
		if (utf8.len(p2) or #p2) < 2 then
			return {}
		end
		local presetCooldownEndsAt = value.getPresetCooldownEndsAt(false)
		
		if presetCooldownEndsAt ~= nil and os.clock() < presetCooldownEndsAt then
			return {}
		end
		local var3 = getCatalog(value)
		
		if var3 == nil then
			return {}
		end
		local lowerText = string.lower(p2)
		local t = {}
		
		for i, v in var3.lowerValues do
			local matchIndex = string.find(v, lowerText, 1, true)
			local var4 = if matchIndex == nil then nil elseif matchIndex == 1 then 1 elseif string.match(string.sub(v, matchIndex - 1, matchIndex - 1), "%w") == nil then 2 else 3
			
			if var4 ~= nil then
				table.insert(t, { rank = var4, index = i })
			end
		end
		table.sort(t, function(p3, p4)
			return if p3.rank == p4.rank then p3.index < p4.index else p3.rank < p4.rank
		end)
		local list = table.create(#t)
		
		for i_1, v_1 in t do
			table.insert(list, var3.values[v_1.index])
		end
		return list
	end,
	getPresetIdForValue = function(value, p3)
		-- upvalues: getCatalog (ref)
		local var5 = getCatalog(value)
		
		return if var5 == nil then nil else var5.presetIdByValue[p3]
	end
}