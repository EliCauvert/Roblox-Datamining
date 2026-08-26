return function(p1, p2)
	local var1 = if typeof(p1) == "string" then tonumber(p1) or -9223372036854775808 else p1
	
	if typeof(var1) ~= "number" then
		return "nan"
	elseif p2 ~= nil then
		if typeof(p2) ~= "number" then
			error("TypeError: fractionDigits must be a number between 0 and 100")
		end
		if p2 < 0 or p2 > 100 then
			error("RangeError: fractionDigits must be between 0 and 100")
		end
	end
	return string.format(if p2 == nil then "%e" else "%." .. tostring(p2) .. "e", var1):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e")
end