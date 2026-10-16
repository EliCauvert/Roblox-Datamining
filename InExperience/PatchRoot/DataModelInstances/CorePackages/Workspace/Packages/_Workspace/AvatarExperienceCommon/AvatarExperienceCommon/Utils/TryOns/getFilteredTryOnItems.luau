local _ = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceModel)
local GetTryOnItemComparisonDataModule = require(script.Parent.getTryOnItemComparisonData)
local GetShouldReplaceTryOnModule = require(script.Parent.getShouldReplaceTryOn)

function getFilteredTryOnItems(List, p1) --[[ Line: 8 ]]
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