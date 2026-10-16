local BODYPARTFORSKINCOLORINGIDTOHUMANOIDDESCRIPTION = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION

return function(p1, List) --[[ Line: 6 ]]
	-- upvalues: BODYPARTFORSKINCOLORINGIDTOHUMANOIDDESCRIPTION (copy)
	if List then
		for i, value in List do
			p1[BODYPARTFORSKINCOLORINGIDTOHUMANOIDDESCRIPTION[i]] = value
		end
	end
end