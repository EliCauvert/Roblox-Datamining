local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local fFlagMomentsCommentsUseMockNetwork = require(dataHydration.Parent.SharedFlags).FFlagMomentsCommentsUseMockNetwork
local var1 = if fFlagMomentsCommentsUseMockNetwork then require(script.Parent.createCommentsMockNetwork)() else nil

return function(p1)
	-- upvalues: fFlagMomentsCommentsUseMockNetwork (ref), var1 (ref)
	return if fFlagMomentsCommentsUseMockNetwork then var1 elseif p1 == nil then nil else p1.network
end