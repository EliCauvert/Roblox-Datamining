local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local CryoModule = require(VirtualEventsState.Parent.Cryo)
local RoduxModule = require(VirtualEventsState.Parent.Rodux)
local _ = require(VirtualEventsState.Models.ExperienceMediaModel)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: RoduxModule (copy), CryoModule (copy)
	return (RoduxModule.createReducer({}, {
		[p1.GetExperienceMedia.Succeeded.name] = function(p2, p3) --[[ Line: 13 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { [p3.ids[1]] = p3.responseBody.data })
		end,
		[p1.GetExperienceMedia.Failed.name] = function(p2, _) --[[ Line: 21 ]]
			return p2
		end
	}))
end