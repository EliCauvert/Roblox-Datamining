local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local productModelModule = require(roduxGames.Models.ProductModel)
local t = {}

return function(p0) --[[ line: 13 ]]
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), productModelModule (ref)
	return roduxModule.createReducer(t, {
		[p0.networkingGames.GetExperiencesProductInfo.Succeeded.name] = function(p1, p2) --[[ line: 17 ]]
			-- upvalues: dashModule (copy), productModelModule (copy)
			return dashModule.reduce(p2.responseBody.data, function(p3, p4) --[[ line: 18 ]]
				-- upvalues: dashModule (copy), productModelModule (copy)
				return dashModule.join(p3, {
					[tostring(p4.universeId)] = productModelModule.format(p4)
				})
			end, p1)
		end
	})
end