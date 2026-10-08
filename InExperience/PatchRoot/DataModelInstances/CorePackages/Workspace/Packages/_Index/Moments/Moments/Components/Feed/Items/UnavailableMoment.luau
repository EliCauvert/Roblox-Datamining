local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local _ = require(moments.Components.Feed.FeedTypes)
local momentUnavailableItemModule = require(script.MomentUnavailableItem)

return {
	{
		kind = "unavailableMoment",
		getKey = function(p1)
			return "__unavailable_moment__:" .. p0.targetId
		end,
		getAttribution = function(_)
			return nil
		end,
		render = function(p1, _)
			-- upvalues: reactModule (ref), momentUnavailableItemModule (ref)
			return reactModule.createElement(momentUnavailableItemModule, { isModerated = p1.isModerated })
		end
	}
}