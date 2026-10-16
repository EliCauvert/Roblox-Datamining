local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local CryoModule = require(VirtualEventsState.Parent.Cryo)
local RoduxModule = require(VirtualEventsState.Parent.Rodux)
local _ = require(VirtualEventsState.Models.ExperienceDetailsModel)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return (RoduxModule.createReducer({}, {
		[p1.GetExperiencesDetails.Succeeded.name] = function(p2, p3) --[[ Line: 13 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { [p3.ids[1]] = p3.responseBody.data[1] })
		end,
		[p1.GetExperiencesDetails.Failed.name] = function(p2, _) --[[ Line: 24 ]]
			return p2
		end
	}))
end