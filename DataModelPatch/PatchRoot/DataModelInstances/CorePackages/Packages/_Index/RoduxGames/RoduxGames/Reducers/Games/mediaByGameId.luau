local RoduxGames = script:FindFirstAncestor("RoduxGames")
local Parent = RoduxGames.Parent
local RoduxModule = require(Parent.Rodux)
local DashModule = require(Parent.Dash)
local GameMediaModelModule = require(RoduxGames.Models.GameMediaModel)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), DashModule (copy), GameMediaModelModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.networkingGames.GetExperienceMedia.Succeeded.name] = function(p2, p3)
			-- upvalues: DashModule (upval), GameMediaModelModule (upval)
			return DashModule.join(p2, {
				[tostring(p3.ids[1])] = DashModule.map(p3.responseBody.data, function(p4)
					-- upvalues: GameMediaModelModule (upval)
					return GameMediaModelModule.format(p4)
				end)
			})
		end
	})
end