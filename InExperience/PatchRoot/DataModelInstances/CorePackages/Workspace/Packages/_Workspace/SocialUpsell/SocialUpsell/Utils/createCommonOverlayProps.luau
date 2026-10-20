local CryoModule = require(script:FindFirstAncestor("SocialUpsell").Parent.Cryo)
local t = {}

return function(p1, p2)
	-- upvalues: CryoModule (copy), t (copy)
	return CryoModule.Dictionary.join(p1 or t, { isInExperience = if p2 then p2.isInExperience else false })
end