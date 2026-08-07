local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local gameModelModule = require(roduxGames.Models.GameModel)
local t = {}

return function(p0) --[[ line: 13 ]]
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), gameModelModule (ref)
	return roduxModule.createReducer(t, {
		[p0.networkingGames.GetExperiencesDetails.Succeeded.name] = function(p1, p2) --[[ line: 17 ]]
			-- upvalues: dashModule (copy), gameModelModule (copy)
			return dashModule.reduce(p2.responseBody.data, function(p3, p4) --[[ line: 18 ]]
				-- upvalues: dashModule (copy), gameModelModule (copy)
				return dashModule.join(p3, { [tostring(p4.id)] = gameModelModule.format(p4) })
			end, p1)
		end
	})
end