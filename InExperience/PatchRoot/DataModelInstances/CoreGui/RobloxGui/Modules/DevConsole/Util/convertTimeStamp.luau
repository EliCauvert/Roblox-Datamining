local devConsoleFixTimestampDST = game:DefineFastFlag("DevConsoleFixTimestampDST", false)

local function _(p0)
	return (if p0 < 10 then "0" else "") .. p0
end

return function(p1)
	-- upvalues: devConsoleFixTimestampDST (ref)
	local hour, min, sec
	local _ = nil
	local _ = nil
	local _ = nil
	
	if devConsoleFixTimestampDST then
		local dateString = os.date("*t", p1)
		hour = dateString.hour
		min = dateString.min
		sec = dateString.sec
	else
		local var2 = math.floor(p1 - os.time() + tick()) % 86400
		hour = math.floor(var2 / 3600)
		var2 -= hour * 3600
		min = math.floor(var2 / 60)
		sec = var2 - min * 60
	end
	return string.format("%s:%s:%s", (if hour < 10 then "0" else "") .. hour, (if min < 10 then "0" else "") .. min, (if sec < 10 then "0" else "") .. sec)
end