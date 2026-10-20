local GuiService = game:GetService("GuiService")
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
local MomentsUpdateReactionIllustrationQuality = game:DefineFastFlag("MomentsUpdateReactionIllustrationQuality", false)

local function _(p1: number): string
	return if p1 > 2.5 then "@3x" elseif p1 > 1.5 then "@2x" else ""
end

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
	getStaticImageUri = function(p1, p2, p3): string?
		-- upvalues: config (copy), config1 (copy), MomentsUpdateReactionIllustrationQuality (copy), GuiService (copy)
		local Entry = config[p1]
		local Entry1 = config1[p2]
		
		if Entry == nil or Entry1 == nil then
			return nil
		end
		local v1 = nil
		if MomentsUpdateReactionIllustrationQuality then
			local P6 = p3 or GuiService:GetResolutionScale()
			v1 = if P6 > 2.5 then "@3x" elseif P6 > 1.5 then "@2x" else ""
		else
			v1 = ""
		end
		return `rbxasset://textures/ui/Moments/Reactions/{Entry}-{Entry1}{v1}.png`
	end,
	getStickerImageUri = function(p1)
		-- upvalues: config (copy)
		local Entry = config[p1]
		
		return if Entry == nil then nil else `rbxasset://textures/ui/Moments/Reactions/{Entry}-large@3x.png`
	end
}