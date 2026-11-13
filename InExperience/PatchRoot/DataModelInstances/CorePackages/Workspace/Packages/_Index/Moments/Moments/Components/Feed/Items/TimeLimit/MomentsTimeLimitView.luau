local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FeedMessageViewModule = require(Moments.Components.Feed.FeedMessageView)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FeedMessageViewModule (copy), BuilderIconsModule (copy)
	return ReactModule.createElement(FeedMessageViewModule, {
		tilted = true,
		frameRadiusTag = "radius-small",
		testId = "moments-time-limit",
		iconName = BuilderIconsModule.Icon.LockClosed,
		iconSize = UseTokensFunction().Size.Size_1600,
		title = p1.title,
		description = p1.description
	})
end