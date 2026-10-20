local ExpChat = script:FindFirstAncestor("ExpChat")

return {
	roact = require(ExpChat.Parent.Roact),
	mapStory = require(script.storyMiddleware),
	storyRoots = { ExpChat }
}