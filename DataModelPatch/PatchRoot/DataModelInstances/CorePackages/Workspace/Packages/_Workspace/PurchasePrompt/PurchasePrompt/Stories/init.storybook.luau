local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent

return {
	name = PurchasePrompt.Name,
	roact = require(Parent.React),
	reactRoblox = require(Parent.ReactRoblox),
	storyRoots = { PurchasePrompt },
	mapStory = require(PurchasePrompt.Stories.StoryMiddleware)
}