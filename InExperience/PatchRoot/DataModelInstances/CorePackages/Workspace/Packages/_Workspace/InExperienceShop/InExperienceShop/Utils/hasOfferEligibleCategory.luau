local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)

return function(List): boolean
	-- upvalues: ConstantsModule (copy)
	for _, value in List do
		if value.id ~= ConstantsModule.HOME_CATEGORY_ID and value.name ~= ConstantsModule.ROBUX_CATEGORY_NAME then
			return true
		end
	end
	return false
end