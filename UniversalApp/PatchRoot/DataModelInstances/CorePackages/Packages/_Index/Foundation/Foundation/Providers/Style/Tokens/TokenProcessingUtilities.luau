local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local _ = require(foundation.Components.Types)

local function isColorStyle(p0)
	return type(p0) == "table" and (p0.Color3 ~= nil and (typeof(p0.Color3) == "Color3" and (p0.Transparency ~= nil and typeof(p0.Transparency) == "number")))
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

local function formatColorPreviewHTML(p3, p4)
	local var19, var20, var21, var22
	local rounded = math.round(p3.R * 255)
	local rounded_1 = math.round(p3.G * 255)
	local rounded_2 = math.round(p3.B * 255)
	
	if p4 then
		var19 = rounded
		var20 = rounded_1
		var21 = rounded_2
		var22 = math.round((1 - p4) * 1000) / 1000
	else
		var19 = rounded
		var20 = rounded_1
		var21 = rounded_2
		var22 = nil
	end
	return `<span class="color-preview" style="background-color: rgba({var19},{var20},{var21},{var22 or 1});"></span>`
end

local function formatTokenValue(p5)
	if typeof(p5) == "Color3" then
		return `rgb({math.round(p5.R * 255)}, {math.round(p5.G * 255)}, {math.round(p5.B * 255)})`
	elseif typeof(p5) == "number" then
		return tostring(math.round(p5 * 1000) / 1000)
	elseif not (type(p5) == "table" and (p5.Color3 ~= nil and (typeof(p5.Color3) == "Color3" and (p5.Transparency ~= nil and typeof(p5.Transparency) == "number")))) then
		return tostring(p5)
	end
	local var26, var27, var28, var29
	local color3 = p5.Color3
	local transparency = p5.Transparency
	local rounded = math.round(color3.R * 255)
	local rounded_1 = math.round(color3.G * 255)
	local rounded_2 = math.round(color3.B * 255)
	
	if transparency then
		var26 = rounded
		var27 = rounded_1
		var28 = rounded_2
		var29 = math.round((1 - transparency) * 1000) / 1000
	else
		var26 = rounded
		var27 = rounded_1
		var28 = rounded_2
		var29 = nil
	end
	return `rgba({var26}, {var27}, {var28}, {var29})`
end

local function formatTokenValueHTML(p6)
	if typeof(p6) == "Color3" then
		return `<span class="color">{`<span class="color-preview" style="background-color: rgba({math.round(p6.R * 255)},{math.round(p6.G * 255)},{math.round(p6.B * 255)},{nil or 1});"></span>`} rgb({math.round(p6.R * 255)}, {math.round(p6.G * 255)}, {math.round(p6.B * 255)})</span>`
	elseif typeof(p6) == "number" then
		return tostring(math.round(p6 * 1000) / 1000)
	elseif not (type(p6) == "table" and (p6.Color3 ~= nil and (typeof(p6.Color3) == "Color3" and (p6.Transparency ~= nil and typeof(p6.Transparency) == "number")))) then
		return tostring(p6)
	end
	local var33, var34, var35, var36
	local color3 = p6.Color3
	local transparency = p6.Transparency
	local rounded = math.round(color3.R * 255)
	local rounded_1 = math.round(color3.G * 255)
	local rounded_2 = math.round(color3.B * 255)
	
	if transparency then
		var33 = rounded
		var34 = rounded_1
		var35 = rounded_2
		var36 = math.round((1 - transparency) * 1000) / 1000
	else
		var33 = rounded
		var34 = rounded_1
		var35 = rounded_2
		var36 = nil
	end
	local var40, var41, var42, var43
	local color3_1 = p6.Color3
	local transparency_1 = p6.Transparency
	local rounded_3 = math.round(color3_1.R * 255)
	local rounded_4 = math.round(color3_1.G * 255)
	local rounded_5 = math.round(color3_1.B * 255)
	
	if transparency_1 then
		var40 = rounded_3
		var41 = rounded_4
		var42 = rounded_5
		var43 = math.round((1 - transparency_1) * 1000) / 1000
	else
		var40 = rounded_3
		var41 = rounded_4
		var42 = rounded_5
		var43 = nil
	end
	return `<span class="color">{`<span class="color-preview" style="background-color: rgba({var40},{var41},{var42},{var43 or 1});"></span>`} rgba({var33}, {var34}, {var35}, {var36})</span>`
end

local function collectTokens(p7, p8, p9, p10)
	-- upvalues: collectTokens (ref)
	local t = {}
	
	for i, v in p7 do
		local var45 = if p9 then `{p9}.{i}` else i
		
		if type(v) == "table" and not getmetatable(v) then
			if p10 then
				if type(v) == "table" and (v.Color3 ~= nil and (typeof(v.Color3) == "Color3" and (v.Transparency ~= nil and typeof(v.Transparency) == "number"))) then
					table.insert(t, { key = i, value = v, category = p8, fullPath = var45 })
				else
					for i_1, v_1 in collectTokens(v, p8, var45, p10) do
						table.insert(t, v_1)
					end
				end
			end
		end
	end
	return t
end

local function collectTokensWithSubcategories(p11, p12, p13, p14)
	-- upvalues: collectTokens (ref)
	local t = {}
	
	for i, v in p11 do
		local var48
		local var47 = if p13 then `{p13}.{i}` else i
		
		if type(v) ~= "table" then
			local var50 = if p13 then p13:split(".")[1] else "Default"
			
			if not t[var50] then
				t[var50] = {}
			end
			table.insert(t[var50], { key = i, value = v, category = p12, fullPath = var47 })
		end
		if p14 then
			var48 = type(v) == "table" and (v.Color3 ~= nil and (typeof(v.Color3) == "Color3" and (v.Transparency ~= nil and typeof(v.Transparency) == "number")))
			
			if var48 then
				var48 = if p13 then p13:split(".")[1] else "Default"
				
				if not t[var48] then
					t[var48] = {}
				end
				table.insert(t[var48], { key = i, value = v, category = p12, fullPath = var47 })
			elseif p13 then
				var48 = collectTokens(v, p12, var47, p14)
				local var49 = p13:split(".")[1]
				
				if not t[var49] then
					t[var49] = {}
				end
				for i_1, v_1 in var48 do
					table.insert(t[var49], v_1)
				end
			else
				var48 = collectTokens(v, p12, i, p14)
				
				if #var48 > 0 then
					t[i] = var48
				end
			end
		end
	end
	return t
end

local function hasSubcategories(p15)
	local var51
	for i, v in p15 do
		if type(v) == "table" then
			var51 = false
			
			for i_1, v_1 in v do
				if type(v_1) == "table" or typeof(v_1) == "Color3" or typeof(v_1) == "number" then
					var51 = true
					break
				end
			end
			if var51 then
				return true
			end
		end
	end
	return false
end

local function sortTokens(p16, p17, p18)
	if p16:find("(%u%a+)_(%d+)%.?(%u?%w*)") and p17:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
		local var52, var53, var54 = p16:match("(%u%a+)_(%d+)%.?(%u?%w*)")
		local var55, var56, var57 = p17:match("(%u%a+)_(%d+)%.?(%u?%w*)")
		
		return if var52 == var55 then if var53 == var56 then var54 < var57 else tonumber(var53) < tonumber(var56) else p16 < p17
	end
	return if p18 then tonumber(p16:match("| (%-?[%d.]+) |$")) < tonumber(p17:match("| (%-?[%d.]+) |$")) else p16 < p17
end

local list = {
	"Color", "Stroke", "Size", "Radius", "Padding", "Margin", "Gap", "Typography",
	"FontSize", "FontWeight", "LineHeight", "Ease", "Time", "Inverse", "DarkMode",
	"LightMode", "Config"
}

local function getTokenValue(p19, p20)
	local var58 = p19
	
	for i, v in string.split(p20, ".") do
		if var58 ~= nil and type(var58) == "table" then
			var58 = var58[v]
			continue
		end
		return nil
	end
	return var58
end

local function tokenOverrideValuesCompatible(p21, p22)
	-- upvalues: tokenOverrideValuesCompatible (ref)
	if p21 == nil or p22 == nil then
		return false
	elseif type(p21) ~= "table" or type(p22) ~= "table" then
		return typeof(p21) == typeof(p22)
	end
	for i, v in p21 do
		if not tokenOverrideValuesCompatible(v, p22[i]) then
			return false
		end
	end
	for i in p22 do
		if p21[i] == nil then
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
	setTokenValue = function(value, p23, p24)
		local parts = string.split(p23, ".")
		local var60 = value
		
		for i = 1, #parts - 1 do
			local var61 = parts[i]
			
			if var60[var61] ~= nil then
				var60 = var60[var61]
				continue
			end
			return
		end
		local var62 = parts[#parts]
		
		if var60 and var62 then
			var60[var62] = p24
		end
	end,
	resolveTokenOverride = function(p25, p26, p27)
		-- upvalues: getTokenValue (ref), loggerModule (ref), tokenOverrideValuesCompatible (ref)
		local var64
		if type(p27) == "string" then
			local var63 = getTokenValue(p25, p27)
			
			if var63 == nil then
				loggerModule:warning(`Token override skipped: unknown source token path "{p27}"`)
				var64 = nil
			else
				var64 = var63
			end
		else
			var64 = p27
		end
		if var64 == nil then
			return nil
		end
		local var65 = getTokenValue(p25, p26)
		
		if var65 == nil then
			loggerModule:warning(`Token override skipped: unknown target token path "{p26}"`)
			
			return nil
		elseif tokenOverrideValuesCompatible(var65, var64) then
			return var64
		end
		loggerModule:warning(`Token override skipped: type or shape mismatch for "{p26}"`)
		
		return nil
	end,
	_resolveTokenOverrideSource = function(p28, p29)
		-- upvalues: getTokenValue (ref), loggerModule (ref)
		if type(p29) ~= "string" then
			return p29
		end
		local var66 = getTokenValue(p28, p29)
		
		if var66 == nil then
			loggerModule:warning(`Token override skipped: unknown source token path "{p29}"`)
			
			return nil
		end
		return var66
	end
}