local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local gameMediaModelModule = require(roduxGames.Models.GameMediaModel)
local t = {}

return function(p0) --[[ line: 13 ]]
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), gameMediaModelModule (ref)
	return roduxModule.createReducer(t, {
		[p0.networkingGames.GetExperienceMedia.Succeeded.name] = function(p1, p2) --[[ line: 16 ]]
			-- upvalues: dashModule (copy), gameMediaModelModule (copy)
			return dashModule.join(p1, {
				[tostring(p2.ids[1])] = dashModule.map(p2.responseBody.data, function(p3) --[[ line: 19 ]]
					-- upvalues: gameMediaModelModule (copy)
					return gameMediaModelModule.format(p3)
				end)
			})
		end
	})
end