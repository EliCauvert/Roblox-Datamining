local textService = game:GetService("TextService")
local t = { PADDING = Vector2.new(2, 2) }

function t.GetTextBounds(p1, p2, p3, p4)
	-- upvalues: textService (ref), t (ref)
	return textService:GetTextSize(p1, p3, p2, p4) + t.PADDING
end

function t.GetTextWidth(p1, p2, p3)
	-- upvalues: t (ref)
	return t.GetTextBounds(p1, p2, p3, Vector2.new(10000, 10000)).X
end

function t.GetTextHeight(p1, p2, p3, p4)
	-- upvalues: t (ref)
	return t.GetTextBounds(p1, p2, p3, Vector2.new(p4, 10000)).Y
end

function t.Truncate(p1, p2, p3, p4, p5)
	-- upvalues: t (ref)
	p5 = p5 or ""
	
	if p4 >= t.GetTextWidth(p1, p2, p3) then
		return p1
	end
	local var1 = ""
	
	for i, v in utf8.graphemes(p1) do
		local text = string.sub(p1, 1, v) .. p15
		
		if p4 >= t.GetTextWidth(text, p2, p3) then
			var1 = text
			continue
		end
		return var1
	end
	return ""
end

function t.TruncateTextLabel(p6, p7)
	-- upvalues: t (ref)
	p6.Text = t.Truncate(p6.Text, p6.Font, p6.TextSize, p6.AbsoluteSize.X, p7)
end

function t.Trim(p6)
	if type(p6) ~= "string" then
		error(string.format("Text.Trim called on non-string type %s.", type(p6)), 2)
	end
	return p6:gsub("^%s*(.-)%s*$", "%1")
end

function t.RightTrim(p6)
	if type(p6) ~= "string" then
		error(string.format("Text.RightTrim called on non-string type %s.", type(p6)), 2)
	end
	return p6:gsub("%s+$", "")
end

function t.LeftTrim(p6)
	if type(p6) ~= "string" then
		error(string.format("Text.LeftTrim called on non-string type %s.", type(p6)), 2)
	end
	return p6:gsub("^%s+", "")
end

function t.SpaceNormalize(p6)
	if type(p6) ~= "string" then
		error(string.format("Text.SpaceNormalize called on non-string type %s.", type(p6)), 2)
	end
	return p6:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

function t.Split(p6, p7)
	if type(p6) ~= "string" then
		error(string.format("Text.Split called on non-string type %s.", type(p6)), 2)
	elseif type(p7) ~= "string" then
		error(string.format("Text.Split called with a pattern that is non-string type %s.", type(p7)), 2)
	elseif p7 == "" then
		error("Text.Split called with an empty pattern.", 2)
	end
	local t = {}
	local var2 = 1
	while true do
		local matchIndex, matchIndex_1 = string.find(p6, p7, var2, true)
		if not matchIndex or not matchIndex_1 then break end
		table.insert(t, string.sub(p6, var2, matchIndex - 1))
		var2 = matchIndex_1 + 1
		table.insert(t, string.sub(p6, var2, string.len(p6)))
		
		return t
	end
end

return t