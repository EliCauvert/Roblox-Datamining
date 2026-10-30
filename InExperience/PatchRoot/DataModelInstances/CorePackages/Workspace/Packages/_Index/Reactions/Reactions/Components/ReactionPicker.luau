local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Reactions.Constants)
local ReactionButtonModule = require(Reactions.Components.ReactionButton)
local _ = require(Reactions.Enums.ReactionSize)
local _ = require(Reactions.Enums.ReactionType)
local Radius = FoundationModule.Enums.Radius
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ConstantsModule (copy), Radius (copy), ReactModule (copy), ReactionButtonModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local Reactions = p1.reactions or ConstantsModule.PossibleReactions
	local TestId = p1.testId or "reaction-picker"
	local SelectedReactions = p1.selectedReactions
	local Radius1 = p1.radius or Radius.Circle
	
	return ReactModule.createElement(View, {
		tag = {
			["row gap-xxsmall auto-xy padding-small stroke-standard stroke-default"] = true,
			["radius-small"] = Radius1 == Radius.Small,
			["radius-medium"] = Radius1 == Radius.Medium,
			["radius-circle"] = Radius1 == Radius.Circle
		},
		backgroundStyle = p1.backgroundStyle or UseTokensResult.Color.Surface.Surface_200,
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, (ReactModule.useMemo(function()
		-- upvalues: Reactions (copy), ReactModule (upval), ReactionButtonModule (upval), SelectedReactions (copy), p1 (copy), TestId (copy)
		local Elements = {}
		
		for LayoutOrder, reaction in Reactions do
			Elements[reaction] = ReactModule.createElement(ReactionButtonModule, {
				reactionType = reaction,
				isActive = SelectedReactions ~= nil and SelectedReactions[reaction] == true,
				isHovered = p1.hoveredReaction == reaction,
				reactionSize = p1.reactionSize,
				buttonRef = if p1.getButtonRef then p1.getButtonRef(reaction) else nil,
				onActivated = function(p2)
					-- upvalues: p1 (upval), reaction (copy)
					p1.onReactionSelected(reaction, p2)
				end,
				entryDelay = (LayoutOrder - 1) * 0.04,
				layoutOrder = LayoutOrder,
				testId = `{TestId}--{reaction}`
			})
		end
		return Elements
	end, {
		Reactions, SelectedReactions, p1.hoveredReaction, p1.reactionSize,
		p1.getButtonRef, p1.onReactionSelected, TestId
	})))
end