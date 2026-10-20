local function _(p1): number
	local Number: number? = tonumber(p1, 10)
	
	return if tostring(Number) == tostring(-(0 / 0)) then 14 else math.floor(math.max(0, Number - DateTime.now().UnixTimestampMillis) / 86400000)
end

return function(p1, p2, p3)
	local Number: number? = tonumber(p3, 10)
	local Floored: number = if tostring(Number) == tostring(-(0 / 0)) then 14 else math.floor(math.max(0, Number - DateTime.now().UnixTimestampMillis) / 86400000)
	local BoldEnd = (Floored <= 1 and p1 or p2):gsub("{days}", Floored):gsub("{boldStart}", "<b>"):gsub("{boldEnd}", "</b>")
	
	if Floored < 1 then
		BoldEnd = BoldEnd:gsub("1", "&lt; 1")
	end
	return BoldEnd
end