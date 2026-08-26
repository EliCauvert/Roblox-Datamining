local rodux = require(script:FindFirstAncestor("CrossExperience").dependencies).Rodux
local participantsModule = require(script.Participants)
local experienceModule = require(script.Experience)

return function(p1)
	-- upvalues: rodux (ref), participantsModule (ref), experienceModule (ref)
	local participants = nil
	local experience = nil
	
	if p1 and p1.Participants then
		participants = p1.Participants
	end
	if p1 and p1.Experience then
		experience = p1.Experience
	end
	return rodux.combineReducers({
		Participants = participantsModule(participants),
		Experience = experienceModule(experience)
	})
end