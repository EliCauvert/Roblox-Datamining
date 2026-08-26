local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local cryoModule = require(virtualEventsState.Parent.Cryo)
local roduxModule = require(virtualEventsState.Parent.Rodux)
local _ = require(virtualEventsState.Models.ExperienceDetailsModel)

return function(p1)
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.createReducer({}, {
		[p1.GetExperiencesDetails.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { [p3.ids[1]] = p3.responseBody.data[1] })
		end,
		[p1.GetExperiencesDetails.Failed.name] = function(p2, _)
			return p2
		end
	})
end