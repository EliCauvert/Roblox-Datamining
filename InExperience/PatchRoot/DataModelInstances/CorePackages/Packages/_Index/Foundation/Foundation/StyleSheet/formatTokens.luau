local colorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)
local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)

local function pascalToKebab(p0)
	local replaced = string.gsub(p0:gsub("_", "-"), "(%u)", function(p1)
		return "-" .. p1:lower()
	end)
	
	if replaced:sub(1, 1) == "-" then
		replaced = replaced:sub(2, #replaced)
	end
	return replaced
end

return function(p2)
	-- upvalues: pascalToKebab (ref), colorScopeKeepPrefixModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local t_7 = {}
	local t_8 = {}
	local t_9 = {}
	local t_10 = {
		colors = t,
		variants = t_1,
		strokes = t_2,
		gaps = t_3,
		radii = t_4,
		sizes = t_5,
		typography = t_6,
		paddings = t_7,
		margins = t_8,
		gutters = t_9
	}
	
	if p2 == nil or next(p2) == nil then
		return t_10
	end
	for i, v in pairs(p2.Color) do
		if v.Background then
			t_1[pascalToKebab(i)] = v
		else
			t[i] = {}
			
			for i_1, v_1 in v do
				t[i][pascalToKebab(if colorScopeKeepPrefixModule[i] then i .. i_1 else i_1)] = v_1
			end
		end
	end
	for i_1, v_1 in pairs(p2.Inverse) do
		if i_1 == "Content" then
			for i_2, v_2 in v_1 do
				t[i_1][`inverse-{pascalToKebab(if colorScopeKeepPrefixModule[i_1] then i_1 .. i_2 else i_2)}`] = v_2
			end
		end
	end
	for i_2, v_2 in pairs(p2.Stroke) do
		table.insert(t_2, { name = pascalToKebab(i_2), size = v_2 })
	end
	table.insert(t_2, { name = "none", size = 0 })
	table.sort(t_2, function(p3, p4)
		return p3.size < p4.size
	end)
	
	for i_3, v_3 in pairs(p2.Gap) do
		table.insert(t_3, { name = string.lower(i_3), size = UDim.new(0, v_3) })
	end
	table.sort(t_3, function(p5, p6)
		return p5.size.Offset < p6.size.Offset
	end)
	
	for i_4, v_4 in pairs(p2.Radius) do
		table.insert(t_4, { name = string.lower(i_4), size = UDim.new(0, v_4) })
	end
	table.sort(t_4, function(p7, p8)
		return p7.size.Offset < p8.size.Offset
	end)
	
	for i_5, v_5 in pairs(p2.Size) do
		table.insert(t_5, {
			name = pascalToKebab(string.split(i_5, "_")[2]),
			size = UDim.new(0, v_5)
		})
	end
	table.insert(t_5, { name = "full", size = UDim.new(1, 0) })
	table.sort(t_5, function(p9, p10)
		return p9.size.Offset < p10.size.Offset
	end)
	
	for i_6, v_6 in pairs(p2.Typography) do
		t_6[pascalToKebab(i_6)] = {
			Font = v_6.Font,
			TextSize = v_6.FontSize,
			LineHeight = v_6.LineHeight
		}
	end
	for i_7, v_7 in pairs(p2.Padding) do
		table.insert(t_7, { name = string.lower(i_7), size = UDim.new(0, v_7) })
	end
	table.sort(t_7, function(p11, p12)
		return p11.size.Offset < p12.size.Offset
	end)
	
	for i_8, v_8 in pairs(p2.Margin) do
		table.insert(t_8, { name = string.lower(i_8), size = UDim.new(0, v_8) })
	end
	table.sort(t_8, function(p13, p14)
		return p13.size.Offset < p14.size.Offset
	end)
	
	for i_9, v_9 in pairs(p2.Gutter) do
		table.insert(t_9, { name = string.lower(i_9), size = UDim.new(0, v_9) })
	end
	table.sort(t_9, function(p15, p16)
		return p15.size.Offset < p16.size.Offset
	end)
	
	return t_10
end