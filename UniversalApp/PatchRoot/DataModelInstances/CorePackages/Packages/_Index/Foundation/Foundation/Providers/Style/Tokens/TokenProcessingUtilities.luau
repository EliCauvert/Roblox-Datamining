local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local _ = require(foundation.Components.Types)

local function isColorStyle(p1)
	return type(p1) == "table" and (p1.Color3 ~= nil and (typeof(p1.Color3) == "Color3" and (p1.Transparency ~= nil and typeof(p1.Transparency) == "number")))
end

local function _(value)
	return math.round(value * 1000) / 1000
end

local _ = function(p1, p2)
	local rounded = math.round(p1.R * 255)
	local rounded_1 = math.round(p1.G * 255)
	local rounded_2 = math.round(p1.B * 255)
	
	if p2 then
		return rounded, rounded_1, rounded_2, math.round((1 - p2) * 1000) / 1000
	end
	return rounded, rounded_1, rounded_2
end

local function formatColorPreviewHTML(p1, p2)
	local var1, var2, var3, var4
	local rounded = math.round(p1.R * 255)
	local rounded_1 = math.round(p1.G * 255)
	local rounded_2 = math.round(p1.B * 255)
	
	if p2 then
		var1 = rounded
		var2 = rounded_1
		var3 = rounded_2
		var4 = math.round((1 - p2) * 1000) / 1000
	else
		var1 = rounded
		var2 = rounded_1
		var3 = rounded_2
		var4 = nil
	end
	return `<span class="color-preview" style="background-color: rgba({var19},{var20},{var21},{var22 or 1});"></span>`
end

local function formatTokenValue(p1)
	if typeof(p1) == "Color3" then
		return `rgb({math.round(p1.R * 255)}, {math.round(p1.G * 255)}, {math.round(p1.B * 255)})`
	elseif typeof(p1) == "number" then
		return tostring(math.round(p1 * 1000) / 1000)
	elseif not (type(p1) == "table" and (p1.Color3 ~= nil and (typeof(p1.Color3) == "Color3" and (p1.Transparency ~= nil and typeof(p1.Transparency) == "number")))) then
		return tostring(p1)
	end
	local var1, var2, var3, var4
	local color3 = p1.Color3
	local transparency = p1.Transparency
	local rounded = math.round(color3.R * 255)
	local rounded_1 = math.round(color3.G * 255)
	local rounded_2 = math.round(color3.B * 255)
	
	if transparency then
		var1 = rounded
		var2 = rounded_1
		var3 = rounded_2
		var4 = math.round((1 - transparency) * 1000) / 1000
	else
		var1 = rounded
		var2 = rounded_1
		var3 = rounded_2
		var4 = nil
	end
	return `rgba({var1}, {var2}, {var3}, {var4})`
end

local function formatTokenValueHTML(p1)
	if typeof(p1) == "Color3" then
		return `<span class="color">{`<span class="color-preview" style="background-color: rgba({math.round(p6.R * 255)},{math.round(p6.G * 255)},{math.round(p6.B * 255)},{nil or 1});"></span>`} rgb({math.round(p1.R * 255)}, {math.round(p1.G * 255)}, {math.round(p1.B * 255)})</span>`
	elseif typeof(p1) == "number" then
		return tostring(math.round(p1 * 1000) / 1000)
	elseif not (type(p1) == "table" and (p1.Color3 ~= nil and (typeof(p1.Color3) == "Color3" and (p1.Transparency ~= nil and typeof(p1.Transparency) == "number")))) then
		return tostring(p1)
	end
	local var1, var2, var3, var4
	local color3 = p1.Color3
	local transparency = p1.Transparency
	local rounded = math.round(color3.R * 255)
	local rounded_1 = math.round(color3.G * 255)
	local rounded_2 = math.round(color3.B * 255)
	
	if transparency then
		var1 = rounded
		var2 = rounded_1
		var3 = rounded_2
		var4 = math.round((1 - transparency) * 1000) / 1000
	else
		var1 = rounded
		var2 = rounded_1
		var3 = rounded_2
		var4 = nil
	end
	local var5, var6, var7, var8
	local color3_1 = p1.Color3
	local transparency_1 = p1.Transparency
	local rounded_3 = math.round(color3_1.R * 255)
	local rounded_4 = math.round(color3_1.G * 255)
	local rounded_5 = math.round(color3_1.B * 255)
	
	if transparency_1 then
		var5 = rounded_3
		var6 = rounded_4
		var7 = rounded_5
		var8 = math.round((1 - transparency_1) * 1000) / 1000
	else
		var5 = rounded_3
		var6 = rounded_4
		var7 = rounded_5
		var8 = nil
	end
	return `<span class="color">{`<span class="color-preview" style="background-color: rgba({var40},{var41},{var42},{var43 or 1});"></span>`} rgba({var1}, {var2}, {var3}, {var4})</span>`
end

local function collectTokens(p1, p2, p3, p4)
	-- upvalues: collectTokens (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = if p3 then `{p3}.{i}` else i
		
		if type(v) == "table" and not getmetatable(v) then
			if p4 then
				if type(v) == "table" and (v.Color3 ~= nil and (typeof(v.Color3) == "Color3" and (v.Transparency ~= nil and typeof(v.Transparency) == "number"))) then
					table.insert(t, { key = i, value = v, category = p2, fullPath = var1 })
				else
					for i_1, v_1 in collectTokens(v, p2, var1, p4) do
						table.insert(t, v_1)
					end
				end
			end
		end
	end
	return t
end

local function collectTokensWithSubcategories(p5, p6, p7, p8)
	-- upvalues: collectTokens (ref)
	local t = {}
	
	for i, v in p5 do
		local var2
		local var3 = if p7 then `{p7}.{i}` else i
		
		if type(v) ~= "table" then
			local var4 = if p7 then p7:split(".")[1] else "Default"
			
			if not t[var4] then
				t[var4] = {}
			end
			table.insert(t[var4], { key = i, value = v, category = p6, fullPath = var3 })
		end
		if p8 then
			var2 = type(v) == "table" and (v.Color3 ~= nil and (typeof(v.Color3) == "Color3" and (v.Transparency ~= nil and typeof(v.Transparency) == "number")))
			
			if var2 then
				var2 = if p7 then p7:split(".")[1] else "Default"
				
				if not t[var2] then
					t[var2] = {}
				end
				table.insert(t[var2], { key = i, value = v, category = p6, fullPath = var3 })
			elseif p7 then
				var2 = collectTokens(v, p6, var3, p8)
				local var5 = p7:split(".")[1]
				
				if not t[var5] then
					t[var5] = {}
				end
				for i_1, v_1 in var2 do
					table.insert(t[var5], v_1)
				end
			else
				var2 = collectTokens(v, p6, i, p8)
				
				if #var2 > 0 then
					t[i] = var2
				end
			end
		end
	end
	return t
end

local function hasSubcategories(p9)
	local var6
	for i, v in p9 do
		if type(v) == "table" then
			var6 = false
			
			for i_1, v_1 in v do
				if type(v_1) == "table" or typeof(v_1) == "Color3" or typeof(v_1) == "number" then
					var6 = true
					break
				end
			end
			if var6 then
				return true
			end
		end
	end
	return false
end

local function sortTokens(p10, p11, p12)
	if p10:find("(%u%a+)_(%d+)%.?(%u?%w*)") and p11:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
		local var7, var8, var9 = p10:match("(%u%a+)_(%d+)%.?(%u?%w*)")
		local var10, var11, var12 = p11:match("(%u%a+)_(%d+)%.?(%u?%w*)")
		
		return if var7 == var10 then if var8 == var11 then var9 < var12 else tonumber(var8) < tonumber(var11) else p10 < p11
	end
	return if p12 then tonumber(p10:match("| (%-?[%d.]+) |$")) < tonumber(p11:match("| (%-?[%d.]+) |$")) else p10 < p11
end

local list = {
	"Color", "Stroke", "Size", "Radius", "Padding", "Margin", "Gap", "Typography",
	"FontSize", "FontWeight", "LineHeight", "Ease", "Time", "Inverse", "DarkMode",
	"LightMode", "Config"
}

local function getTokenValue(p10, p11)
	local var7 = p10
	
	for i, v in string.split(p11, ".") do
		if var7 ~= nil and type(var7) == "table" then
			var7 = var7[v]
			continue
		end
		return nil
	end
	return var7
end

local function tokenOverrideValuesCompatible(p12, p13)
	-- upvalues: tokenOverrideValuesCompatible (ref)
	if p12 == nil or p13 == nil then
		return false
	elseif type(p12) ~= "table" or type(p13) ~= "table" then
		return typeof(p12) == typeof(p13)
	end
	for i, v in p12 do
		if not tokenOverrideValuesCompatible(v, p13[i]) then
			return false
		end
	end
	for i in p13 do
		if p12[i] == nil then
			return false
		end
	end
	return true
end

return {
	isColorStyle = isColorStyle,
	formatColorPreviewHTML = formatColorPreviewHTML,
	formatTokenValue = formatTokenValue,
	formatTokenValueHTML = formatTokenValueHTML,
	collectTokens = collectTokens,
	collectTokensWithSubcategories = collectTokensWithSubcategories,
	hasSubcategories = hasSubcategories,
	sortTokens = sortTokens,
	orderedTokenCategories = list,
	getTokenValue = getTokenValue,
	setTokenValue = function(value, p14, p15)
		local parts = string.split(p14, ".")
		local var8 = value
		
		for i = 1, #parts - 1 do
			local var9 = parts[i]
			
			if var8[var9] ~= nil then
				var8 = var8[var9]
				continue
			end
			return
		end
		local var10 = parts[#parts]
		
		if var8 and var10 then
			var8[var10] = p15
		end
	end,
	resolveTokenOverride = function(p16, p17, p18)
		-- upvalues: getTokenValue (ref), loggerModule (ref), tokenOverrideValuesCompatible (ref)
		local var11
		if type(p18) == "string" then
			local var12 = getTokenValue(p16, p18)
			
			if var12 == nil then
				loggerModule:warning(`Token override skipped: unknown source token path "{p27}"`)
				var11 = nil
			else
				var11 = var12
			end
		else
			var11 = p18
		end
		if var11 == nil then
			return nil
		end
		local var13 = getTokenValue(p16, p17)
		
		if var13 == nil then
			loggerModule:warning(`Token override skipped: unknown target token path "{p26}"`)
			
			return nil
		elseif tokenOverrideValuesCompatible(var13, var11) then
			return var11
		end
		loggerModule:warning(`Token override skipped: type or shape mismatch for "{p26}"`)
		
		return nil
	end,
	_resolveTokenOverrideSource = function(p19, p20)
		-- upvalues: getTokenValue (ref), loggerModule (ref)
		if type(p20) ~= "string" then
			return p20
		end
		local var14 = getTokenValue(p19, p20)
		
		if var14 == nil then
			loggerModule:warning(`Token override skipped: unknown source token path "{p29}"`)
			
			return nil
		end
		return var14
	end
}