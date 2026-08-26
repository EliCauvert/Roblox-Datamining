local t = {
	XSmall = "XSmall",
	Small = "Small",
	Medium = "Medium",
	Large = "Large",
	XLarge = "XLarge",
	X2Large = "X2Large",
	Landscape = "Landscape",
	Portrait = "Portrait"
}
local t_1 = {
	[t.XSmall] = {
		minWidth = 320,
		maxWidth = 360,
		Key = t.XSmall,
		size = t.XSmall
	},
	[t.Small] = {
		minWidth = 361,
		maxWidth = 600,
		Key = t.Small,
		size = t.Small
	},
	[t.Medium] = {
		minWidth = 601,
		maxWidth = 1140,
		Key = t.Medium,
		size = t.Medium
	},
	[t.Large] = {
		minWidth = 1141,
		maxWidth = 1520,
		Key = t.Large,
		size = t.Large
	},
	[t.XLarge] = {
		minWidth = 1521,
		maxWidth = 1920,
		Key = t.XLarge,
		size = t.XLarge
	},
	[t.X2Large] = {
		minWidth = 1920,
		maxWidth = 4096,
		Key = t.X2Large,
		size = t.X2Large
	}
}
local t_2 = {
	[t.XSmall] = { maxWidth = 360, Key = t.XSmall, size = t.XSmall },
	[t.Small] = { maxWidth = 600, Key = t.Small, size = t.Small },
	[t.Medium] = { maxWidth = 1140, Key = t.Medium, size = t.Medium },
	[t.Large] = { maxWidth = 1520, Key = t.Large, size = t.Large },
	[t.XLarge] = { maxWidth = 1920, Key = t.XLarge, size = t.XLarge },
	[t.X2Large] = { maxWidth = 4096, Key = t.X2Large, size = t.X2Large }
}
local t_3 = {
	[t.XSmall] = {
		minHeight = 320,
		maxHeight = 360,
		Key = t.XSmall,
		size = t.XSmall
	},
	[t.Small] = {
		minHeight = 361,
		maxHeight = 600,
		Key = t.Small,
		size = t.Small
	},
	[t.Medium] = {
		minHeight = 601,
		maxHeight = 1140,
		Key = t.Medium,
		size = t.Medium
	},
	[t.Large] = {
		minHeight = 1141,
		maxHeight = 1520,
		Key = t.Large,
		size = t.Large
	},
	[t.XLarge] = {
		minHeight = 1521,
		maxHeight = 1920,
		Key = t.XLarge,
		size = t.XLarge
	},
	[t.X2Large] = {
		minHeight = 1920,
		maxHeight = 4096,
		Key = t.X2Large,
		size = t.X2Large
	}
}
local t_4 = {
	[t.XSmall] = { maxHeight = 360, Key = t.XSmall, size = t.XSmall },
	[t.Small] = { maxHeight = 600, Key = t.Small, size = t.Small },
	[t.Medium] = { maxHeight = 1140, Key = t.Medium, size = t.Medium },
	[t.Large] = { maxHeight = 1520, Key = t.Large, size = t.Large },
	[t.XLarge] = { maxHeight = 1920, Key = t.XLarge, size = t.XLarge },
	[t.X2Large] = { maxHeight = 4096, Key = t.X2Large, size = t.X2Large }
}
local list = {
	{ minRatio = 1, Key = t.Landscape },
	{ minRatio = 0, Key = t.Portrait }
}
local list_1 = {
	t_2[t.XSmall], t_2[t.Small], t_2[t.Medium], t_2[t.Large], t_2[t.XLarge],
	t_2[t.X2Large]
}
local list_2 = {
	t_4[t.XSmall], t_4[t.Small], t_4[t.Medium], t_4[t.Large], t_4[t.XLarge],
	t_4[t.X2Large]
}
local t_5 = {}

for i, v in list_1 do
	t_5[v.Key] = i
end
return {
	Enum = t,
	sizes = t_2,
	sizesMinMax = t_1,
	sizesY = t_4,
	sizesMinMaxY = t_3,
	rules = { default = list_1, Y = list_2, Orientation = list },
	keyIndex = t_5,
	getMinWidthFor = function(a)
		-- upvalues: t_1 (ref)
		local var1 = t_1[a]
		
		return if var1 == nil then 0 else var1.minWidth
	end,
	getMinHeightFor = function(a)
		-- upvalues: t_3 (ref)
		local var1 = t_3[a]
		
		return if var1 == nil then 0 else var1.minHeight
	end
}