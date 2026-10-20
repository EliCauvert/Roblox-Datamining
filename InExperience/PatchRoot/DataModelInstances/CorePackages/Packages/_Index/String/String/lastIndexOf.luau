return function(Text: string, Pattern, p1: number)
	local Length = string.len(Text)
	local Length1 = if p1 and Length < p1 then Length elseif p1 and p1 < 1 then 1 elseif p1 then p1 else Length
	
	if Pattern == "" then
		return Length1
	end
	local v1 = nil
	local v2 = 0
	local v3 = nil
	repeat
		v3 = v1
		v1, v3 = string.find(Text, Pattern, v2 + 1, true)
	until v1 == nil or Length1 < v1
	return if v3 == nil then -1 else v3
end