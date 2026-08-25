local expChat = script:FindFirstAncestor("ExpChat")
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local constantsModule = require(expChat.PresetChat.Constants)
local var2 = nil
local var3 = nil

local function flatten(p0)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p0 do
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

local function getCatalog(p1)
	-- upvalues: constantsModule (ref), var3 (write), var2 (write), flatten (ref)
	if not p1.getIsEnabled(false) or p1.getAccessLevel(false) ~= constantsModule.AccessLevel.Enabled then
		return nil
	end
	local categoryGroups = p1.getCategoryGroups(false)
	
	if var3 == nil or var2 ~= categoryGroups then
		var2 = categoryGroups
		var3 = flatten(categoryGroups)
	end
	return var3
end

local function _(p2, p3)
	local matchIndex = string.find(p2, p3, 1, true)
	
	return if matchIndex == nil then nil elseif matchIndex == 1 then 1 elseif string.match(string.sub(p2, matchIndex - 1, matchIndex - 1), "%w") == nil then 2 else 3
end

return {
	MIN_QUERY_LENGTH = 2,
	findMatchingPresets = function(value, p4)
		-- upvalues: getCatalog (ref)
		if (utf8.len(p4) or #p4) < 2 then
			return {}
		end
		local presetCooldownEndsAt = value.getPresetCooldownEndsAt(false)
		
		if presetCooldownEndsAt ~= nil and os.clock() < presetCooldownEndsAt then
			return {}
		end
		local var12 = getCatalog(value)
		
		if var12 == nil then
			return {}
		end
		local lowerText = string.lower(p4)
		local t = {}
		
		for i, v in var12.lowerValues do
			local matchIndex = string.find(v, lowerText, 1, true)
			local var17 = if matchIndex == nil then nil elseif matchIndex == 1 then 1 elseif string.match(string.sub(v, matchIndex - 1, matchIndex - 1), "%w") == nil then 2 else 3
			
			if var17 ~= nil then
				table.insert(t, { rank = var17, index = i })
			end
		end
		table.sort(t, function(p5, p6)
			return if p5.rank == p6.rank then p5.index < p6.index else p5.rank < p6.rank
		end)
		local list = table.create(#t)
		
		for i_1, v_1 in t do
			table.insert(list, var12.values[v_1.index])
		end
		return list
	end,
	getPresetIdForValue = function(value, p7)
		-- upvalues: getCatalog (ref)
		local var18 = getCatalog(value)
		
		return if var18 == nil then nil else var18.presetIdByValue[p7]
	end
}