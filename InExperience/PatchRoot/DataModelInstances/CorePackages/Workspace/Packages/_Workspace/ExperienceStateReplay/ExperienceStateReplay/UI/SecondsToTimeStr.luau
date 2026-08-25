return {
	convertSecondsToTimeStr = function(p0)
		return string.format("%02d", math.round(p0) // 60 // 60 // 24) .. ":" .. string.format("%02d", math.round(p0) // 60 % 60) .. ":" .. string.format("%02d", math.round(p0) % 60)
	end
}