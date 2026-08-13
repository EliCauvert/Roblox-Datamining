local fFlagSduiSupportRatingNoPercent = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagSduiSupportRatingNoPercent
local _ = require(script.Parent.VotesStoreTypes)

return {
	calculateRating = function(p0, p1) --[[ line: 15 ]]
		local var0 = p0 + p1
		
		return if var0 == 0 then 0 else math.floor(p0 / var0 * 100)
	end,
	getRatingDisplayText = function(p2, p3) --[[ line: 29 ]]
		-- upvalues: fFlagSduiSupportRatingNoPercent (ref)
		return if p2 then if (p2.upVotes or 0) + (p2.downVotes or 0) <= 0 or not p2.rating then "--" elseif fFlagSduiSupportRatingNoPercent and p3 then tostring(p2.rating) else tostring(p2.rating) .. "%" else "--"
	end
}