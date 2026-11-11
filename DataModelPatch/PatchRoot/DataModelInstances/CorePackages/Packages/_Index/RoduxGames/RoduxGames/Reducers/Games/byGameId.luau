local RoduxGames = script:FindFirstAncestor("RoduxGames")
local Parent = RoduxGames.Parent
local RoduxModule = require(Parent.Rodux)
local DashModule = require(Parent.Dash)
local GameModelModule = require(RoduxGames.Models.GameModel)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), DashModule (copy), GameModelModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.networkingGames.GetExperiencesDetails.Succeeded.name] = function(p2, p3)
			-- upvalues: DashModule (upval), GameModelModule (upval)
			return DashModule.reduce(p3.responseBody.data, function(p4, p5)
				-- upvalues: DashModule (upval), GameModelModule (upval)
				return DashModule.join(p4, { [tostring(p5.id)] = GameModelModule.format(p5) })
			end, p2)
		end
	})
end