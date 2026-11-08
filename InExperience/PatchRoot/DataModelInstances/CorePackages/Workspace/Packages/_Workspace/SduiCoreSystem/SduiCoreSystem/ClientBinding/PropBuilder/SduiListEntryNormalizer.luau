local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local FFlagSduiErrorPaths = require(SduiCoreSystem.Parent.SharedFlags).FFlagSduiErrorPaths
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)

local function tryResolveTemplatePair(RobloxComponent, InlineComponent, p1)
	-- upvalues: FFlagSduiErrorPaths (copy)
	if InlineComponent ~= nil then
		return InlineComponent, true, nil
	end
	if RobloxComponent and RobloxComponent ~= "" then
		local TemplateForRobloxComponent = p1.getTemplateForRobloxComponent(RobloxComponent)
		
		if TemplateForRobloxComponent then
			local v1 = false
			
			if FFlagSduiErrorPaths then
				return TemplateForRobloxComponent, v1, RobloxComponent
			else
				return TemplateForRobloxComponent, v1, nil
			end
		end
	end
	return nil, false, nil
end

local function resolveItemOverrides(List, p1)
	-- upvalues: FFlagSduiErrorPaths (copy)
	if List == nil or next(List) == nil then
		return nil
	end
	local t = {}
	
	for i, value in List do
		local RobloxComponent = value.roblox_component
		local InlineComponent = value.inline_component
		local Template = nil
		local Flag = nil
		local v1 = nil
		
		if InlineComponent == nil then
			if RobloxComponent and RobloxComponent ~= "" then
				local TemplateForRobloxComponent = p1.getTemplateForRobloxComponent(RobloxComponent)
				
				if TemplateForRobloxComponent then
					Template = TemplateForRobloxComponent
					Flag = false
					v1 = if FFlagSduiErrorPaths then RobloxComponent else nil
				end
			end
			Template = nil
			Flag = false
			v1 = nil
		else
			Template = InlineComponent
			Flag = true
			v1 = nil
		end
		t[i] = {
			template = Template,
			isInline = Flag,
			robloxComponent = if FFlagSduiErrorPaths then v1 else nil,
			inputs = value.inputs,
			sortRankProp = value.sort_rank
		}
	end
	return t
end

local function pickTemplate(Item, BoundEntry, p2, p3, p4, p5)
	-- upvalues: FFlagSduiErrorPaths (copy)
	local RobloxComponent = if typeof(Item) == "table" then Item.roblox_component else nil
	local InlineComponent = if typeof(Item) == "table" then Item.inline_component else nil
	local InlineComponent1 = nil
	local Flag = nil
	local v2 = nil
	repeat
		if InlineComponent ~= nil then
			InlineComponent1 = InlineComponent
			Flag = true
			v2 = nil
			break
		end
		if RobloxComponent and RobloxComponent ~= "" then
			local TemplateForRobloxComponent = p5.getTemplateForRobloxComponent(RobloxComponent)
			
			if TemplateForRobloxComponent then
				InlineComponent1 = TemplateForRobloxComponent
				Flag = false
				v2 = if FFlagSduiErrorPaths then RobloxComponent else nil
				break
			end
		end
		InlineComponent1 = nil
		Flag = false
		v2 = nil
	until true
	if InlineComponent1 then
		local InlineComponent2 = InlineComponent1
		local Flag1: boolean = Flag
		
		if FFlagSduiErrorPaths then
			return InlineComponent2, Flag1, v2
		else
			return InlineComponent2, Flag1, nil
		end
	elseif BoundEntry and BoundEntry.template then
		local Template = BoundEntry.template
		local IsInline = BoundEntry.isInline
		
		if FFlagSduiErrorPaths then
			return Template, IsInline, BoundEntry.robloxComponent
		else
			return Template, IsInline, nil
		end
	elseif FFlagSduiErrorPaths then
		return p2, p3, p4
	else
		return p2, p3, nil
	end
end

local function _(p2, p3)
	-- upvalues: tryResolveTemplatePair (copy)
	if p2 == nil then
		return nil, false, nil
	else
		return tryResolveTemplatePair(p2.roblox_component, p2.inline_component, p3)
	end
end

local function buildBoundEntry(Item, Identifier, p2, p3, p4, Inputs, SortRank, p5, p6)
	-- upvalues: pickTemplate (copy), FFlagSduiErrorPaths (copy)
	local BoundEntry = if p5 and Identifier then p5[Identifier] else nil
	local PickTemplateResult, PickTemplateResult2, PickTemplateResult3 = pickTemplate(Item, BoundEntry, p2, p3, if FFlagSduiErrorPaths then p4 else nil, p6)
	
	return {
		sourceMode = "data",
		item = Item,
		identifier = Identifier,
		inputs = BoundEntry and BoundEntry.inputs or Inputs,
		template = PickTemplateResult,
		isInline = PickTemplateResult2,
		robloxComponent = if FFlagSduiErrorPaths then PickTemplateResult3 else nil,
		sortRankProp = (if typeof(Item) == "table" then Item.sort_rank else nil) or (BoundEntry and BoundEntry.sortRankProp or SortRank)
	}
end

return {
	normalizeLiteralItems = function(Items, p2, p3)
		-- upvalues: FFlagSduiErrorPaths (copy)
		local Inputs = if p2 then p2.inputs else nil
		local SortRank = if p2 then p2.sort_rank else nil
		local v2 = nil
		local v3 = nil
		local Flag = nil
		repeat
			if p2 == nil then
				v3 = nil
				Flag = false
				v2 = nil
				break
			end
			local RobloxComponent = p2.roblox_component
			local InlineComponent = p2.inline_component
			
			if InlineComponent ~= nil then
				v3 = InlineComponent
				Flag = true
				v2 = nil
				break
			end
			if RobloxComponent and RobloxComponent ~= "" then
				local TemplateForRobloxComponent = p3.getTemplateForRobloxComponent(RobloxComponent)
				
				if TemplateForRobloxComponent then
					v3 = TemplateForRobloxComponent
					Flag = false
					v2 = if FFlagSduiErrorPaths then RobloxComponent else nil
					break
				end
			end
			v3 = nil
			Flag = false
			v2 = nil
		until true
		local List = {}
		local InlineComponent = nil
		local TemplateForRobloxComponent = nil
		local RobloxComponent = nil
		
		for _, item in Items do
			local Identifier = item.identifier
			
			if Identifier == "" then
				Identifier = nil
			end
			local v4 = if FFlagSduiErrorPaths then v2 else nil
			RobloxComponent = if typeof(item) == "table" then item.roblox_component else nil
			InlineComponent = if typeof(item) == "table" then item.inline_component else nil
			local InlineComponent1 = nil
			local Flag1 = nil
			local v5 = nil
			repeat
				if InlineComponent ~= nil then
					InlineComponent1 = InlineComponent
					Flag1 = true
					v5 = nil
					break
				end
				if RobloxComponent and RobloxComponent ~= "" then
					TemplateForRobloxComponent = p3.getTemplateForRobloxComponent(RobloxComponent)
					
					if TemplateForRobloxComponent then
						InlineComponent1 = TemplateForRobloxComponent
						Flag1 = false
						v5 = if FFlagSduiErrorPaths then RobloxComponent else nil
						break
					end
				end
				InlineComponent1 = nil
				Flag1 = false
				v5 = nil
			until true
			local Template = nil
			local IsInline = nil
			local v6 = nil
			if InlineComponent1 then
				Template = InlineComponent1
				IsInline = Flag1
				v6 = if FFlagSduiErrorPaths then v5 else nil
			else
				Template = v3
				IsInline = Flag
				v6 = if FFlagSduiErrorPaths then v4 else nil
			end
			table.insert(List, {
				sourceMode = "literal",
				item = item,
				identifier = Identifier,
				inputs = item.inputs or Inputs,
				template = Template,
				isInline = IsInline,
				robloxComponent = if FFlagSduiErrorPaths then v6 else nil,
				sortRankProp = item.sort_rank or SortRank
			})
		end
		return List
	end,
	normalizeBoundData = function(Entry, p4, p5, p6)
		-- upvalues: FFlagSduiErrorPaths (copy), resolveItemOverrides (copy), buildBoundEntry (copy)
		if typeof(Entry) ~= "table" then
			return {}
		end
		local Inputs = if p4 then p4.inputs else nil
		local SortRank = if p4 then p4.sort_rank else nil
		local v7 = nil
		local Flag = nil
		local v8 = nil
		repeat
			if p4 == nil then
				v7 = nil
				Flag = false
				v8 = nil
				break
			end
			local RobloxComponent = p4.roblox_component
			local InlineComponent = p4.inline_component
			
			if InlineComponent ~= nil then
				v7 = InlineComponent
				Flag = true
				v8 = nil
				break
			end
			if RobloxComponent and RobloxComponent ~= "" then
				local TemplateForRobloxComponent = p6.getTemplateForRobloxComponent(RobloxComponent)
				
				if TemplateForRobloxComponent then
					v7 = TemplateForRobloxComponent
					Flag = false
					v8 = if FFlagSduiErrorPaths then RobloxComponent else nil
					break
				end
			end
			v7 = nil
			Flag = false
			v8 = nil
		until true
		local ResolveItemOverridesResult = resolveItemOverrides(p5, p6)
		local List = {}
		
		if Entry[1] ~= nil or next(Entry) == nil then
			for _, value in Entry do
				local Identifier = if typeof(value) == "table" then value.identifier else nil
				
				if Identifier == "" then
					Identifier = nil
				end
				table.insert(List, (buildBoundEntry(value, Identifier, v7, Flag, if FFlagSduiErrorPaths then v8 else nil, Inputs, SortRank, ResolveItemOverridesResult, p6)))
			end
			return List
		else
			for i, value1 in Entry do
				table.insert(List, (buildBoundEntry(value1, tostring(i), v7, Flag, if FFlagSduiErrorPaths then v8 else nil, Inputs, SortRank, ResolveItemOverridesResult, p6)))
			end
			return List
		end
	end
}