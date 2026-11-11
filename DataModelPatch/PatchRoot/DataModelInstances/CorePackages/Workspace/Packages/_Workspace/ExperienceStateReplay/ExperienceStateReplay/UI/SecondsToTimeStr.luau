return {
	convertSecondsToTimeStr = function(Value: number): string
		return string.format("%02d", math.round(Value) // 60 // 60 // 24) .. ":" .. string.format("%02d", math.round(Value) // 60 % 60) .. ":" .. string.format("%02d", math.round(Value) % 60)
	end
}