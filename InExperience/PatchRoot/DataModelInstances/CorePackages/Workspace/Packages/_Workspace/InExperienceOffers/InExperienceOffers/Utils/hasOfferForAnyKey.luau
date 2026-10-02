local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local getOffersForKeyModule = require(inExperienceOffers.Utils.getOffersForKey)
local _ = require(inExperienceOffers.Types)

return function(p1, p2)
	-- upvalues: getOffersForKeyModule (ref)
	for i, v in p2 do
		if getOffersForKeyModule(p1, v) ~= nil then
			return true
		end
	end
	return false
end