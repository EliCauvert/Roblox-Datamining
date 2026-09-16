local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local fFlagIdentifyTopPicksByCategoryTypeModule = require(inExperienceShop.Flags.FFlagIdentifyTopPicksByCategoryType)

return function(p1)
	-- upvalues: fFlagIdentifyTopPicksByCategoryTypeModule (ref), constantsModule (ref)
	for i, v in p1 do
		if fFlagIdentifyTopPicksByCategoryTypeModule then
			if v.categoryType ~= constantsModule.TOP_PICKS_CATEGORY_TYPE then
				if v.categoryType == nil then
					if string.lower(v.name) == "top picks" then
						return i
					end
				end
			end
			return i
		end
	end
	return nil
end