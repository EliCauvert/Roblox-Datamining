local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentsEndStateItemModule = require(script.MomentsEndStateItem)

return {
	{
		kind = "endState",
		getKey = function(_): string --[[ Line: 29 ]]
			return "__feed_end_state__"
		end,
		getAttribution = function(_) --[[ Line: 34 ]]
			return nil
		end,
		render = function(_, _) --[[ Line: 38 ]]
			-- upvalues: ReactModule (copy), MomentsEndStateItemModule (copy)
			return ReactModule.createElement(MomentsEndStateItemModule)
		end
	}
}