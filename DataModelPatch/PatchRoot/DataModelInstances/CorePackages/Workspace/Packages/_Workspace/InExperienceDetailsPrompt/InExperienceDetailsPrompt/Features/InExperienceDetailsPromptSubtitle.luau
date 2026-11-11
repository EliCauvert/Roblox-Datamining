local Parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration)
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local Text = require(Parent.Foundation).Text

return function(p1)
	-- upvalues: ReactModule (copy), VerifiedBadgesModule (copy), Text (copy)
	return if p1.creator.hasVerifiedBadge then ReactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
		emoji = VerifiedBadgesModule.emoji.verified,
		layoutOrder = p1.layoutOrder
	}, {
		CreatorName = ReactModule.createElement(Text, {
			tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall",
			Text = p1.creator.name
		})
	}) else ReactModule.createElement(Text, {
		tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall",
		Text = p1.creator.name,
		LayoutOrder = p1.layoutOrder
	})
end