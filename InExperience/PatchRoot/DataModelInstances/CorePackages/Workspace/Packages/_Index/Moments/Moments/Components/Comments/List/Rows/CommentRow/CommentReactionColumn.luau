local parent = script:FindFirstAncestor("Moments").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local _ = require(script.Parent.Parent.CommentRowTypes)
local icon = foundationModule.Icon
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local reactionType = momentsCommonModule.Enums.ReactionType

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), reaction (ref), reactionType (ref), reactionSize (ref), icon (ref), builderIconsModule (ref), iconSize (ref)
	local var1 = useTokens()
	local rowLayout = p1.rowLayout
	local commentId = `moments-comment-reaction-button-{p1.commentId}`
	local uDim = UDim.new(0, var1.Radius.Circle)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center radius-small",
		Size = UDim2.fromOffset(rowLayout.reactionColumnWidth, rowLayout.reactionButtonSize),
		testId = `moments-comment-reaction-column-{p1.commentId}`,
		onActivated = if p1.isReactionDisabled then nil else p1.onReactionActivated,
		LayoutOrder = p1.LayoutOrder
	}, {
		Button = reactModule.createElement(view, {
			tag = "radius-circle bg-action-utility",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(rowLayout.reactionButtonSize, rowLayout.reactionButtonSize),
			cursor = reactModule.useMemo(function()
				-- upvalues: uDim (ref), var1 (ref)
				return {
					radius = uDim,
					offset = var1.Size.Size_150,
					borderWidth = var1.Stroke.Thicker
				}
			end, { uDim, var1 }),
			isDisabled = p1.isReactionDisabled,
			selection = { Selectable = not p1.isReactionDisabled },
			testId = commentId
		}, {
			Content = reactModule.createElement(view, {
				tag = "size-full",
				GroupTransparency = if p1.isReactionDisabled then 0.5 else nil
			}, {
				Icon = if p1.isReactionSelected then reactModule.createElement(reaction, {
					reactionType = reactionType.ThumbsUp,
					size = reactionSize.Small,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					testId = `{commentId}--image`
				}) else reactModule.createElement(icon, {
					name = builderIconsModule.Icon.ThumbUp,
					size = iconSize.Small,
					style = var1.Color.ActionUtility.Foreground,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					testId = `{commentId}--icon`
				})
			})
		})
	})
end)