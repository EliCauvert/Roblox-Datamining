local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local _ = require(moments.Components.Feed.FeedTypes)
local momentsEndStateItemModule = require(script.MomentsEndStateItem)

return {
	{
		kind = "endState",
		getKey = function(_)
			return "__feed_end_state__"
		end,
		getAttribution = function(_)
			return nil
		end,
		render = function(_, _)
			-- upvalues: reactModule (ref), momentsEndStateItemModule (ref)
			return reactModule.createElement(momentsEndStateItemModule)
		end
	}
}