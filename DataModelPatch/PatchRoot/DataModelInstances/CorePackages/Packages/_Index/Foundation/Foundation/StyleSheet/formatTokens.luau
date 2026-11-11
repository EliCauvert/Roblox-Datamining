local ColorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)
local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)

local function pascalToKebab(Text: string): string
	local Replaced = string.gsub(Text:gsub("_", "-"), "(%u)", function(Match: string): string
		return "-" .. Match:lower()
	end)
	
	if Replaced:sub(1, 1) == "-" then
		Replaced = Replaced:sub(2, #Replaced)
	end
	return Replaced
end

return function(p1)
	-- upvalues: pascalToKebab (copy), ColorScopeKeepPrefixModule (copy)
	local Colors = {}
	local Variants = {}
	local List = {}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local Typography = {}
	local List4 = {}
	local List5 = {}
	local List6 = {}
	local config = {
		colors = Colors,
		variants = Variants,
		strokes = List,
		gaps = List1,
		radii = List2,
		sizes = List3,
		typography = Typography,
		paddings = List4,
		margins = List5,
		gutters = List6
	}
	
	if p1 == nil or next(p1) == nil then
		return config
	end
	for i, value in pairs(p1.Color) do
		if value.Background then
			Variants[pascalToKebab(i)] = value
			continue
		end
		Colors[i] = {}
		
		for i1, value1 in value do
			Colors[i][pascalToKebab(if ColorScopeKeepPrefixModule[i] then i .. i1 else i1)] = value1
		end
	end
	for i2, value2 in pairs(p1.Inverse) do
		if i2 == "Content" then
			for i3, value3 in value2 do
				Colors[i2][`inverse-{pascalToKebab(if ColorScopeKeepPrefixModule[i2] then i2 .. i3 else i3)}`] = value3
			end
		end
	end
	for i4, Size in pairs(p1.Stroke) do
		table.insert(List, { name = pascalToKebab(i4), size = Size })
	end
	table.insert(List, { name = "none", size = 0 })
	table.sort(List, function(A, B): boolean
		return A.size < B.size
	end)
	
	for i5, value4 in pairs(p1.Gap) do
		table.insert(List1, { name = string.lower(i5), size = UDim.new(0, value4) })
	end
	table.sort(List1, function(A, B): boolean
		return A.size.Offset < B.size.Offset
	end)
	
	for i7, value6 in pairs(p1.Radius) do
		table.insert(List2, { name = string.lower(i7), size = UDim.new(0, value6) })
	end
	table.sort(List2, function(A, B): boolean
		return A.size.Offset < B.size.Offset
	end)
	
	for i8, value7 in pairs(p1.Size) do
		table.insert(List3, {
			name = pascalToKebab(string.split(i8, "_")[2]),
			size = UDim.new(0, value7)
		})
	end
	table.insert(List3, { name = "full", size = UDim.new(1, 0) })
	table.sort(List3, function(A, B): boolean
		return A.size.Offset < B.size.Offset
	end)
	
	for i10, value9 in pairs(p1.Typography) do
		Typography[pascalToKebab(i10)] = {
			Font = value9.Font,
			TextSize = value9.FontSize,
			LineHeight = value9.LineHeight
		}
	end
	for i6, value5 in pairs(p1.Padding) do
		table.insert(List4, { name = string.lower(i6), size = UDim.new(0, value5) })
	end
	table.sort(List4, function(A, B): boolean
		return A.size.Offset < B.size.Offset
	end)
	
	for i11, value10 in pairs(p1.Margin) do
		table.insert(List5, { name = string.lower(i11), size = UDim.new(0, value10) })
	end
	table.sort(List5, function(A, B): boolean
		return A.size.Offset < B.size.Offset
	end)
	
	for i9, value8 in pairs(p1.Gutter) do
		table.insert(List6, { name = string.lower(i9), size = UDim.new(0, value8) })
	end
	table.sort(List6, function(A, B): boolean
		return A.size.Offset < B.size.Offset
	end)
	
	return config
end