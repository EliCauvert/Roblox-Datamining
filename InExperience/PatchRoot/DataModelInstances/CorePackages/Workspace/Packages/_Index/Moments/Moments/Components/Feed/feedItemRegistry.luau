local _ = require(script.Parent.FeedTypes)
local EndStateModule = require(script.Parent.Items.EndState)
local CaughtUpModule = require(script.Parent.Items.CaughtUp)
local UnavailableMomentModule = require(script.Parent.Items.UnavailableMoment)
local FFlagMomentsRenderAvatarPostsInFeed = require(script:FindFirstAncestor("Moments").Parent.SharedFlags).FFlagMomentsRenderAvatarPostsInFeed
local t = {}

local function _(List)
	-- upvalues: t (copy)
	for _, value in List do
		t[value.kind] = value
	end
end

for _, value in require(script.Parent.Items.Moment) do
	t[value.kind] = value
end
for _, value1 in EndStateModule do
	t[value1.kind] = value1
end
for _, value2 in CaughtUpModule do
	t[value2.kind] = value2
end
for _, value3 in UnavailableMomentModule do
	t[value3.kind] = value3
end
if FFlagMomentsRenderAvatarPostsInFeed then
	for _, value4 in require(script.Parent.Items.AvatarMoment) do
		t[value4.kind] = value4
	end
end
return t