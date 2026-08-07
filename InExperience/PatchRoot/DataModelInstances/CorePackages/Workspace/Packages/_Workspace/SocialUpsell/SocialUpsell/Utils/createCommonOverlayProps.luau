local cryoModule = require(script:FindFirstAncestor("SocialUpsell").Parent.Cryo)
local t = {}

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: cryoModule (ref), t (ref)
	return cryoModule.Dictionary.join(p0 or t, { isInExperience = if p1 then p1.isInExperience else false })
end