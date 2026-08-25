local rodux = require(script:FindFirstAncestor("CrossExperience").dependencies).Rodux
local participantsModule = require(script.Participants)
local experienceModule = require(script.Experience)

return function(p0)
	-- upvalues: rodux (ref), participantsModule (ref), experienceModule (ref)
	local participants = nil
	local experience = nil
	
	if p0 and p0.Participants then
		participants = p0.Participants
	end
	if p0 and p0.Experience then
		experience = p0.Experience
	end
	return rodux.combineReducers({
		Participants = participantsModule(participants),
		Experience = experienceModule(experience)
	})
end