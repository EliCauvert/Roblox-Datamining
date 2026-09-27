local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local _ = require(script.Parent.Parent.CommentRowTypes)
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize

return reactModule.memo(function(p1)
	-- upvalues: reactionSize (ref), reactModule (ref), reaction (ref), foundationModule (ref)
	local rowLayout = p1.rowLayout
	local ceiled = math.ceil(rowLayout.metadataTypography.fontSize * rowLayout.metadataTypography.lineHeight)
	local t = {}
	
	for i = 1, #p1.reactionTypes do
		local var1 = p1.reactionTypes[i]
		t[var1] = reactModule.createElement(reaction, {
			reactionType = var1,
			size = reactionSize.XSmall,
			LayoutOrder = i,
			testId = `moments-comment-reaction-summary-{p1.commentId}-{var1}`
		})
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-small",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		testId = `moments-comment-reaction-summary-{p1.commentId}`
	}, {
		Emojis = if #p1.reactionTypes > 0 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xxsmall auto-xy"
		}, t) else nil,
		Label = reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 2,
			tag = "auto-x content-default",
			Size = UDim2.fromOffset(0, ceiled),
			Text = p1.label,
			TextXAlignment = Enum.TextXAlignment.Left,
			fontStyle = {
				Font = rowLayout.metadataTypography.font,
				FontSize = rowLayout.metadataTypography.fontSize,
				LineHeight = rowLayout.metadataTypography.lineHeight
			},
			testId = `moments-comment-reaction-summary-label-{p1.commentId}`
		})
	})
end)