local joinExperienceActionModule = require(script.Parent.JoinExperienceAction)
local playExperienceActionModule = require(script.Parent.PlayExperienceAction)
local chatActionModule = require(script.Parent.ChatAction)
local viewProfileActionModule = require(script.Parent.ViewProfileAction)
local unlockExperienceActionModule = require(script.Parent.UnlockExperienceAction)
local _ = require(script.Parent.Types)
local t = {}

for i, v in {
	joinExperienceActionModule,
	playExperienceActionModule,
	chatActionModule,
	viewProfileActionModule,
	unlockExperienceActionModule
} do
	for i_1, v_1 in v do
		assert(t[i_1] == nil, "Duplicate GameJoinCard action key: " .. tostring(i_1))
		t[i_1] = v_1
	end
end
return t