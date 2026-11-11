local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(AvatarExperienceCatalog.Parent.AvatarExperienceCommon)
local GetTryOnItemComparisonDataModule = require(AvatarExperienceCatalog.Utils.TryOns.getTryOnItemComparisonData)
local GetShouldReplaceTryOnModule = require(AvatarExperienceCatalog.Utils.TryOns.getShouldReplaceTryOn)

function getFilteredTryOnItems(List, p1)
	-- upvalues: GetTryOnItemComparisonDataModule (copy), GetShouldReplaceTryOnModule (copy)
	local t = {}
	local t1 = {}
	local TryOnItemComparisonDataModule = GetTryOnItemComparisonDataModule(p1)
	
	for i, value in List do
		if GetShouldReplaceTryOnModule(TryOnItemComparisonDataModule, (GetTryOnItemComparisonDataModule(value))) then
			t1[i] = value
		else
			t[i] = value
		end
	end
	return t, t1
end

return getFilteredTryOnItems