local roduxGames = script:FindFirstAncestor("RoduxGames")
local parent = roduxGames.Parent
local roduxModule = require(parent.Rodux)
local dashModule = require(parent.Dash)
local productModelModule = require(roduxGames.Models.ProductModel)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), dashModule (ref), productModelModule (ref)
	return roduxModule.createReducer(t, {
		[p1.networkingGames.GetExperiencesProductInfo.Succeeded.name] = function(p2, p3)
			-- upvalues: dashModule (copy), productModelModule (copy)
			return dashModule.reduce(p3.responseBody.data, function(p4, p5)
				-- upvalues: dashModule (copy), productModelModule (copy)
				return dashModule.join(p4, {
					[tostring(p5.universeId)] = productModelModule.format(p5)
				})
			end, p2)
		end
	})
end