local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local FFlagIdentifyTopPicksByCategoryTypeModule = require(InExperienceShop.Flags.FFlagIdentifyTopPicksByCategoryType)

return function(List)
	-- upvalues: FFlagIdentifyTopPicksByCategoryTypeModule (copy), ConstantsModule (copy)
	for i, value in List do
		if FFlagIdentifyTopPicksByCategoryTypeModule then
			if value.categoryType == ConstantsModule.TOP_PICKS_CATEGORY_TYPE then
				return i
			elseif value.categoryType ~= nil then
				continue
			end
		end
		if string.lower(value.name) == "top picks" then
			return i
		end
	end
	return nil
end