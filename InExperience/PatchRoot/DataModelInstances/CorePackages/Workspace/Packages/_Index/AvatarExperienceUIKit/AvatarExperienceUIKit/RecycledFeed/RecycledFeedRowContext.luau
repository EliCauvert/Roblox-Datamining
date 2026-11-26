local _ = require(script.Parent.RecycledFeedTypes)

return require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React).createContext({
	clearRemovedRows = false,
	rowViews = {},
	itemsByKey = {},
	onRowCommitted = function() end
})