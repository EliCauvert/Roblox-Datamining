local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)

return function(p1)
	-- upvalues: constantsModule (ref)
	for i, v in p1 do
		if v.id ~= constantsModule.HOME_CATEGORY_ID and v.name ~= constantsModule.ROBUX_CATEGORY_NAME then
			return true
		end
	end
	return false
end