local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactionSizeModule = require(MomentsCommon.Enums.ReactionSize)
local ReactionTypeModule = require(MomentsCommon.Enums.ReactionType)
local config = {
	[ReactionTypeModule.ThumbsUp] = "thumbs-up",
	[ReactionTypeModule.Heart] = "heart",
	[ReactionTypeModule.LaughJoy] = "laugh-joy",
	[ReactionTypeModule.Wow] = "wow",
	[ReactionTypeModule.Cry] = "crying",
	[ReactionTypeModule.Fire] = "fire",
	[ReactionTypeModule.Skull] = "skull"
}
local config1 = {
	[ReactionSizeModule.XSmall] = "xsmall",
	[ReactionSizeModule.Small] = "small",
	[ReactionSizeModule.Medium] = "medium",
	[ReactionSizeModule.Large] = "large"
}
local config2 = {
	[ReactionSizeModule.XSmall] = 20,
	[ReactionSizeModule.Small] = 24,
	[ReactionSizeModule.Medium] = 32,
	[ReactionSizeModule.Large] = 48
}

return {
	getAssetKey = function(p1)
		-- upvalues: config (copy)
		return config[p1]
	end,
	getAnimatedImageUri = function(p1): string
		return `rbxasset://textures/ui/Moments/Reactions/Animated/{p1}.png`
	end,
	getSizeKey = function(p1)
		-- upvalues: config1 (copy)
		return config1[p1]
	end,
	getSizePixels = function(p1)
		-- upvalues: config2 (copy)
		return config2[p1]
	end,
	getStaticImageUri = function(p1, p2)
		-- upvalues: config (copy), config1 (copy)
		local Entry = config[p1]
		local Entry1 = config1[p2]
		
		return if Entry == nil or Entry1 == nil then nil else `rbxasset://textures/ui/Moments/Reactions/{Entry}-{Entry1}.png`
	end
}