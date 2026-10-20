local _ = require(script.Parent.FeedTypes)
local FeedItemRegistry = {}

local function _(List)
	-- upvalues: FeedItemRegistry (copy)
	for _, value in List do
		FeedItemRegistry[value.kind] = value
	end
end

for _, value in require(script.Parent.Items.Moment) do
	FeedItemRegistry[value.kind] = value
end
return FeedItemRegistry