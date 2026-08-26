local BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION

return function(p1, p2)
	-- upvalues: BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION (ref)
	if p2 then
		for i, v in p2 do
			p1[BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[i]] = v
		end
	end
end