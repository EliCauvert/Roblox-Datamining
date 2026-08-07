local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local playabilityStatusModule = require(roduxGames.Enums.PlayabilityStatus)
local t = {}

return function(p0) --[[ line: 13 ]]
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), playabilityStatusModule (ref)
	return roduxModule.createReducer(t, {
		[p0.networkingGames.GetExperiencesPlayabilityStatus.Succeeded.name] = function(p1, p2) --[[ line: 17 ]]
			-- upvalues: dashModule (copy), playabilityStatusModule (copy)
			return dashModule.reduce(p2.responseBody, function(p3, p4) --[[ line: 18 ]]
				-- upvalues: dashModule (copy), playabilityStatusModule (copy)
				return dashModule.join(p3, {
					[p4.universeId] = playabilityStatusModule.fromRawValue(p4.playabilityStatus)
				})
			end, p1)
		end
	})
end