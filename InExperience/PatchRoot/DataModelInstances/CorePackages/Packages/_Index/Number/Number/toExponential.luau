return function(p1, p2: number) --[[ Line: 17 ]]
	local Number = if typeof(p1) == "string" then tonumber(p1) or -(0 / 0) else p1
	
	if typeof(Number) ~= "number" then
		return "nan"
	end
	if p2 ~= nil then
		if typeof(p2) ~= "number" then
			error("TypeError: fractionDigits must be a number between 0 and 100")
		end
		if p2 < 0 or p2 > 100 then
			error("RangeError: fractionDigits must be between 0 and 100")
		end
	end
	return (string.format(if p2 == nil then "%e" else "%." .. tostring(p2) .. "e", Number):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e"))
end