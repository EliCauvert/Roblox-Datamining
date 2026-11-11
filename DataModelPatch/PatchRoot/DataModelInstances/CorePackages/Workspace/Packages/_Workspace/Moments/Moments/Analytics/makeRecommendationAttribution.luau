local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = require(Parent.MomentsCommon).Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local _ = require(Moments.Components.Feed.FeedTypes)

return function(p1)
	-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy)
	if p1 == nil then
		return nil
	elseif GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
		local FeedItemId = p1.feedItemId
		
		return if FeedItemId == nil or FeedItemId == "" then nil else { itemId = FeedItemId, tracingId = p1.tracingId }
	else
		return if p1.itemId == nil or p1.itemId == "" then nil else { itemId = p1.itemId, tracingId = p1.tracingId }
	end
end