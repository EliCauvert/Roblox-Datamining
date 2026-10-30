local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local CaughtUpItemModule = require(script.CaughtUpItem)

return {
	{
		kind = "caughtUp",
		getKey = function(_): string
			return "__feed_caught_up__"
		end,
		getAttribution = function(_)
			return nil
		end,
		render = function(_, _)
			-- upvalues: ReactModule (copy), CaughtUpItemModule (copy)
			return ReactModule.createElement(CaughtUpItemModule)
		end
	}
}