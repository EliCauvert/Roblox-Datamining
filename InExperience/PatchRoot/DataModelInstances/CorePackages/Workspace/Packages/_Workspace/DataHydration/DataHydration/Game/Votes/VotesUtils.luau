local FFlagSduiSupportRatingNoPercent = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagSduiSupportRatingNoPercent
local _ = require(script.Parent.VotesStoreTypes)

return {
	calculateRating = function(p1, p2): number --[[ Line: 15 ]]
		local v1 = p1 + p2
		
		return if v1 == 0 then 0 else math.floor(p1 / v1 * 100)
	end,
	getRatingDisplayText = function(p1, p2): string --[[ Line: 29 ]]
		-- upvalues: FFlagSduiSupportRatingNoPercent (copy)
		return if p1 then if (p1.upVotes or 0) + (p1.downVotes or 0) <= 0 or not p1.rating then "--" elseif FFlagSduiSupportRatingNoPercent and p2 then tostring(p1.rating) else tostring(p1.rating) .. "%" else "--"
	end
}