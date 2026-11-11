local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local config = {
	RawBodyColorRanges = {
		{
			Color3.fromRGB(255, 0, 0),
			Color3.fromRGB(255, 50, 50),
			Color3.fromRGB(255, 100, 100)
		},
		{
			Color3.fromRGB(0, 255, 0),
			Color3.fromRGB(50, 255, 50),
			Color3.fromRGB(100, 255, 100)
		},
		{
			Color3.fromRGB(0, 0, 255),
			Color3.fromRGB(50, 50, 255),
			Color3.fromRGB(100, 100, 255)
		},
		{
			Color3.fromHex("0f0f0f"),
			Color3.fromHex("888888"),
			Color3.fromHex("e0e0e0")
		}
	}
}
config.DefaultBodyColorRanges = require(Modules.AvatarExperience.AvatarEditor.Reducers.DefaultBodyColorRanges)(nil, require(Modules.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges)(config.RawBodyColorRanges))
config.ExpectedColorData = {
	range_red_100 = {
		sliderValue = 1,
		rangeId = "ff0000",
		color3 = Color3.fromRGB(255, 100, 100)
	},
	range_red_050 = {
		sliderValue = 0.5,
		rangeId = "ff0000",
		color3 = Color3.fromRGB(255, 50, 50)
	},
	range_red_025 = {
		sliderValue = 0.25,
		rangeId = "ff0000",
		color3 = Color3.fromRGB(255, 25, 25)
	},
	range_green_050 = {
		sliderValue = 0.5,
		rangeId = "00ff00",
		color3 = Color3.fromRGB(50, 255, 50)
	},
	range_green_075 = {
		sliderValue = 0.75,
		rangeId = "00ff00",
		color3 = Color3.fromRGB(75, 255, 75)
	},
	range_blue_000 = {
		sliderValue = 0,
		rangeId = "0000ff",
		color3 = Color3.fromRGB(0, 0, 255)
	},
	range_white = {
		rangeId = "0f0f0f",
		sliderValue = 1,
		color3 = Color3.fromRGB(255, 255, 255)
	},
	range_black = {
		rangeId = "0f0f0f",
		sliderValue = 0,
		color3 = Color3.fromRGB(0, 0, 0)
	}
}
config.VariedBodyColorDatas = {
	headColor3 = config.ExpectedColorData.range_red_100,
	torsoColor3 = config.ExpectedColorData.range_green_075,
	rightLegColor3 = config.ExpectedColorData.range_blue_000,
	leftLegColor3 = config.ExpectedColorData.range_red_025,
	rightArmColor3 = config.ExpectedColorData.range_white,
	leftArmColor3 = config.ExpectedColorData.range_black
}
config.VariedBodyColor3s = {}

for i, variedBodyColorData in config.VariedBodyColorDatas do
	config.VariedBodyColor3s[i] = variedBodyColorData.color3
end
function config.makeBodyColor3s(p1)
	-- upvalues: ConstantsModule (copy)
	local Colors = {}
	
	for _, allBodyPartForSkinColoringId in ConstantsModule.allBodyPartForSkinColoringIds do
		Colors[allBodyPartForSkinColoringId] = p1.color3
	end
	return Colors
end

function config.makeBodyPartRangeIds(p2)
	-- upvalues: ConstantsModule (copy)
	local RangeIds = {}
	
	for _, allBodyPartForSkinColoringId in ConstantsModule.allBodyPartForSkinColoringIds do
		RangeIds[allBodyPartForSkinColoringId] = p2.rangeId
	end
	return RangeIds
end

function config.makeRangeIdToBodyPartsToSliderAndColor3Values(p3)
	-- upvalues: ConstantsModule (copy)
	local t = {}
	
	for _, allBodyPartForSkinColoringId in ConstantsModule.allBodyPartForSkinColoringIds do
		local RangeId = p3.rangeId
		local Entry = t[RangeId] or {}
		Entry[allBodyPartForSkinColoringId] = { sliderValue = p3.sliderValue, color3 = p3.color3 }
		t[RangeId] = Entry
	end
	return t
end

return config