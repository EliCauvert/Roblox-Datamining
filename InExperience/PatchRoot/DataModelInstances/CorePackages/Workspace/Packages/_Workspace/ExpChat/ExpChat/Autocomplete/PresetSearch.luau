local ExpChat = script:FindFirstAncestor("ExpChat")
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(ExpChat.Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local SearchMode = { Substring = 0, WordStart = 1 }
local CategoryGroups = nil
local v1 = nil

local function flatten(CategoryGroups)
	-- upvalues: EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
	local Values = {}
	local LowerValues = {}
	local PresetIdByValue = {}
	
	for _, categoryGroup in CategoryGroups do
		for _, category in categoryGroup.categories do
			local Contents = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then category.contents else category.messages
			for _, content in Contents do
				if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint or content.kind ~= "Emoji" then
					local Text = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then content.text else content.value
					
					if PresetIdByValue[Text] == nil then
						PresetIdByValue[Text] = content.presetId
						table.insert(Values, Text)
						table.insert(LowerValues, string.lower(Text))
					end
				end
			end
		end
	end
	return {
		values = Values,
		lowerValues = LowerValues,
		presetIdByValue = PresetIdByValue
	}
end

local function getCatalog(p1)
	-- upvalues: ConstantsModule (copy), v1 (ref), CategoryGroups (ref), flatten (copy)
	if not p1.getIsEnabled(false) or p1.getAccessLevel(false) ~= ConstantsModule.AccessLevel.Enabled then
		return nil
	end
	local CategoryGroups1 = p1.getCategoryGroups(false)
	
	if v1 == nil or CategoryGroups ~= CategoryGroups1 then
		CategoryGroups = CategoryGroups1
		v1 = flatten(CategoryGroups1)
	end
	return v1
end

local function getRank(Text: string, Pattern)
	local FoundAt: number? = string.find(Text, Pattern, 1, true)
	
	return if FoundAt == nil then nil elseif FoundAt == 1 then 1 elseif string.match(string.sub(Text, FoundAt - 1, FoundAt - 1), "%w") == nil then 2 else 3
end

local function getWordStartRank(Text: string, Pattern): number?
	local FoundAt: number? = string.find(Text, Pattern, 1, true)
	while FoundAt ~= nil do
		if FoundAt == 1 then
			return 1
		end
		if string.match(string.sub(Text, FoundAt - 1, FoundAt - 1), "%w") == nil then
			return 2
		end
		FoundAt = string.find(Text, Pattern, FoundAt + 1, true)
	end
	return nil
end

return {
	MIN_QUERY_LENGTH = 2,
	SearchMode = SearchMode,
	findMatchingPresets = function(p1, Text: string, p2)
		-- upvalues: getCatalog (copy), SearchMode (copy), getWordStartRank (copy), getRank (copy)
		if (utf8.len(Text) or #Text) < (if p2 and p2.minQueryLength then p2.minQueryLength else 2) then
			return {}
		end
		local PresetCooldownEndsAt = p1.getPresetCooldownEndsAt(false)
		
		if PresetCooldownEndsAt ~= nil and os.clock() < PresetCooldownEndsAt then
			return {}
		end
		local Catalog = getCatalog(p1)
		
		if Catalog == nil then
			return {}
		end
		local Lowered = string.lower(Text)
		local GetWordStartRank = if p2 and p2.mode == SearchMode.WordStart then getWordStartRank else getRank
		local List = {}
		
		for Index, lowerValue in Catalog.lowerValues do
			local WordStartRank = GetWordStartRank(lowerValue, Lowered)
			
			if WordStartRank ~= nil then
				table.insert(List, { rank = WordStartRank, index = Index })
			end
		end
		table.sort(List, function(A, B): boolean
			return if A.rank == B.rank then A.index < B.index else A.rank < B.rank
		end)
		local Buffer = table.create(#List)
		
		for _, value in List do
			table.insert(Buffer, Catalog.values[value.index])
		end
		return Buffer
	end,
	getPresetIdForValue = function(p3, p4)
		-- upvalues: getCatalog (copy)
		local Catalog = getCatalog(p3)
		
		return if Catalog == nil then nil else Catalog.presetIdByValue[p4]
	end
}