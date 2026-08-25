return function(p0, p1)
	local var0 = if typeof(p0) == "string" then tonumber(p0) or -9223372036854775808 else p0
	
	if typeof(var0) ~= "number" then
		return "nan"
	elseif p1 ~= nil then
		if typeof(p1) ~= "number" then
			error("TypeError: fractionDigits must be a number between 0 and 100")
		end
		if p1 < 0 or p1 > 100 then
			error("RangeError: fractionDigits must be between 0 and 100")
		end
	end
	return string.format(if p1 == nil then "%e" else "%." .. tostring(p1) .. "e", var0):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e")
end