local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local gameMediaModelModule = require(roduxGames.Models.GameMediaModel)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), gameMediaModelModule (ref)
	return roduxModule.createReducer(t, {
		[p1.networkingGames.GetExperienceMedia.Succeeded.name] = function(p2, p3)
			-- upvalues: dashModule (copy), gameMediaModelModule (copy)
			return dashModule.join(p2, {
				[tostring(p3.ids[1])] = dashModule.map(p3.responseBody.data, function(p4)
					-- upvalues: gameMediaModelModule (copy)
					return gameMediaModelModule.format(p4)
				end)
			})
		end
	})
end