local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactionSizeModule = require(momentsCommon.Enums.ReactionSize)
local reactionTypeModule = require(momentsCommon.Enums.ReactionType)
local t = {
	[reactionTypeModule.ThumbsUp] = "thumbs-up",
	[reactionTypeModule.Heart] = "heart",
	[reactionTypeModule.LaughJoy] = "laugh-joy",
	[reactionTypeModule.Wow] = "wow",
	[reactionTypeModule.Cry] = "crying",
	[reactionTypeModule.Fire] = "fire",
	[reactionTypeModule.Skull] = "skull"
}
local t_1 = {
	[reactionSizeModule.XSmall] = "xsmall",
	[reactionSizeModule.Small] = "small",
	[reactionSizeModule.Medium] = "medium",
	[reactionSizeModule.Large] = "large"
}
local t_2 = {
	[reactionSizeModule.XSmall] = 20,
	[reactionSizeModule.Small] = 24,
	[reactionSizeModule.Medium] = 32,
	[reactionSizeModule.Large] = 48
}

return {
	getAssetKey = function(value) --[[ line: 33 ]]
		-- upvalues: t (ref)
		return t[value]
	end,
	getAnimatedImageUri = function(p0) --[[ line: 56 ]]
		return `rbxasset://textures/ui/Moments/Reactions/Animated/{p0}.png`
	end,
	getSizeKey = function(p1) --[[ line: 37 ]]
		-- upvalues: t_1 (ref)
		return t_1[p1]
	end,
	getSizePixels = function(p2) --[[ line: 41 ]]
		-- upvalues: t_2 (ref)
		return t_2[p2]
	end,
	getStaticImageUri = function(p3, p4) --[[ line: 45 ]]
		-- upvalues: t (ref), t_1 (ref)
		local var6 = t[p3]
		local var7 = t_1[p4]
		
		return if var6 == nil or var7 == nil then nil else `rbxasset://textures/ui/Moments/Reactions/{var6}-{var7}.png`
	end
}