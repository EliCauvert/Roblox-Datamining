local function _(Text: string): string
	return (string.match(Text, "^%s*(.-)%s*$"))
end

return function(Text: string)
	local t = {}
	
	for _, value in string.split(Text, ",") do
		local Match, Match2 = string.match(value, "^([^=]*)=(.*)$")
		local Match1: string? = string.match(Match or value, "^%s*(.-)%s*$")
		
		if Match1 ~= "" then
			local Match3: string = if Match2 then string.match(Match2, "^%s*(.-)%s*$") else ""
			t[Match1] = { chatTarget = if Match3 == "" then nil else Match3 }
		end
	end
	return t
end