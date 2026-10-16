local _ = require(script.Parent.FeedTypes)
local EndStateModule = require(script.Parent.Items.EndState)
local UnavailableMomentModule = require(script.Parent.Items.UnavailableMoment)
local FeedItemRegistry = {}

local function _(List) --[[ Line: 19 | Named "register" ]]
	-- upvalues: FeedItemRegistry (copy)
	for _, value in List do
		FeedItemRegistry[value.kind] = value
	end
end

for _, value in require(script.Parent.Items.Moment) do
	FeedItemRegistry[value.kind] = value
end
for _, value1 in EndStateModule do
	FeedItemRegistry[value1.kind] = value1
end
for _, value2 in UnavailableMomentModule do
	FeedItemRegistry[value2.kind] = value2
end
return FeedItemRegistry