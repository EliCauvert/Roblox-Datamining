local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Components.CTARow.Types)
local _ = require(ProfilePlatform.Common.Enums)

return function(List, Id): boolean --[[ Line: 5 | Named "contextualMenuContainsAction" ]]
	if not List then
		return false
	end
	for _, value in List do
		for _, item in value.items do
			if item.id == Id then
				return true
			end
		end
	end
	return false
end