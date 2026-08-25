local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local setUniverseIdModule = require(experienceLoadingScript.Actions.SetUniverseId)
local url = require(experienceLoadingScript.Parent.Http).Url

return function(p0, p1)
	-- upvalues: setUniverseIdModule (ref), url (ref)
	local var2 = function(p2)
		-- upvalues: setUniverseIdModule (copy)
		local placeId = game.PlaceId
		local gameId = game.GameId
		while placeId <= 0 or gameId <= 0 do
			wait()
			placeId = game.PlaceId
			gameId = game.GameId
		end
		p2:dispatch(setUniverseIdModule({ universeId = gameId, placeId = placeId }))
	end
	
	return function(p3)
		-- upvalues: p1 (ref), url (copy), p0 (ref), setUniverseIdModule (copy), var2 (ref)
		coroutine.wrap(function()
			-- upvalues: p1 (copy), url (copy), p0 (copy), p3 (ref), setUniverseIdModule (copy), var2 (copy)
			local gameId = game.GameId
			
			if p1 > 0 and gameId <= 0 then
				p0(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p1), "GET"):andThen(function(p4)
					-- upvalues: gameId (write), p3 (copy), setUniverseIdModule (copy), p1 (ref), var2 (copy)
					if p4 and p4.responseBody then
						gameId = p4.responseBody.universeId
						
						if gameId and gameId >= 0 then
							p3:dispatch(setUniverseIdModule({ universeId = gameId, placeId = p1 }))
							
							return
						end
					end
					var2(p3)
				end, function(_)
					-- upvalues: var2 (copy), p3 (copy)
					var2(p3)
				end)
			else
				var2(p3)
			end
		end)()
	end
end