local Rodux = require(script:FindFirstAncestor("CrossExperience").dependencies).Rodux
local ParticipantsModule = require(script.Participants)
local ExperienceModule = require(script.Experience)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: Rodux (copy), ParticipantsModule (copy), ExperienceModule (copy)
	local Participants = nil
	local Experience = nil
	
	if p1 and p1.Participants then
		Participants = p1.Participants
	end
	if p1 and p1.Experience then
		Experience = p1.Experience
	end
	return Rodux.combineReducers({
		Participants = ParticipantsModule(Participants),
		Experience = ExperienceModule(Experience)
	})
end