local cryoModule = require(script:FindFirstAncestor("SocialUpsell").Parent.Cryo)
local t = {}

return function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref)
	return cryoModule.Dictionary.join(p1 or t, { isInExperience = if p2 then p2.isInExperience else false })
end