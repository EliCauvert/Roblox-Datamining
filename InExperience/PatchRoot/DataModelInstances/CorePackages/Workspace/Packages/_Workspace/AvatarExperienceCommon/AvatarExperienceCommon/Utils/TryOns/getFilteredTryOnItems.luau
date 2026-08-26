local _ = require(script:FindFirstAncestor("AvatarExperienceCommon").Enums.ItemTypeEnum)
local getTryOnItemComparisonDataModule = require(script.Parent.getTryOnItemComparisonData)
local getShouldReplaceTryOnModule = require(script.Parent.getShouldReplaceTryOn)

function getFilteredTryOnItems(p1, p2)
	-- upvalues: getTryOnItemComparisonDataModule (ref), getShouldReplaceTryOnModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = getTryOnItemComparisonDataModule(p2)
	
	for i, v in p1 do
		if getShouldReplaceTryOnModule(var1, getTryOnItemComparisonDataModule(v)) then
			t_1[i] = v
		else
			t[i] = v
		end
	end
	return t, t_1
end

return getFilteredTryOnItems