local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local MockTrendingMomentsModule = {}

for _, value in require(script.Parent.MomentFixtures).buildMomentFeedItems(1, 10) do
	table.insert(MockTrendingMomentsModule, value.moment)
end
return MockTrendingMomentsModule