local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local _ = require(moments.Components.Feed.FeedTypes)

return function(p1, p2)
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		return p2.getPendingUserMoments(p3)[p1] or {}
	end)
end