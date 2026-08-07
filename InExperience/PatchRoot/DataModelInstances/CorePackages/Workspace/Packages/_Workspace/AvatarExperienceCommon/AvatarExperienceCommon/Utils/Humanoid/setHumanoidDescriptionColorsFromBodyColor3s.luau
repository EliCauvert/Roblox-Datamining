local BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION (ref)
	if p1 then
		for i, v in p1 do
			p0[BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[i]] = v
		end
	end
end