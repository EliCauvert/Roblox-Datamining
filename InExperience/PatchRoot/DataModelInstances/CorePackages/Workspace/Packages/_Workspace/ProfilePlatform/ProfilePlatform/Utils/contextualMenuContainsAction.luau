local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Components.CTARow.Types)
local _ = require(profilePlatform.Common.Enums)

return function(p1, p2)
	if not p1 then
		return false
	end
	for i, v in p1 do
		for i_1, v_1 in v.items do
			if v_1.id == p2 then
				return true
			end
		end
	end
	return false
end