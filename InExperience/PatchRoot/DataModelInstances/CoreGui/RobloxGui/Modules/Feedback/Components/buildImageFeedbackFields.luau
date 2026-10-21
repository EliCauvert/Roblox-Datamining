local function _(Text: string)
	if Text == nil then
		return nil, ""
	end
	local Match: string? = string.match(Text, "rbxassetid://(%d+)")
	
	if Match == nil then
		return nil, ""
	else
		return Match, string.match(Text, "version=(%d+)") or ""
	end
end

return function(Text2, Text: string, Text1: string)
	local v1 = nil
	local Match = nil
	if Text == nil then
		v1 = nil
		Match = ""
	else
		local Match1: string? = string.match(Text, "rbxassetid://(%d+)")
		
		if Match1 == nil then
			v1 = nil
			Match = ""
		else
			v1 = Match1
			Match = string.match(Text, "version=(%d+)") or ""
		end
	end
	if v1 == nil then
		return nil
	end
	local v2 = nil
	local Match2 = nil
	if Text1 == nil then
		v2 = nil
		Match2 = ""
	else
		local Match3: string? = string.match(Text1, "rbxassetid://(%d+)")
		
		if Match3 == nil then
			v2 = nil
			Match2 = ""
		else
			v2 = Match3
			Match2 = string.match(Text1, "version=(%d+)") or ""
		end
	end
	return {
		identifier = Text2 .. "#" .. v1 .. "#" .. Match,
		source = v1 .. "#" .. Match,
		translation = if v2 == nil then "" else v2 .. "#" .. Match2
	}
end