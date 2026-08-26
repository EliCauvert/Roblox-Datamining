local fFlagSduiSupportRatingNoPercent = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagSduiSupportRatingNoPercent
local _ = require(script.Parent.VotesStoreTypes)

return {
	calculateRating = function(p1, p2)
		local var1 = p1 + p2
		
		return if var1 == 0 then 0 else math.floor(p1 / var1 * 100)
	end,
	getRatingDisplayText = function(p1, p2)
		-- upvalues: fFlagSduiSupportRatingNoPercent (ref)
		return if p1 then if (p1.upVotes or 0) + (p1.downVotes or 0) <= 0 or not p1.rating then "--" elseif fFlagSduiSupportRatingNoPercent and p2 then tostring(p1.rating) else tostring(p1.rating) .. "%" else "--"
	end
}