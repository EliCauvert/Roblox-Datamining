local _ = require(script:FindFirstAncestor("SduiCoreSystem").ClientBinding.SduiClientBindingTypes)

local function tryResolveTemplatePair(RobloxComponent, InlineComponent, p1)
	if InlineComponent ~= nil then
		return InlineComponent, true
	end
	if RobloxComponent and RobloxComponent ~= "" then
		local TemplateForRobloxComponent = p1.getTemplateForRobloxComponent(RobloxComponent)
		
		if TemplateForRobloxComponent then
			return TemplateForRobloxComponent, false
		end
	end
	return nil, false
end

local function resolveItemOverrides(List, p1)
	if List == nil or next(List) == nil then
		return nil
	end
	local t = {}
	
	for i, value in List do
		local RobloxComponent = value.roblox_component
		local InlineComponent = value.inline_component
		local Flag = nil
		local Template = nil
		
		if InlineComponent == nil then
			if RobloxComponent and RobloxComponent ~= "" then
				local TemplateForRobloxComponent = p1.getTemplateForRobloxComponent(RobloxComponent)
				
				if TemplateForRobloxComponent then
					Template = TemplateForRobloxComponent
					Flag = false
				end
			end
			Template = nil
			Flag = false
		else
			Template = InlineComponent
			Flag = true
		end
		t[i] = {
			template = Template,
			isInline = Flag,
			inputs = value.inputs,
			sortRankProp = value.sort_rank
		}
	end
	return t
end

local function _(p2, BoundEntry, p3, p4, p5)
	local RobloxComponent = if typeof(p2) == "table" then p2.roblox_component else nil
	local InlineComponent = if typeof(p2) == "table" then p2.inline_component else nil
	local InlineComponent1 = nil
	local Flag = nil
	repeat
		if InlineComponent ~= nil then
			InlineComponent1 = InlineComponent
			Flag = true
			break
		end
		if RobloxComponent and RobloxComponent ~= "" then
			local TemplateForRobloxComponent = p5.getTemplateForRobloxComponent(RobloxComponent)
			
			if TemplateForRobloxComponent then
				InlineComponent1 = TemplateForRobloxComponent
				Flag = false
				break
			end
		end
		InlineComponent1 = nil
		Flag = false
	until true
	if InlineComponent1 then
		return InlineComponent1, Flag
	elseif BoundEntry and BoundEntry.template then
		return BoundEntry.template, BoundEntry.isInline
	else
		return p3, p4
	end
end

local _ = function(p2, p3)
	-- upvalues: tryResolveTemplatePair (copy)
	if p2 == nil then
		return nil, false
	else
		return tryResolveTemplatePair(p2.roblox_component, p2.inline_component, p3)
	end
end

local function buildBoundEntry(Item, Identifier, p2, p3, Inputs, SortRank, p4, p5)
	local BoundEntry = if p4 and Identifier then p4[Identifier] else nil
	local RobloxComponent = if typeof(Item) == "table" then Item.roblox_component else nil
	local InlineComponent = if typeof(Item) == "table" then Item.inline_component else nil
	local InlineComponent1 = nil
	local Flag = nil
	repeat
		if InlineComponent ~= nil then
			InlineComponent1 = InlineComponent
			Flag = true
			break
		end
		if RobloxComponent and RobloxComponent ~= "" then
			local TemplateForRobloxComponent = p5.getTemplateForRobloxComponent(RobloxComponent)
			
			if TemplateForRobloxComponent then
				InlineComponent1 = TemplateForRobloxComponent
				Flag = false
				break
			end
		end
		InlineComponent1 = nil
		Flag = false
	until true
	local IsInline = nil
	local Template = nil
	if InlineComponent1 then
		Template = InlineComponent1
		IsInline = Flag
	elseif BoundEntry and BoundEntry.template then
		Template = BoundEntry.template
		IsInline = BoundEntry.isInline
	else
		Template = p2
		IsInline = p3
	end
	return {
		sourceMode = "data",
		item = Item,
		identifier = Identifier,
		inputs = BoundEntry and BoundEntry.inputs or Inputs,
		template = Template,
		isInline = IsInline,
		sortRankProp = (if typeof(Item) == "table" then Item.sort_rank else nil) or (BoundEntry and BoundEntry.sortRankProp or SortRank)
	}
end

return {
	normalizeLiteralItems = function(Items, p2, p3)
		local Inputs = if p2 then p2.inputs else nil
		local SortRank = if p2 then p2.sort_rank else nil
		local v1 = nil
		local Flag = nil
		repeat
			if p2 == nil then
				v1 = nil
				Flag = false
				break
			end
			local RobloxComponent = p2.roblox_component
			local InlineComponent = p2.inline_component
			
			if InlineComponent ~= nil then
				v1 = InlineComponent
				Flag = true
				break
			end
			if RobloxComponent and RobloxComponent ~= "" then
				local TemplateForRobloxComponent = p3.getTemplateForRobloxComponent(RobloxComponent)
				
				if TemplateForRobloxComponent then
					v1 = TemplateForRobloxComponent
					Flag = false
					break
				end
			end
			v1 = nil
			Flag = false
		until true
		local List = {}
		local TemplateForRobloxComponent = nil
		local InlineComponent = nil
		
		for _, item in Items do
			local Identifier = item.identifier
			
			if Identifier == "" then
				Identifier = nil
			end
			local RobloxComponent = if typeof(item) == "table" then item.roblox_component else nil
			InlineComponent = if typeof(item) == "table" then item.inline_component else nil
			local InlineComponent1 = nil
			local Flag1 = nil
			repeat
				if InlineComponent ~= nil then
					InlineComponent1 = InlineComponent
					Flag1 = true
					break
				end
				if RobloxComponent and RobloxComponent ~= "" then
					TemplateForRobloxComponent = p3.getTemplateForRobloxComponent(RobloxComponent)
					
					if TemplateForRobloxComponent then
						InlineComponent1 = TemplateForRobloxComponent
						Flag1 = false
						break
					end
				end
				InlineComponent1 = nil
				Flag1 = false
			until true
			local Template = nil
			local IsInline = nil
			if InlineComponent1 then
				Template = InlineComponent1
				IsInline = Flag1
			else
				Template = v1
				IsInline = Flag
			end
			table.insert(List, {
				sourceMode = "literal",
				item = item,
				identifier = Identifier,
				inputs = item.inputs or Inputs,
				template = Template,
				isInline = IsInline,
				sortRankProp = item.sort_rank or SortRank
			})
		end
		return List
	end,
	normalizeBoundData = function(Entry, p4, p5, p6)
		-- upvalues: resolveItemOverrides (copy), buildBoundEntry (copy)
		if typeof(Entry) ~= "table" then
			return {}
		end
		local Inputs = if p4 then p4.inputs else nil
		local SortRank = if p4 then p4.sort_rank else nil
		local v2 = nil
		local Flag = nil
		repeat
			if p4 == nil then
				v2 = nil
				Flag = false
				break
			end
			local RobloxComponent = p4.roblox_component
			local InlineComponent = p4.inline_component
			
			if InlineComponent ~= nil then
				v2 = InlineComponent
				Flag = true
				break
			end
			if RobloxComponent and RobloxComponent ~= "" then
				local TemplateForRobloxComponent = p6.getTemplateForRobloxComponent(RobloxComponent)
				
				if TemplateForRobloxComponent then
					v2 = TemplateForRobloxComponent
					Flag = false
					break
				end
			end
			v2 = nil
			Flag = false
		until true
		local ResolveItemOverridesResult = resolveItemOverrides(p5, p6)
		local List = {}
		
		if Entry[1] ~= nil or next(Entry) == nil then
			for _, value in Entry do
				local Identifier = if typeof(value) == "table" then value.identifier else nil
				
				if Identifier == "" then
					Identifier = nil
				end
				table.insert(List, (buildBoundEntry(value, Identifier, v2, Flag, Inputs, SortRank, ResolveItemOverridesResult, p6)))
			end
			return List
		else
			for i, value1 in Entry do
				table.insert(List, (buildBoundEntry(value1, tostring(i), v2, Flag, Inputs, SortRank, ResolveItemOverridesResult, p6)))
			end
			return List
		end
	end
}