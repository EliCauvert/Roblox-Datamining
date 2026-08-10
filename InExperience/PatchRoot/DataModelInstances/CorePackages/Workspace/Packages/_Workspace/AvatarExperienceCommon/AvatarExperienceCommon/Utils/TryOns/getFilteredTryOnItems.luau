local _ = require(script:FindFirstAncestor("AvatarExperienceCommon").Enums.ItemTypeEnum)
local getTryOnItemComparisonDataModule = require(script.Parent.getTryOnItemComparisonData)
local getShouldReplaceTryOnModule = require(script.Parent.getShouldReplaceTryOn)

function getFilteredTryOnItems(p0, p1) --[[ line: 8 ]]
	-- upvalues: getTryOnItemComparisonDataModule (ref), getShouldReplaceTryOnModule (ref)
	local t = {}
	local t_1 = {}
	local var4 = getTryOnItemComparisonDataModule(p1)
	
	for i, v in p0 do
		if getShouldReplaceTryOnModule(var4, getTryOnItemComparisonDataModule(v)) then
			t_1[i] = v
		else
			t[i] = v
		end
	end
	return t, t_1
end

return getFilteredTryOnItems