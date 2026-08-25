local textService = game:GetService("TextService")
local t = { PADDING = Vector2.new(2, 2) }

function t.GetTextBounds(p0, p1, p2, p3)
	-- upvalues: textService (ref), t (ref)
	return textService:GetTextSize(p0, p2, p1, p3) + t.PADDING
end

function t.GetTextWidth(p4, p5, p6)
	-- upvalues: t (ref)
	return t.GetTextBounds(p4, p5, p6, Vector2.new(10000, 10000)).X
end

function t.GetTextHeight(p7, p8, p9, p10)
	-- upvalues: t (ref)
	return t.GetTextBounds(p7, p8, p9, Vector2.new(p10, 10000)).Y
end

function t.Truncate(p11, p12, p13, p14, p15)
	-- upvalues: t (ref)
	p15 = p15 or ""
	
	if p14 >= t.GetTextWidth(p11, p12, p13) then
		return p11
	end
	local var2 = ""
	
	for i, v in utf8.graphemes(p11) do
		local text = string.sub(p11, 1, v) .. p15
		
		if p14 >= t.GetTextWidth(text, p12, p13) then
			var2 = text
			continue
		end
		return var2
	end
	return ""
end

function t.TruncateTextLabel(p16, p17)
	-- upvalues: t (ref)
	p16.Text = t.Truncate(p16.Text, p16.Font, p16.TextSize, p16.AbsoluteSize.X, p17)
end

function t.Trim(p18)
	if type(p18) ~= "string" then
		error(string.format("Text.Trim called on non-string type %s.", type(p18)), 2)
	end
	return p18:gsub("^%s*(.-)%s*$", "%1")
end

function t.RightTrim(p19)
	if type(p19) ~= "string" then
		error(string.format("Text.RightTrim called on non-string type %s.", type(p19)), 2)
	end
	return p19:gsub("%s+$", "")
end

function t.LeftTrim(p20)
	if type(p20) ~= "string" then
		error(string.format("Text.LeftTrim called on non-string type %s.", type(p20)), 2)
	end
	return p20:gsub("^%s+", "")
end

function t.SpaceNormalize(p21)
	if type(p21) ~= "string" then
		error(string.format("Text.SpaceNormalize called on non-string type %s.", type(p21)), 2)
	end
	return p21:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

function t.Split(p22, p23)
	if type(p22) ~= "string" then
		error(string.format("Text.Split called on non-string type %s.", type(p22)), 2)
	elseif type(p23) ~= "string" then
		error(string.format("Text.Split called with a pattern that is non-string type %s.", type(p23)), 2)
	elseif p23 == "" then
		error("Text.Split called with an empty pattern.", 2)
	end
	local t = {}
	local var5 = 1
	while true do
		local matchIndex, matchIndex_1 = string.find(p22, p23, var5, true)
		if not matchIndex or not matchIndex_1 then break end
		table.insert(t, string.sub(p22, var5, matchIndex - 1))
		var5 = matchIndex_1 + 1
		table.insert(t, string.sub(p22, var5, string.len(p22)))
		
		return t
	end
end

return t