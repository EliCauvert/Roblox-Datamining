local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local playabilityStatusModule = require(roduxGames.Enums.PlayabilityStatus)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), playabilityStatusModule (ref)
	return roduxModule.createReducer(t, {
		[p1.networkingGames.GetExperiencesPlayabilityStatus.Succeeded.name] = function(p2, p3)
			-- upvalues: dashModule (copy), playabilityStatusModule (copy)
			return dashModule.reduce(p3.responseBody, function(p4, p5)
				-- upvalues: dashModule (copy), playabilityStatusModule (copy)
				return dashModule.join(p4, {
					[p5.universeId] = playabilityStatusModule.fromRawValue(p5.playabilityStatus)
				})
			end, p2)
		end
	})
end