local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(Reactions.Constants)
local ReactionSizeModule = require(Reactions.Enums.ReactionSize)
local _ = require(Reactions.Enums.ReactionType)
local Image = require(Parent.Foundation).Image
local config = {
	[ReactionSizeModule.XSmall] = "size-500-500",
	[ReactionSizeModule.Small] = "size-600-600",
	[ReactionSizeModule.Medium] = "size-800-800",
	[ReactionSizeModule.Large] = "size-1200-1200"
}
local Entry = config[ReactionSizeModule.Medium]

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ConstantsModule (copy), config (copy), Entry (copy), ReactModule (copy), Image (copy)
	return ReactModule.createElement(Image, {
		Image = if typeof(Frame.reactionType) == "string" then ConstantsModule.ReactionIconMappings[Frame.reactionType] else Frame.reactionType:map(function(p1)
			-- upvalues: ConstantsModule (upval)
			return ConstantsModule.ReactionIconMappings[p1] or ""
		end),
		tag = if Frame.Size then nil else Frame.size and config[Frame.size] or Entry,
		Size = Frame.Size,
		imageStyle = Frame.imageStyle,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		Rotation = Frame.Rotation,
		scale = Frame.scale,
		AnchorPoint = Frame.AnchorPoint,
		ZIndex = Frame.ZIndex,
		testId = Frame.testId
	})
end)