local config = {
	[1] = Color3.fromRGB(245, 190, 240),
	[2] = Color3.fromRGB(192, 206, 251),
	[3] = Color3.fromRGB(145, 223, 188),
	[4] = Color3.fromRGB(63, 64, 70),
	[5] = Color3.fromRGB(250, 212, 106)
}

return function(p1: number)
	-- upvalues: config (copy)
	return config[p1 % #config + 1]
end