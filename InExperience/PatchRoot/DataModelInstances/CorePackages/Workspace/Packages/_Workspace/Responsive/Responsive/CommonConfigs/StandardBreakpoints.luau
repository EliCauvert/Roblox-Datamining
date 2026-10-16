local config = {
	XSmall = "XSmall",
	Small = "Small",
	Medium = "Medium",
	Large = "Large",
	XLarge = "XLarge",
	X2Large = "X2Large",
	Landscape = "Landscape",
	Portrait = "Portrait"
}
local SizesMinMax = {
	[config.XSmall] = {
		minWidth = 320,
		maxWidth = 360,
		Key = config.XSmall,
		size = config.XSmall
	},
	[config.Small] = {
		minWidth = 361,
		maxWidth = 600,
		Key = config.Small,
		size = config.Small
	},
	[config.Medium] = {
		minWidth = 601,
		maxWidth = 1140,
		Key = config.Medium,
		size = config.Medium
	},
	[config.Large] = {
		minWidth = 1141,
		maxWidth = 1520,
		Key = config.Large,
		size = config.Large
	},
	[config.XLarge] = {
		minWidth = 1521,
		maxWidth = 1920,
		Key = config.XLarge,
		size = config.XLarge
	},
	[config.X2Large] = {
		minWidth = 1920,
		maxWidth = 4096,
		Key = config.X2Large,
		size = config.X2Large
	}
}
local Sizes = {
	[config.XSmall] = {
		maxWidth = 360,
		Key = config.XSmall,
		size = config.XSmall
	},
	[config.Small] = { maxWidth = 600, Key = config.Small, size = config.Small },
	[config.Medium] = {
		maxWidth = 1140,
		Key = config.Medium,
		size = config.Medium
	},
	[config.Large] = { maxWidth = 1520, Key = config.Large, size = config.Large },
	[config.XLarge] = {
		maxWidth = 1920,
		Key = config.XLarge,
		size = config.XLarge
	},
	[config.X2Large] = {
		maxWidth = 4096,
		Key = config.X2Large,
		size = config.X2Large
	}
}
local SizesMinMaxY = {
	[config.XSmall] = {
		minHeight = 320,
		maxHeight = 360,
		Key = config.XSmall,
		size = config.XSmall
	},
	[config.Small] = {
		minHeight = 361,
		maxHeight = 600,
		Key = config.Small,
		size = config.Small
	},
	[config.Medium] = {
		minHeight = 601,
		maxHeight = 1140,
		Key = config.Medium,
		size = config.Medium
	},
	[config.Large] = {
		minHeight = 1141,
		maxHeight = 1520,
		Key = config.Large,
		size = config.Large
	},
	[config.XLarge] = {
		minHeight = 1521,
		maxHeight = 1920,
		Key = config.XLarge,
		size = config.XLarge
	},
	[config.X2Large] = {
		minHeight = 1920,
		maxHeight = 4096,
		Key = config.X2Large,
		size = config.X2Large
	}
}
local SizesY = {
	[config.XSmall] = {
		maxHeight = 360,
		Key = config.XSmall,
		size = config.XSmall
	},
	[config.Small] = { maxHeight = 600, Key = config.Small, size = config.Small },
	[config.Medium] = {
		maxHeight = 1140,
		Key = config.Medium,
		size = config.Medium
	},
	[config.Large] = {
		maxHeight = 1520,
		Key = config.Large,
		size = config.Large
	},
	[config.XLarge] = {
		maxHeight = 1920,
		Key = config.XLarge,
		size = config.XLarge
	},
	[config.X2Large] = {
		maxHeight = 4096,
		Key = config.X2Large,
		size = config.X2Large
	}
}
local Orientation = {
	{ minRatio = 1, Key = config.Landscape },
	{ minRatio = 0, Key = config.Portrait }
}
local Default = {
	Sizes[config.XSmall], Sizes[config.Small], Sizes[config.Medium],
	Sizes[config.Large], Sizes[config.XLarge], Sizes[config.X2Large]
}
local list = {
	SizesY[config.XSmall], SizesY[config.Small], SizesY[config.Medium],
	SizesY[config.Large], SizesY[config.XLarge], SizesY[config.X2Large]
}
local KeyIndex = {}

for i, value in Default do
	KeyIndex[value.Key] = i
end
return {
	Enum = config,
	sizes = Sizes,
	sizesMinMax = SizesMinMax,
	sizesY = SizesY,
	sizesMinMaxY = SizesMinMaxY,
	rules = { default = Default, Y = list, Orientation = Orientation },
	keyIndex = KeyIndex,
	getMinWidthFor = function(p1) --[[ Line: 86 ]]
		-- upvalues: SizesMinMax (copy)
		local SizesMinMaxEntry = SizesMinMax[p1]
		
		return if SizesMinMaxEntry == nil then 0 else SizesMinMaxEntry.minWidth
	end,
	getMinHeightFor = function(p1) --[[ Line: 93 ]]
		-- upvalues: SizesMinMaxY (copy)
		local SizesMinMaxYEntry = SizesMinMaxY[p1]
		
		return if SizesMinMaxYEntry == nil then 0 else SizesMinMaxYEntry.minHeight
	end
}