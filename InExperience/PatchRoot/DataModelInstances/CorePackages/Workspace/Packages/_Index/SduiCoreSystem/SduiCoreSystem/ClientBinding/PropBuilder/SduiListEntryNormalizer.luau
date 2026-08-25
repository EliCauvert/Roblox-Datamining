local _ = require(script:FindFirstAncestor("SduiCoreSystem").ClientBinding.SduiClientBindingTypes)

local function tryResolveTemplatePair(p0, p1, p2)
	if p1 ~= nil then
		return p1, true
	elseif p0 and p0 ~= "" then
		local templateForRobloxComponent = p2.getTemplateForRobloxComponent(p0)
		
		if templateForRobloxComponent then
			return templateForRobloxComponent, false
		end
	end
	return nil, false
end

local function resolveItemOverrides(p3, p4)
	if p3 == nil or next(p3) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p3 do
		local var5, var6
		local robloxComponent = v.roblox_component
		local inlineComponent = v.inline_component
		
		if inlineComponent == nil then
			if robloxComponent and robloxComponent ~= "" then
				local templateForRobloxComponent = p4.getTemplateForRobloxComponent(robloxComponent)
				
				if templateForRobloxComponent then
					var5 = templateForRobloxComponent
					var6 = false
				else
					var5 = nil
					var6 = false
				end
			end
		else
			var5 = inlineComponent
			var6 = true
		end
		t[i] = {
			template = var5,
			isInline = var6,
			inputs = v.inputs,
			sortRankProp = v.sort_rank
		}
	end
	return t
end

local function _(p5, p6, p7, p8, p9)
	local var10, var11
	local var8 = if typeof(p5) == "table" then p5.roblox_component else nil
	local var9 = if typeof(p5) == "table" then p5.inline_component else nil
	
	if var9 == nil then
		if var8 and var8 ~= "" then
			local templateForRobloxComponent = p9.getTemplateForRobloxComponent(var8)
			
			if templateForRobloxComponent then
				var10 = templateForRobloxComponent
				var11 = false
			else
				var10 = nil
				var11 = false
			end
		end
	else
		var10 = var9
		var11 = true
	end
	if var10 then
		return var10, var11
	elseif p6 and p6.template then
		return p6.template, p6.isInline
	end
	return p7, p8
end

local _ = function(p10, p11)
	-- upvalues: tryResolveTemplatePair (ref)
	if p10 == nil then
		return nil, false
	end
	return tryResolveTemplatePair(p10.roblox_component, p10.inline_component, p11)
end

local function buildBoundEntry(p12, p13, p14, p15, p16, p17, p18, p19)
	local var16, var17
	local var13 = if p18 and p13 then p18[p13] else nil
	local var14 = if typeof(p12) == "table" then p12.roblox_component else nil
	local var15 = if typeof(p12) == "table" then p12.inline_component else nil
	
	if var15 == nil then
		if var14 and var14 ~= "" then
			local templateForRobloxComponent = p19.getTemplateForRobloxComponent(var14)
			
			if templateForRobloxComponent then
				var16 = templateForRobloxComponent
				var17 = false
			else
				var16 = nil
				var17 = false
			end
		end
	else
		var16 = var15
		var17 = true
	end
	local var19, var20
	if var16 then
		var19 = var16
		var20 = var17
	elseif var13 and var13.template then
		var19 = var13.template
		var20 = var13.isInline
	else
		var19 = p14
		var20 = p15
	end
	return {
		sourceMode = "data",
		item = p12,
		identifier = p13,
		inputs = if var13 then var13.inputs else p16,
		template = var19,
		isInline = var20,
		sortRankProp = (if typeof(p12) == "table" then p12.sort_rank else nil) or (if var13 then var13.sortRankProp else p17)
	}
end

return {
	normalizeLiteralItems = function(p20, p21, p22)
		local var23, var24, robloxComponent
		local var21 = if p21 then p21.inputs else nil
		local var22 = if p21 then p21.sort_rank else nil
		
		if p21 == nil then
			var23 = nil
			var24 = false
		else
			robloxComponent = p21.roblox_component
			local inlineComponent = p21.inline_component
			
			if inlineComponent == nil then
				if robloxComponent and robloxComponent ~= "" then
					local templateForRobloxComponent = p22.getTemplateForRobloxComponent(robloxComponent)
					
					if templateForRobloxComponent then
						var23 = templateForRobloxComponent
						var24 = false
					else
						var23 = nil
						var24 = false
					end
				end
			else
				var23 = inlineComponent
				var24 = true
			end
		end
		robloxComponent = {}
		
		for i, v in p20 do
			local identifier = v.identifier
			
			if identifier == "" then
				identifier = nil
			end
			local var28, var29
			local var26 = if typeof(v) == "table" then v.roblox_component else nil
			local var27 = if typeof(v) == "table" then v.inline_component else nil
			
			if var27 == nil then
				if var26 and var26 ~= "" then
					local templateForRobloxComponent = p22.getTemplateForRobloxComponent(var26)
					
					if templateForRobloxComponent then
						var28 = templateForRobloxComponent
						var29 = false
					else
						var28 = nil
						var29 = false
					end
				end
			else
				var28 = var27
				var29 = true
			end
			local var31, var32
			if var28 then
				var31 = var28
				var32 = var29
			else
				var31 = var23
				var32 = var24
			end
			table.insert(robloxComponent, {
				sourceMode = "literal",
				item = v,
				identifier = identifier,
				inputs = v.inputs or var21,
				template = var31,
				isInline = var32,
				sortRankProp = v.sort_rank or var22
			})
		end
		return robloxComponent
	end,
	normalizeBoundData = function(p23, p24, p25, p26)
		-- upvalues: resolveItemOverrides (ref), buildBoundEntry (ref)
		if typeof(p23) ~= "table" then
			return {}
		end
		local var35, var36, robloxComponent
		local var33 = if p24 then p24.inputs else nil
		local var34 = if p24 then p24.sort_rank else nil
		
		if p24 == nil then
			var35 = nil
			var36 = false
		else
			robloxComponent = p24.roblox_component
			local inlineComponent = p24.inline_component
			
			if inlineComponent == nil then
				if robloxComponent and robloxComponent ~= "" then
					local templateForRobloxComponent = p26.getTemplateForRobloxComponent(robloxComponent)
					
					if templateForRobloxComponent then
						var35 = templateForRobloxComponent
						var36 = false
					else
						var35 = nil
						var36 = false
					end
				end
			else
				var35 = inlineComponent
				var36 = true
			end
		end
		robloxComponent = resolveItemOverrides(p25, p26)
		local t = {}
		
		if if p23[1] == nil then next(p23) == nil else true then
			for i, v in p23 do
				local var39 = if typeof(v) == "table" then v.identifier else nil
				
				if var39 == "" then
					var39 = nil
				end
				table.insert(t, buildBoundEntry(v, var39, var35, var36, var33, var34, robloxComponent, p26))
			end
			return t
		else
			for i, v in p23 do
				table.insert(t, buildBoundEntry(v, tostring(i), var35, var36, var33, var34, robloxComponent, p26))
			end
			return t
		end
	end
}