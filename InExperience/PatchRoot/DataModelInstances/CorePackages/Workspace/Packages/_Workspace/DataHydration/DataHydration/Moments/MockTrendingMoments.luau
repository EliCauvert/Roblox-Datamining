local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local t = {}

for i, v in require(script.Parent.MomentFixtures).buildMomentFeedItems(1, 10) do
	table.insert(t, v.moment)
end
return t