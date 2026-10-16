local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentUnavailableItemModule = require(script.MomentUnavailableItem)

return {
	{
		kind = "unavailableMoment",
		getKey = function(p1): string --[[ Line: 27 ]]
			return "__unavailable_moment__:" .. p1.targetId
		end,
		getAttribution = function(_) --[[ Line: 31 ]]
			return nil
		end,
		render = function(p1, _) --[[ Line: 35 ]]
			-- upvalues: ReactModule (copy), MomentUnavailableItemModule (copy)
			return ReactModule.createElement(MomentUnavailableItemModule, { isModerated = p1.isModerated })
		end
	}
}