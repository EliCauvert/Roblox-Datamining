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
	getAssetKey = function(value)
		-- upvalues: t (ref)
		return t[value]
	end,
	getAnimatedImageUri = function(p1)
		return `rbxasset://textures/ui/Moments/Reactions/Animated/{p1}.png`
	end,
	getSizeKey = function(p1)
		-- upvalues: t_1 (ref)
		return t_1[p1]
	end,
	getSizePixels = function(p1)
		-- upvalues: t_2 (ref)
		return t_2[p1]
	end,
	getStaticImageUri = function(p1, p2)
		-- upvalues: t (ref), t_1 (ref)
		local var1 = t[p1]
		local var2 = t_1[p2]
		
		return if var1 == nil or var2 == nil then nil else `rbxasset://textures/ui/Moments/Reactions/{var1}-{var2}.png`
	end,
	getStickerImageUri = function(p1)
		-- upvalues: t (ref)
		local var1 = t[p1]
		
		return if var1 == nil then nil else `rbxasset://textures/ui/Moments/Reactions/{var1}-large@3x.png`
	end
}