local guiService = game:GetService("GuiService")
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
local momentsUpdateReactionIllustrationQuality = game:DefineFastFlag("MomentsUpdateReactionIllustrationQuality", false)

local function _(p1)
	return if p1 > 2.5 then "@3x" elseif p1 > 1.5 then "@2x" else ""
end

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
	getStaticImageUri = function(p1, p2, p3)
		-- upvalues: t (ref), t_1 (ref), momentsUpdateReactionIllustrationQuality (ref), guiService (ref)
		local var1
		local var2 = t[p1]
		local var3 = t_1[p2]
		
		if var2 == nil or var3 == nil then
			return nil
		elseif momentsUpdateReactionIllustrationQuality then
			local var4 = p3 or guiService:GetResolutionScale()
			var1 = if var4 > 2.5 then "@3x" elseif var4 > 1.5 then "@2x" else ""
		else
			var1 = ""
		end
		return `rbxasset://textures/ui/Moments/Reactions/{var2}-{var3}{var1}.png`
	end,
	getStickerImageUri = function(p1)
		-- upvalues: t (ref)
		local var1 = t[p1]
		
		return if var1 == nil then nil else `rbxasset://textures/ui/Moments/Reactions/{var1}-large@3x.png`
	end
}