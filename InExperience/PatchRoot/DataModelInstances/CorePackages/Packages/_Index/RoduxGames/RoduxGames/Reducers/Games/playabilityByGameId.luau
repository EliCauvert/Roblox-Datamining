local RoduxGames = script:FindFirstAncestor("RoduxGames")
local Parent = RoduxGames.Parent
local RoduxModule = require(Parent.Rodux)
local DashModule = require(Parent.Dash)
local PlayabilityStatusModule = require(RoduxGames.Enums.PlayabilityStatus)
local t = {}

return function(p1) --[[ Line: 13 ]]
	-- upvalues: RoduxModule (copy), t (copy), DashModule (copy), PlayabilityStatusModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.networkingGames.GetExperiencesPlayabilityStatus.Succeeded.name] = function(p2, p3) --[[ Line: 17 ]]
			-- upvalues: DashModule (upval), PlayabilityStatusModule (upval)
			return DashModule.reduce(p3.responseBody, function(p4, p5) --[[ Line: 18 ]]
				-- upvalues: DashModule (upval), PlayabilityStatusModule (upval)
				return DashModule.join(p4, {
					[p5.universeId] = PlayabilityStatusModule.fromRawValue(p5.playabilityStatus)
				})
			end, p2)
		end
	})
end