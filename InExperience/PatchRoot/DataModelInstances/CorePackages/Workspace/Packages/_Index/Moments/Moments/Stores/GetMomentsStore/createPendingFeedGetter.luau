local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local _ = require(Moments.Components.Feed.FeedTypes)

return function(p1, p2) --[[ Line: 9 | Named "createPendingFeedGetter" ]]
	-- upvalues: SignalsModule (copy)
	return SignalsModule.createComputed(function(p3) --[[ Line: 13 ]]
		-- upvalues: p2 (copy), p1 (copy)
		return p2.getPendingUserMoments(p3)[p1] or {}
	end)
end