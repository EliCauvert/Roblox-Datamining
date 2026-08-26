local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local cryoModule = require(virtualEventsState.Parent.Cryo)
local roduxModule = require(virtualEventsState.Parent.Rodux)
local _ = require(virtualEventsState.Models.ExperienceMediaModel)

return function(p1)
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.createReducer({}, {
		[p1.GetExperienceMedia.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { [p3.ids[1]] = p3.responseBody.data })
		end,
		[p1.GetExperienceMedia.Failed.name] = function(p2, _)
			return p2
		end
	})
end