local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentsEndStateItemModule = require(script.MomentsEndStateItem)

return {
	{
		kind = "endState",
		getKey = function(_): string
			return "__feed_end_state__"
		end,
		getAttribution = function(_)
			return nil
		end,
		render = function(_, _)
			-- upvalues: ReactModule (copy), MomentsEndStateItemModule (copy)
			return ReactModule.createElement(MomentsEndStateItemModule)
		end
	}
}