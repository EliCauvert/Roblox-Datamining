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

local function collectTokensWithSubcategories(p1, p2, p3, p4)
	-- upvalues: collectTokens (ref)
	local t = {}
	
	for i, v in p1 do
		local var1
		local var2 = if p3 then `{p3}.{i}` else i
		
		if type(v) ~= "table" then
			local var3 = if p3 then p3:split(".")[1] else "Default"
			
			if not t[var3] then
				t[var3] = {}
			end
			table.insert(t[var3], { key = i, value = v, category = p2, fullPath = var2 })
		end
		if p4 then
			var1 = type(v) == "table" and (v.Color3 ~= nil and (typeof(v.Color3) == "Color3" and (v.Transparency ~= nil and typeof(v.Transparency) == "number")))
			
			if var1 then
				var1 = if p3 then p3:split(".")[1] else "Default"
				
				if not t[var1] then
					t[var1] = {}
				end
				table.insert(t[var1], { key = i, value = v, category = p2, fullPath = var2 })
			elseif p3 then
				var1 = collectTokens(v, p2, var2, p4)
				local var4 = p3:split(".")[1]
				
				if not t[var4] then
					t[var4] = {}
				end
				for i_1, v_1 in var1 do
					table.insert(t[var4], v_1)
				end
			else
				var1 = collectTokens(v, p2, i, p4)
				
				if #var1 > 0 then
					t[i] = var1
				end
			end
		end
	end
	return t
end

local function hasSubcategories(p1)
	local var1
	for i, v in p1 do
		if type(v) == "table" then
			var1 = false
			
			for i_1, v_1 in v do
				if type(v_1) == "table" or typeof(v_1) == "Color3" or typeof(v_1) == "number" then
					var1 = true
					break
				end
			end
			if var1 then
				return true
			end
		end
	end
	return false
end

local function sortTokens(p1, p2, p3)
	if p1:find("(%u%a+)_(%d+)%.?(%u?%w*)") and p2:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
		local var1, var2, var3 = p1:match("(%u%a+)_(%d+)%.?(%u?%w*)")
		local var4, var5, var6 = p2:match("(%u%a+)_(%d+)%.?(%u?%w*)")
		
		return if var1 == var4 then if var2 == var5 then var3 < var6 else tonumber(var2) < tonumber(var5) else p1 < p2
	end
	return if p3 then tonumber(p1:match("| (%-?[%d.]+) |$")) < tonumber(p2:match("| (%-?[%d.]+) |$")) else p1 < p2
end

local list = {
	"Color", "Stroke", "Size", "Radius", "Padding", "Margin", "Gap", "Typography",
	"FontSize", "FontWeight", "LineHeight", "Ease", "Time", "Inverse", "DarkMode",
	"LightMode", "Config"
}

local function getTokenValue(p1, p2)
	local var1 = p1
	
	for i, v in string.split(p2, ".") do
		if var1 ~= nil and type(var1) == "table" then
			var1 = var1[v]
			continue
		end
		return nil
	end
	return var1
end

local function tokenOverrideValuesCompatible(p1, p2)
	-- upvalues: tokenOverrideValuesCompatible (ref)
	if p1 == nil or p2 == nil then
		return false
	elseif type(p1) ~= "table" or type(p2) ~= "table" then
		return typeof(p1) == typeof(p2)
	end
	for i, v in p1 do
		if not tokenOverrideValuesCompatible(v, p2[i]) then
			return false
		end
	end
	for i in p2 do
		if p1[i] == nil then
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
	setTokenValue = function(value, p1, p2)
		local parts = string.split(p1, ".")
		local var1 = value
		
		for i = 1, #parts - 1 do
			local var2 = parts[i]
			
			if var1[var2] ~= nil then
				var1 = var1[var2]
				continue
			end
			return
		end
		local var3 = parts[#parts]
		
		if var1 and var3 then
			var1[var3] = p2
		end
	end,
	resolveTokenOverride = function(p1, p2, p3)
		-- upvalues: getTokenValue (ref), loggerModule (ref), tokenOverrideValuesCompatible (ref)
		local var1
		if type(p3) == "string" then
			local var2 = getTokenValue(p1, p3)
			
			if var2 == nil then
				loggerModule:warning(`Token override skipped: unknown source token path "{p27}"`)
				var1 = nil
			else
				var1 = var2
			end
		else
			var1 = p3
		end
		if var1 == nil then
			return nil
		end
		local var3 = getTokenValue(p1, p2)
		
		if var3 == nil then
			loggerModule:warning(`Token override skipped: unknown target token path "{p26}"`)
			
			return nil
		elseif tokenOverrideValuesCompatible(var3, var1) then
			return var1
		end
		loggerModule:warning(`Token override skipped: type or shape mismatch for "{p26}"`)
		
		return nil
	end,
	_resolveTokenOverrideSource = function(p1, p2)
		-- upvalues: getTokenValue (ref), loggerModule (ref)
		if type(p2) ~= "string" then
			return p2
		end
		local var1 = getTokenValue(p1, p2)
		
		if var1 == nil then
			loggerModule:warning(`Token override skipped: unknown source token path "{p29}"`)
			
			return nil
		end
		return var1
	end
}