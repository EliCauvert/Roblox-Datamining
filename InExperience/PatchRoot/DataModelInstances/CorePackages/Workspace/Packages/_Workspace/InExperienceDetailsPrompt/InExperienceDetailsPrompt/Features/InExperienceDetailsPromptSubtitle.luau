local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local _ = require(parent.DataHydration)
local verifiedBadgesModule = require(parent.VerifiedBadges)
local text = require(parent.Foundation).Text

return function(p1)
	-- upvalues: reactModule (ref), verifiedBadgesModule (ref), text (ref)
	return if p1.creator.hasVerifiedBadge then reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
		emoji = verifiedBadgesModule.emoji.verified,
		layoutOrder = p1.layoutOrder
	}, {
		CreatorName = reactModule.createElement(text, {
			tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall",
			Text = p1.creator.name
		})
	}) else reactModule.createElement(text, {
		tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall",
		Text = p1.creator.name,
		LayoutOrder = p1.layoutOrder
	})
end