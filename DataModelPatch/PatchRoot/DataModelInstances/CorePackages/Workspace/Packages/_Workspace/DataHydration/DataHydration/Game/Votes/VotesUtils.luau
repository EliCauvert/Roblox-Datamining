local _ = require(script.Parent.VotesStoreTypes)

return {
	calculateRating = function(p1, p2): number
		local v1 = p1 + p2
		
		return if v1 == 0 then 0 else math.floor(p1 / v1 * 100)
	end,
	getRatingDisplayText = function(p1): string
		return if p1 then if (p1.upVotes or 0) + (p1.downVotes or 0) <= 0 or not p1.rating then "--" else tostring(p1.rating) .. "%" else "--"
	end
}