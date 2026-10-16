local Foundation = script:FindFirstAncestor("Foundation")
local LoggerModule = require(Foundation.Utility.Logger)
local _ = require(Foundation.Components.Types)

local function _(p1: number): number --[[ Line: 27 | Named "getRoundedNumber" ]]
	return math.round(p1 * 1000) / 1000
end

local _ = function(p1, p2: number) --[[ Line: 31 | Named "getRGBAValues" ]]
	local Rounded = math.round(p1.R * 255)
	local Rounded1 = math.round(p1.G * 255)
	local Rounded2 = math.round(p1.B * 255)
	
	if p2 then
		return Rounded, Rounded1, Rounded2, math.round((1 - p2) * 1000) / 1000
	else
		return Rounded, Rounded1, Rounded2
	end
end

local function collectTokens(List, Category, FullPath, p1) --[[ Line: 77 ]]
	-- upvalues: collectTokens (copy)
	local List1 = {}
	
	for Key, Value in List do
		local Text = if FullPath then `{FullPath}.{Key}` else Key
		
		if type(Value) ~= "table" or getmetatable(Value) or p1 and (type(Value) == "table" and (Value.Color3 ~= nil and (typeof(Value.Color3) == "Color3" and (Value.Transparency ~= nil and typeof(Value.Transparency) == "number")))) then
			table.insert(List1, {
				key = Key,
				value = Value,
				category = Category,
				fullPath = Text
			})
			continue
		end
		for _, value in collectTokens(Value, Category, Text, p1) do
			table.insert(List1, value)
		end
	end
	return List1
end

local function getTokenValue(p2, Text: string) --[[ Line: 243 ]]
	local v1 = p2
	
	for _, value in string.split(Text, ".") do
		if v1 == nil or type(v1) ~= "table" then
			return nil
		end
		v1 = v1[value]
	end
	return v1
end

local function tokenOverrideValuesCompatible(List, List1): boolean --[[ Line: 272 ]]
	-- upvalues: tokenOverrideValuesCompatible (copy)
	if List == nil or List1 == nil then
		return false
	end
	if type(List) ~= "table" or type(List1) ~= "table" then
		return typeof(List) == typeof(List1)
	end
	for i, value in List do
		if not tokenOverrideValuesCompatible(value, List1[i]) then
			return false
		end
	end
	for i1 in List1 do
		if List[i1] == nil then
			return false
		end
	end
	return true
end

return {
	isColorStyle = function(p3): boolean --[[ Line: 19 ]]
		return type(p3) == "table" and (p3.Color3 ~= nil and (typeof(p3.Color3) == "Color3" and (p3.Transparency ~= nil and typeof(p3.Transparency) == "number")))
	end,
	formatColorPreviewHTML = function(p3, p4: number): string --[[ Line: 39 ]]
		local Rounded = math.round(p3.R * 255)
		local Rounded1 = math.round(p3.G * 255)
		local Rounded2 = math.round(p3.B * 255)
		local RoundedRatio = nil
		local Rounded4 = nil
		local Rounded3 = nil
		local Rounded5 = nil
		
		if p4 then
			Rounded3 = Rounded
			Rounded4 = Rounded1
			Rounded5 = Rounded2
			RoundedRatio = math.round((1 - p4) * 1000) / 1000
		else
			Rounded3 = Rounded
			Rounded4 = Rounded1
			Rounded5 = Rounded2
			RoundedRatio = nil
		end
		return `<span class="color-preview" style="background-color: rgba({Rounded3},{Rounded4},{Rounded5},{RoundedRatio or 1});"></span>`
	end,
	formatTokenValue = function(p3: number): string --[[ Line: 45 ]]
		if typeof(p3) == "Color3" then
			return `rgb({math.round(p3.R * 255)}, {math.round(p3.G * 255)}, {math.round(p3.B * 255)})`
		end
		if typeof(p3) == "number" then
			return (tostring(math.round(p3 * 1000) / 1000))
		end
		if type(p3) ~= "table" or (p3.Color3 == nil or (typeof(p3.Color3) ~= "Color3" or (p3.Transparency == nil or typeof(p3.Transparency) ~= "number"))) then
			return (tostring(p3))
		end
		local _Color3 = p3.Color3
		local Transparency: number = p3.Transparency
		local Rounded = math.round(_Color3.R * 255)
		local Rounded1 = math.round(_Color3.G * 255)
		local Rounded2 = math.round(_Color3.B * 255)
		local Rounded5 = nil
		local Rounded4 = nil
		local Rounded3 = nil
		local RoundedRatio = nil
		
		if Transparency then
			Rounded3 = Rounded
			Rounded4 = Rounded1
			Rounded5 = Rounded2
			RoundedRatio = math.round((1 - Transparency) * 1000) / 1000
		else
			Rounded3 = Rounded
			Rounded4 = Rounded1
			Rounded5 = Rounded2
			RoundedRatio = nil
		end
		return `rgba({Rounded3}, {Rounded4}, {Rounded5}, {RoundedRatio})`
	end,
	formatTokenValueHTML = function(p3: number): string --[[ Line: 60 ]]
		if typeof(p3) == "Color3" then
			return `<span class="color">{`<span class="color-preview" style="background-color: rgba({math.round(p7.R * 255)},{math.round(p7.G * 255)},{math.round(p7.B * 255)},{1});"></span>`} rgb({math.round(p3.R * 255)}, {math.round(p3.G * 255)}, {math.round(p3.B * 255)})</span>`
		end
		if typeof(p3) == "number" then
			return (tostring(math.round(p3 * 1000) / 1000))
		end
		if type(p3) ~= "table" or (p3.Color3 == nil or (typeof(p3.Color3) ~= "Color3" or (p3.Transparency == nil or typeof(p3.Transparency) ~= "number"))) then
			return (tostring(p3))
		end
		local _Color3 = p3.Color3
		local Transparency: number = p3.Transparency
		local Rounded = math.round(_Color3.R * 255)
		local Rounded1 = math.round(_Color3.G * 255)
		local Rounded2 = math.round(_Color3.B * 255)
		local Rounded3 = nil
		local Rounded4 = nil
		local Rounded5 = nil
		local RoundedRatio = nil
		
		if Transparency then
			Rounded3 = Rounded
			Rounded4 = Rounded1
			Rounded5 = Rounded2
			RoundedRatio = math.round((1 - Transparency) * 1000) / 1000
		else
			Rounded3 = Rounded
			Rounded4 = Rounded1
			Rounded5 = Rounded2
			RoundedRatio = nil
		end
		local _Color31 = p3.Color3
		local Transparency1: number = p3.Transparency
		local Rounded6 = math.round(_Color31.R * 255)
		local Rounded61 = math.round(_Color31.G * 255)
		local Rounded7 = math.round(_Color31.B * 255)
		local RoundedRatio1 = nil
		local Rounded8 = nil
		local Rounded9 = nil
		local Rounded10 = nil
		
		if Transparency1 then
			Rounded8 = Rounded6
			Rounded9 = Rounded61
			Rounded10 = Rounded7
			RoundedRatio1 = math.round((1 - Transparency1) * 1000) / 1000
		else
			Rounded8 = Rounded6
			Rounded9 = Rounded61
			Rounded10 = Rounded7
			RoundedRatio1 = nil
		end
		return `<span class="color">{`<span class="color-preview" style="background-color: rgba({Rounded8},{Rounded9},{Rounded10},{RoundedRatio1 or 1});"></span>`} rgba({Rounded3}, {Rounded4}, {Rounded5}, {RoundedRatio})</span>`
	end,
	collectTokens = collectTokens,
	collectTokensWithSubcategories = function(List, Category, Text: string, p3) --[[ Line: 104 ]]
		-- upvalues: collectTokens (copy)
		local t = {}
		
		for Key, Value in List do
			local Text1 = if Text then `{Text}.{Key}` else Key
			
			if type(Value) == "table" then
				if p3 and (type(Value) == "table" and (Value.Color3 ~= nil and (typeof(Value.Color3) == "Color3" and (Value.Transparency ~= nil and typeof(Value.Transparency) == "number")))) then
					local Default1 = if Text then Text:split(".")[1] else "Default"
					
					if not t[Default1] then
						t[Default1] = {}
					end
					table.insert(t[Default1], {
						key = Key,
						value = Value,
						category = Category,
						fullPath = Text1
					})
					continue
				else
					if not Text then
						local CollectTokensResult = collectTokens(Value, Category, Key, p3)
						
						if #CollectTokensResult > 0 then
							t[Key] = CollectTokensResult
							continue
						end
						continue
					end
					local CollectTokensResult1 = collectTokens(Value, Category, Text1, p3)
					local v2 = Text:split(".")[1]
					
					if not t[v2] then
						t[v2] = {}
					end
					for _, value in CollectTokensResult1 do
						table.insert(t[v2], value)
					end
				end
			else
				local Default = if Text then Text:split(".")[1] else "Default"
				
				if not t[Default] then
					t[Default] = {}
				end
				table.insert(t[Default], {
					key = Key,
					value = Value,
					category = Category,
					fullPath = Text1
				})
			end
		end
		return t
	end,
	hasSubcategories = function(List): boolean --[[ Line: 168 ]]
		local Flag = nil
		for _, value in List do
			if type(value) == "table" then
				Flag = false
				
				for _, value1 in value do
					if type(value1) == "table" or typeof(value1) == "Color3" or typeof(value1) == "number" then
						Flag = true
						break
					end
				end
				if Flag then
					return true
				end
			end
		end
		return false
	end,
	sortTokens = function(p4: string, p5: string, p6): boolean --[[ Line: 196 ]]
		if p4:find("(%u%a+)_(%d+)%.?(%u?%w*)") and p5:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
			local UADUW, UADUW2, UADUW3 = p4:match("(%u%a+)_(%d+)%.?(%u?%w*)")
			local UADUW1, UADUW2_1, UADUW3_1 = p5:match("(%u%a+)_(%d+)%.?(%u?%w*)")
			
			return if UADUW == UADUW1 then if UADUW2 == UADUW2_1 then UADUW3 < UADUW3_1 else tonumber(UADUW2) < tonumber(UADUW2_1) else p4 < p5
		else
			return if p6 then tonumber((p4:match("| (%-?[%d.]+) |$"))) < tonumber((p5:match("| (%-?[%d.]+) |$"))) else p4 < p5
		end
	end,
	orderedTokenCategories = {
		"Color", "Stroke", "Size", "Radius", "Padding", "Margin", "Gap", "Typography",
		"FontSize", "FontWeight", "LineHeight", "Ease", "Time", "Inverse", "DarkMode",
		"LightMode", "Config"
	},
	getTokenValue = getTokenValue,
	setTokenValue = function(p4, Text: string, p5) --[[ Line: 255 ]]
		local Parts = string.split(Text, ".")
		local v3 = p4
		
		for i = 1, #Parts - 1 do
			local Part = Parts[i]
			
			if v3[Part] == nil then return end
			v3 = v3[Part]
		end
		local Part1 = Parts[#Parts]
		
		if v3 and Part1 then
			v3[Part1] = p5
		end
	end,
	resolveTokenOverride = function(p6, p7, p8) --[[ Line: 306 ]]
		-- upvalues: getTokenValue (copy), LoggerModule (copy), tokenOverrideValuesCompatible (copy)
		local v4 = nil
		if type(p8) == "string" then
			local TokenValue = getTokenValue(p6, p8)
			
			if TokenValue == nil then
				LoggerModule:warning(`Token override skipped: unknown source token path "{p29}"`)
				v4 = nil
			else
				v4 = TokenValue
			end
		else
			v4 = p8
		end
		if v4 == nil then
			return nil
		end
		local TokenValue = getTokenValue(p6, p7)
		
		if TokenValue == nil then
			LoggerModule:warning(`Token override skipped: unknown target token path "{p28}"`)
			
			return nil
		elseif tokenOverrideValuesCompatible(TokenValue, v4) then
			return v4
		else
			LoggerModule:warning(`Token override skipped: type or shape mismatch for "{p28}"`)
			
			return nil
		end
	end,
	_resolveTokenOverrideSource = function(p9, p10) --[[ Line: 293 ]]
		-- upvalues: getTokenValue (copy), LoggerModule (copy)
		if type(p10) ~= "string" then
			return p10
		end
		local TokenValue = getTokenValue(p9, p10)
		
		if TokenValue == nil then
			LoggerModule:warning(`Token override skipped: unknown source token path "{p26}"`)
			
			return nil
		else
			return TokenValue
		end
	end
}