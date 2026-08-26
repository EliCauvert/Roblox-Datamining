local _ = require(script:FindFirstAncestor("SduiCoreSystem").ClientBinding.SduiClientBindingTypes)

local function tryResolveTemplatePair(p1, p2, p3)
	if p2 ~= nil then
		return p2, true
	elseif p1 and p1 ~= "" then
		local templateForRobloxComponent = p3.getTemplateForRobloxComponent(p1)
		
		if templateForRobloxComponent then
			return templateForRobloxComponent, false
		end
	end
	return nil, false
end

local function resolveItemOverrides(p1, p2)
	if p1 == nil or next(p1) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		local var1, var2
		local robloxComponent = v.roblox_component
		local inlineComponent = v.inline_component
		
		if inlineComponent == nil then
			if robloxComponent and robloxComponent ~= "" then
				local templateForRobloxComponent = p2.getTemplateForRobloxComponent(robloxComponent)
				
				if templateForRobloxComponent then
					var1 = templateForRobloxComponent
					var2 = false
				else
					var1 = nil
					var2 = false
				end
			end
		else
			var1 = inlineComponent
			var2 = true
		end
		t[i] = {
			template = var1,
			isInline = var2,
			inputs = v.inputs,
			sortRankProp = v.sort_rank
		}
	end
	return t
end

local function _(p3, p4, p5, p6, p7)
	local var3, var4
	local var5 = if typeof(p3) == "table" then p3.roblox_component else nil
	local var6 = if typeof(p3) == "table" then p3.inline_component else nil
	
	if var6 == nil then
		if var5 and var5 ~= "" then
			local templateForRobloxComponent = p7.getTemplateForRobloxComponent(var5)
			
			if templateForRobloxComponent then
				var3 = templateForRobloxComponent
				var4 = false
			else
				var3 = nil
				var4 = false
			end
		end
	else
		var3 = var6
		var4 = true
	end
	if var3 then
		return var3, var4
	elseif p4 and p4.template then
		return p4.template, p4.isInline
	end
	return p5, p6
end

local _ = function(p3, p4)
	-- upvalues: tryResolveTemplatePair (ref)
	if p3 == nil then
		return nil, false
	end
	return tryResolveTemplatePair(p3.roblox_component, p3.inline_component, p4)
end

local function buildBoundEntry(p3, p4, p5, p6, p7, p8, p9, p10)
	local var3, var4
	local var5 = if p9 and p4 then p9[p4] else nil
	local var6 = if typeof(p3) == "table" then p3.roblox_component else nil
	local var7 = if typeof(p3) == "table" then p3.inline_component else nil
	
	if var7 == nil then
		if var6 and var6 ~= "" then
			local templateForRobloxComponent = p10.getTemplateForRobloxComponent(var6)
			
			if templateForRobloxComponent then
				var3 = templateForRobloxComponent
				var4 = false
			else
				var3 = nil
				var4 = false
			end
		end
	else
		var3 = var7
		var4 = true
	end
	local var8, var9
	if var3 then
		var8 = var3
		var9 = var4
	elseif var5 and var5.template then
		var8 = var5.template
		var9 = var5.isInline
	else
		var8 = p5
		var9 = p6
	end
	return {
		sourceMode = "data",
		item = p3,
		identifier = p4,
		inputs = if var5 then var5.inputs else p7,
		template = var8,
		isInline = var9,
		sortRankProp = (if typeof(p3) == "table" then p3.sort_rank else nil) or (if var5 then var5.sortRankProp else p8)
	}
end

return {
	normalizeLiteralItems = function(p3, p4, p5)
		local var3, var4, robloxComponent
		local var5 = if p4 then p4.inputs else nil
		local var6 = if p4 then p4.sort_rank else nil
		
		if p4 == nil then
			var3 = nil
			var4 = false
		else
			robloxComponent = p4.roblox_component
			local inlineComponent = p4.inline_component
			
			if inlineComponent == nil then
				if robloxComponent and robloxComponent ~= "" then
					local templateForRobloxComponent = p5.getTemplateForRobloxComponent(robloxComponent)
					
					if templateForRobloxComponent then
						var3 = templateForRobloxComponent
						var4 = false
					else
						var3 = nil
						var4 = false
					end
				end
			else
				var3 = inlineComponent
				var4 = true
			end
		end
		robloxComponent = {}
		
		for i, v in p3 do
			local identifier = v.identifier
			
			if identifier == "" then
				identifier = nil
			end
			local var7, var8
			local var9 = if typeof(v) == "table" then v.roblox_component else nil
			local var10 = if typeof(v) == "table" then v.inline_component else nil
			
			if var10 == nil then
				if var9 and var9 ~= "" then
					local templateForRobloxComponent = p5.getTemplateForRobloxComponent(var9)
					
					if templateForRobloxComponent then
						var7 = templateForRobloxComponent
						var8 = false
					else
						var7 = nil
						var8 = false
					end
				end
			else
				var7 = var10
				var8 = true
			end
			local var11, var12
			if var7 then
				var11 = var7
				var12 = var8
			else
				var11 = var3
				var12 = var4
			end
			table.insert(robloxComponent, {
				sourceMode = "literal",
				item = v,
				identifier = identifier,
				inputs = v.inputs or var5,
				template = var11,
				isInline = var12,
				sortRankProp = v.sort_rank or var6
			})
		end
		return robloxComponent
	end,
	normalizeBoundData = function(p6, p7, p8, p9)
		-- upvalues: resolveItemOverrides (ref), buildBoundEntry (ref)
		if typeof(p6) ~= "table" then
			return {}
		end
		local var13, var14, robloxComponent
		local var15 = if p7 then p7.inputs else nil
		local var16 = if p7 then p7.sort_rank else nil
		
		if p7 == nil then
			var13 = nil
			var14 = false
		else
			robloxComponent = p7.roblox_component
			local inlineComponent = p7.inline_component
			
			if inlineComponent == nil then
				if robloxComponent and robloxComponent ~= "" then
					local templateForRobloxComponent = p9.getTemplateForRobloxComponent(robloxComponent)
					
					if templateForRobloxComponent then
						var13 = templateForRobloxComponent
						var14 = false
					else
						var13 = nil
						var14 = false
					end
				end
			else
				var13 = inlineComponent
				var14 = true
			end
		end
		robloxComponent = resolveItemOverrides(p8, p9)
		local t = {}
		
		if if p6[1] == nil then next(p6) == nil else true then
			for i, v in p6 do
				local var17 = if typeof(v) == "table" then v.identifier else nil
				
				if var17 == "" then
					var17 = nil
				end
				table.insert(t, buildBoundEntry(v, var17, var13, var14, var15, var16, robloxComponent, p9))
			end
			return t
		else
			for i, v in p6 do
				table.insert(t, buildBoundEntry(v, tostring(i), var13, var14, var15, var16, robloxComponent, p9))
			end
			return t
		end
	end
}