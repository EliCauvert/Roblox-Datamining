local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Reactions.Constants)
local ReactionSizeModule = require(Reactions.Enums.ReactionSize)
local _ = require(Reactions.Enums.ReactionType)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1, Large)
	-- upvalues: ReactionSizeModule (copy)
	return if Large == ReactionSizeModule.XSmall then p1.Size.Size_500 elseif Large == ReactionSizeModule.Small then p1.Size.Size_600 elseif Large == ReactionSizeModule.Large then p1.Size.Size_1200 else p1.Size.Size_800
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), ConstantsModule (copy), ReactionSizeModule (copy), ReactModule (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local Size = Frame.size
	local Size500 = if Size == ReactionSizeModule.XSmall then UseTokensResult.Size.Size_500 elseif Size == ReactionSizeModule.Small then UseTokensResult.Size.Size_600 elseif Size == ReactionSizeModule.Large then UseTokensResult.Size.Size_1200 else UseTokensResult.Size.Size_800
	
	return ReactModule.createElement(Image, {
		Image = if typeof(Frame.reactionType) == "string" then ConstantsModule.ReactionIconMappings[Frame.reactionType] else Frame.reactionType:map(function(p1)
			-- upvalues: ConstantsModule (upval)
			return ConstantsModule.ReactionIconMappings[p1] or ""
		end),
		Size = Frame.Size or UDim2.fromOffset(Size500, Size500),
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