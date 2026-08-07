local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local cryoModule = require(virtualEventsState.Parent.Cryo)
local roduxModule = require(virtualEventsState.Parent.Rodux)
local _ = require(virtualEventsState.Models.ExperienceMediaModel)

return function(p0) --[[ line: 11 ]]
	-- upvalues: roduxModule (ref), cryoModule (ref)
	return roduxModule.createReducer({}, {
		[p0.GetExperienceMedia.Succeeded.name] = function(p1, p2) --[[ line: 13 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p1, { [p2.ids[1]] = p2.responseBody.data })
		end,
		[p0.GetExperienceMedia.Failed.name] = function(p3, _) --[[ line: 21 ]]
			return p3
		end
	})
end