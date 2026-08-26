return {
	convertSecondsToTimeStr = function(p1)
		return string.format("%02d", math.round(p1) // 60 // 60 // 24) .. ":" .. string.format("%02d", math.round(p1) // 60 % 60) .. ":" .. string.format("%02d", math.round(p1) % 60)
	end
}