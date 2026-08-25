local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local _ = require(parent.DataHydration)
local verifiedBadgesModule = require(parent.VerifiedBadges)
local text = require(parent.Foundation).Text

return function(p0)
	-- upvalues: reactModule (ref), verifiedBadgesModule (ref), text (ref)
	return if p0.creator.hasVerifiedBadge then reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
		emoji = verifiedBadgesModule.emoji.verified,
		layoutOrder = p0.layoutOrder
	}, {
		CreatorName = reactModule.createElement(text, {
			tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall",
			Text = p0.creator.name
		})
	}) else reactModule.createElement(text, {
		tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall",
		Text = p0.creator.name,
		LayoutOrder = p0.layoutOrder
	})
end