local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local CryoModule = require(VirtualEventsState.Parent.Cryo)
local RoduxModule = require(VirtualEventsState.Parent.Rodux)
local _ = require(VirtualEventsState.Models.ExperienceDetailsModel)

return function(p1)
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return (RoduxModule.createReducer({}, {
		[p1.GetExperiencesDetails.Succeeded.name] = function(p2, p3)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { [p3.ids[1]] = p3.responseBody.data[1] })
		end,
		[p1.GetExperiencesDetails.Failed.name] = function(p2, _)
			return p2
		end
	}))
end