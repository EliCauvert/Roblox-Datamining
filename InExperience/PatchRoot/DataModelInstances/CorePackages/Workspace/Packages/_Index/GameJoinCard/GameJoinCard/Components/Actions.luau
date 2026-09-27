local joinExperienceActionModule = require(script.JoinExperienceAction)
local playExperienceActionModule = require(script.PlayExperienceAction)
local chatActionModule = require(script.ChatAction)
local viewProfileActionModule = require(script.ViewProfileAction)
local unlockExperienceActionModule = require(script.UnlockExperienceAction)
local typesModule = require(script.Types)
local textKeysModule = require(script.TextKeys)
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
return {
	factories = t,
	TextKeys = textKeysModule,
	Types = typesModule
}