local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local buildDataBindingSourcesForTemplateModule = require(sduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiClientBindingTypesModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local _ = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local propResultCategory = sduiClientBindingTypesModule.PropResultCategory
local t = {}

local function resolvePropToValue(p0, p1, p2, p3, p4, p5)
	-- upvalues: sduiClientBindingBuilderModule (ref), propResultCategory (ref)
	if p0 == nil or p0.kind == nil then
		return nil
	end
	local var8, var9 = sduiClientBindingBuilderModule.buildProp(p0, p1, p2, p3, p4)
	
	if var9 == propResultCategory.PropSignal and var8 ~= nil then
		local var10 = var8(p5)
		
		return var10 and var10.data
	end
	return var8
end

local function _(p6, p7, p8, p9, p10, p11)
	-- upvalues: sduiClientBindingBuilderModule (ref), propResultCategory (ref)
	if p6 == nil or p6.kind == nil then
		return nil
	end
	local var13
	local var11, var12 = sduiClientBindingBuilderModule.buildProp(p6, p8, p9, p10, p11)
	
	if var12 == propResultCategory.PropSignal and var11 ~= nil then
		local var14 = var11(p7)
		var13 = var14
		
		return var13 and var14.data
	end
	var13 = var11
end

local function resolveItemSortRank(p12, p13, p14, p15, p16, p17)
	-- upvalues: t (ref), buildDataBindingSourcesForTemplateModule (ref), resolvePropToValue (ref)
	if p12 == nil or p12.kind == nil then
		return nil
	end
	local kind = p14 and p14.kind
	local value = kind and kind.value
	local var17 = if typeof(p13) == "table" then p13 else t
	local var18 = buildDataBindingSourcesForTemplateModule(var17, value and (value.shared and value.shared.data) or t)
	local ok, status = pcall(resolvePropToValue, p12, function()
		-- upvalues: var18 (ref)
		return var18
	end, function()
		-- upvalues: var17 (ref)
		return var17
	end, p15, p16, p17)
	
	return if ok then tonumber(status) else nil
end

local function compareEntryRank(p18, p19)
	return if p18.rank == p19.rank then p18.originalIndex < p19.originalIndex elseif p18.rank == nil then false else p19.rank == nil or p18.rank < p19.rank
end

return {
	applyOrder = function(p20, p21, p22, p23, p24, p25, p26)
		-- upvalues: sduiClientBindingBuilderModule (ref), propResultCategory (ref), resolveItemSortRank (ref), compareEntryRank (ref)
		local data
		if p21 == nil or p21.kind == nil then
			data = nil
		else
			local var19, var20 = sduiClientBindingBuilderModule.buildProp(p21, p23, p24, p25, p26)
			local var21 = if var20 ~= propResultCategory.PropSignal then if var19 == nil then var19(p22) else nil else nil
			data = var20 ~= propResultCategory.PropSignal and (var19 == nil and (var21 and var21.data))
		end
		if data then
			local t = {}
			
			for i, v in p20 do
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
			p20 = t_1
		end
		local var25 = false
		
		for i, v in p20 do
			if v.sortRankProp ~= nil then
				var25 = true
				break
			end
		end
		if not var25 then
			return p20
		end
		local t = {}
		
		for i_1, v_1 in p20 do
			if v_1.template then
				t[i_1] = resolveItemSortRank(v_1.sortRankProp, v_1.item, v_1.template, p25, p26, p22)
			end
		end
		local t_1 = {}
		
		for i_2, v_2 in p20 do
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