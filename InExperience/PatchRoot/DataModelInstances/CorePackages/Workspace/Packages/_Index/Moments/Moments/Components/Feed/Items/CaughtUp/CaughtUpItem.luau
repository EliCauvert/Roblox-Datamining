local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local UseFeedFunction = require(Moments.Components.Feed.FeedContext).useFeed
local View = require(Parent.Foundation).View

return function(Frame)
	-- upvalues: UseFeedFunction (copy), ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center size-full padding-xlarge clip bg-surface-0",
		testId = "--moments-feed-caught-up-page",
		LayoutOrder = Frame.LayoutOrder
	}, { Content = UseFeedFunction().caughtUpState })
end