local _ = require(script.Parent.Types)
local t = {}

for _, value in {
	require(script.Parent.JoinExperienceAction),
	require(script.Parent.PlayExperienceAction),
	require(script.Parent.ChatAction),
	require(script.Parent.ViewProfileAction),
	(require(script.Parent.UnlockExperienceAction))
} do
	for i, value1 in value do
		assert(t[i] == nil, "Duplicate GameJoinCard action key: " .. tostring(i))
		t[i] = value1
	end
end
return t