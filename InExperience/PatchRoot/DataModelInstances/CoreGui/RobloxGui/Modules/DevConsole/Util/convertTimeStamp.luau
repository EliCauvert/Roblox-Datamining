local DevConsoleFixTimestampDST = game:DefineFastFlag("DevConsoleFixTimestampDST", false)

local function _(Text: number): string --[[ Line: 4 | Named "numberWithZero" ]]
	return (if Text < 10 then "0" else "") .. Text
end

return function(p1): string --[[ Line: 8 | Named "convertTimeStamp" ]]
	-- upvalues: DevConsoleFixTimestampDST (copy)
	local Hour = nil
	local Min = nil
	local Sec = nil
	if DevConsoleFixTimestampDST then
		local DateInfo = os.date("*t", p1)
		Hour = DateInfo.hour
		Min = DateInfo.min
		Sec = DateInfo.sec
	else
		local FlooredRemainder = math.floor(p1 - os.time() + tick()) % 86400
		Hour = math.floor(FlooredRemainder / 3600)
		local FlooredRemainderDelta = FlooredRemainder - Hour * 3600
		Min = math.floor(FlooredRemainderDelta / 60)
		Sec = FlooredRemainderDelta - Min * 60
	end
	return string.format("%s:%s:%s", (if Hour < 10 then "0" else "") .. Hour, (if Min < 10 then "0" else "") .. Min, (if Sec < 10 then "0" else "") .. Sec)
end