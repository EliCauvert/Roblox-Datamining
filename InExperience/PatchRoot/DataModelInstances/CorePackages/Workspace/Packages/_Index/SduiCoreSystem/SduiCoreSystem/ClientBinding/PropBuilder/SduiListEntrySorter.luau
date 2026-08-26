local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local buildDataBindingSourcesForTemplateModule = require(sduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiClientBindingTypesModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local _ = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local propResultCategory = sduiClientBindingTypesModule.PropResultCategory
local t = {}

local function resolvePropToValue(p1, p2, p3, p4, p5, p6)
	-- upvalues: sduiClientBindingBuilderModule (ref), propResultCategory (ref)
	if p1 == nil or p1.kind == nil then
		return nil
	end
	local var1, var2 = sduiClientBindingBuilderModule.buildProp(p1, p2, p3, p4, p5)
	
	if var2 == propResultCategory.PropSignal and var1 ~= nil then
		local var3 = var1(p6)
		
		return var3 and var3.data
	end
	return var1
end

local function _(p1, p2, p3, p4, p5, p6)
	-- upvalues: sduiClientBindingBuilderModule (ref), propResultCategory (ref)
	if p1 == nil or p1.kind == nil then
		return nil
	end
	local var1
	local var2, var3 = sduiClientBindingBuilderModule.buildProp(p1, p3, p4, p5, p6)
	
	if var3 == propResultCategory.PropSignal and var2 ~= nil then
		local var4 = var2(p2)
		var1 = var4
		
		return var1 and var4.data
	end
	var1 = var2
end

local function resolveItemSortRank(p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref), buildDataBindingSourcesForTemplateModule (ref), resolvePropToValue (ref)
	if p1 == nil or p1.kind == nil then
		return nil
	end
	local kind = p3 and p3.kind
	local value = kind and kind.value
	local var1 = if typeof(p2) == "table" then p2 else t
	local var2 = buildDataBindingSourcesForTemplateModule(var1, value and (value.shared and value.shared.data) or t)
	local ok, status = pcall(resolvePropToValue, p1, function()
		-- upvalues: var2 (ref)
		return var2
	end, function()
		-- upvalues: var1 (ref)
		return var1
	end, p4, p5, p6)
	
	return if ok then tonumber(status) else nil
end

local function compareEntryRank(p1, p2)
	return if p1.rank == p2.rank then p1.originalIndex < p2.originalIndex elseif p1.rank == nil then false else p2.rank == nil or p1.rank < p2.rank
end

return {
	applyOrder = function(p1, p2, p3, p4, p5, p6, p7)
		-- upvalues: sduiClientBindingBuilderModule (ref), propResultCategory (ref), resolveItemSortRank (ref), compareEntryRank (ref)
		local data
		if p2 == nil or p2.kind == nil then
			data = nil
		else
			local var1, var2 = sduiClientBindingBuilderModule.buildProp(p2, p4, p5, p6, p7)
			local var3 = if var2 ~= propResultCategory.PropSignal then if var1 == nil then var1(p3) else nil else nil
			data = var2 ~= propResultCategory.PropSignal and (var1 == nil and (var3 and var3.data))
		end
		if data then
			local t = {}
			
			for i, v in p1 do
				if v.identifier then
					t[v.identifier] = v
				end
			end
			local t_1 = {}
			
			for i_1, v_1 in data do
				if t[v_1] then
					table.insert(t_1, t[v_1])
				end
			end
			p1 = t_1
		end
		local var4 = false
		
		for i, v in p1 do
			if v.sortRankProp ~= nil then
				var4 = true
				break
			end
		end
		if not var4 then
			return p1
		end
		local t = {}
		
		for i_1, v_1 in p1 do
			if v_1.template then
				t[i_1] = resolveItemSortRank(v_1.sortRankProp, v_1.item, v_1.template, p6, p7, p3)
			end
		end
		local t_1 = {}
		
		for i_2, v_2 in p1 do
			table.insert(t_1, { entry = v_2, rank = t[i_2], originalIndex = i_2 })
		end
		table.sort(t_1, compareEntryRank)
		local t_2 = {}
		
		for i_3, v_3 in t_1 do
			table.insert(t_2, v_3.entry)
		end
		return t_2
	end
}