local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local BuildDataBindingSourcesForTemplateModule = require(SduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiClientBindingBuilderModule = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local _ = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local t = {}

local function resolvePropToValue(p1, p2, p3, p4, p5, p6) --[[ Line: 39 ]]
	-- upvalues: SduiClientBindingBuilderModule (copy), PropResultCategory (copy)
	if p1 == nil or p1.kind == nil then
		return nil
	end
	local Prop, Prop2 = SduiClientBindingBuilderModule.buildProp(p1, p2, p3, p4, p5)
	
	if Prop2 == PropResultCategory.PropSignal and Prop ~= nil then
		local PropResult = Prop(p6)
		
		return PropResult and PropResult.data
	else
		return Prop
	end
end

local function _(p1, p2, p3, p4, p5, p6) --[[ Line: 67 | Named "resolveOrderedIdentifiers" ]]
	-- upvalues: SduiClientBindingBuilderModule (copy), PropResultCategory (copy)
	if p1 == nil or p1.kind == nil then
		return nil
	end
	local Prop, Prop2 = SduiClientBindingBuilderModule.buildProp(p1, p3, p4, p5, p6)
	local Prop1 = nil
	
	if Prop2 == PropResultCategory.PropSignal and Prop ~= nil then
		local PropResult = Prop(p2)
		Prop1 = PropResult
		
		if Prop1 then
			return PropResult.data
		end
	else
		Prop1 = Prop
	end
	return Prop1
end

local function resolveItemSortRank(SortRankProp, Item, Template, p1, p2, p3) --[[ Line: 99 ]]
	-- upvalues: t (copy), BuildDataBindingSourcesForTemplateModule (copy), resolvePropToValue (copy)
	if SortRankProp == nil or SortRankProp.kind == nil then
		return nil
	else
		local Kind = Template and Template.kind
		local Value = Kind and Kind.value
		local Item1 = if typeof(Item) == "table" then Item else t
		local DataBindingSourcesForTemplateModule = BuildDataBindingSourcesForTemplateModule(Item1, Value and (Value.shared and Value.shared.data) or t)
		local Success, Result = pcall(resolvePropToValue, SortRankProp, function() --[[ Line: 131 | Named "sourcesGetter" ]]
			-- upvalues: DataBindingSourcesForTemplateModule (copy)
			return DataBindingSourcesForTemplateModule
		end, function() --[[ Line: 134 | Named "itemInputGetter" ]]
			-- upvalues: Item1 (copy)
			return Item1
		end, p1, p2, p3)
		
		return if Success then tonumber(Result) else nil
	end
end

local function compareEntryRank(A, B): boolean --[[ Line: 152 ]]
	return if A.rank == B.rank then A.originalIndex < B.originalIndex else A.rank ~= nil and (B.rank == nil or A.rank < B.rank)
end

return {
	applyOrder = function(List, p1, p2, p3, p4, p5, p6) --[[ Line: 182 ]]
		-- upvalues: SduiClientBindingBuilderModule (copy), PropResultCategory (copy), resolveItemSortRank (copy), compareEntryRank (copy)
		local v1 = nil
		if p1 == nil or p1.kind == nil then
			v1 = nil
		else
			local Prop, Prop2 = SduiClientBindingBuilderModule.buildProp(p1, p3, p4, p5, p6)
			
			if Prop2 == PropResultCategory.PropSignal and Prop ~= nil then
				local PropResult = Prop(p2)
				v1 = PropResult and PropResult.data
			else
				v1 = Prop
			end
		end
		if v1 then
			local t = {}
			
			for _, value in List do
				if value.identifier then
					t[value.identifier] = value
				end
			end
			local List1 = {}
			
			for _, value1 in v1 do
				if t[value1] then
					table.insert(List1, t[value1])
				end
			end
			List = List1
		end
		local Flag = false
		
		for _, value2 in List do
			if value2.sortRankProp ~= nil then
				Flag = true
				break
			end
		end
		if not Flag then
			return List
		end
		local t = {}
		
		for i, value3 in List do
			if value3.template then
				t[i] = resolveItemSortRank(value3.sortRankProp, value3.item, value3.template, p5, p6, p2)
			end
		end
		local List2 = {}
		
		for OriginalIndex, Entry in List do
			table.insert(List2, {
				entry = Entry,
				rank = t[OriginalIndex],
				originalIndex = OriginalIndex
			})
		end
		table.sort(List2, compareEntryRank)
		local List3 = {}
		
		for _, value4 in List2 do
			table.insert(List3, value4.entry)
		end
		return List3
	end
}