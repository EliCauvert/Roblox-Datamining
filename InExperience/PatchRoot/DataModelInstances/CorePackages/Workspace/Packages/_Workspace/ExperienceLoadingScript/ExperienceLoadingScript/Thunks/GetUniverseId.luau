local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local setUniverseIdModule = require(experienceLoadingScript.Actions.SetUniverseId)
local url = require(experienceLoadingScript.Parent.Http).Url

return function(p1, p2)
	-- upvalues: setUniverseIdModule (ref), url (ref)
	local var1 = function(p3)
		-- upvalues: setUniverseIdModule (copy)
		local placeId = game.PlaceId
		local gameId = game.GameId
		while placeId <= 0 or gameId <= 0 do
			wait()
			placeId = game.PlaceId
			gameId = game.GameId
		end
		p3:dispatch(setUniverseIdModule({ universeId = gameId, placeId = placeId }))
	end
	
	return function(p4)
		-- upvalues: p2 (ref), url (copy), p1 (ref), setUniverseIdModule (copy), var1 (ref)
		coroutine.wrap(function()
			-- upvalues: p2 (copy), url (copy), p1 (copy), p4 (ref), setUniverseIdModule (copy), var1 (copy)
			local gameId = game.GameId
			
			if p2 > 0 and gameId <= 0 then
				p1(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p2), "GET"):andThen(function(p5)
					-- upvalues: gameId (write), p4 (copy), setUniverseIdModule (copy), p2 (ref), var1 (copy)
					if p5 and p5.responseBody then
						gameId = p5.responseBody.universeId
						
						if gameId and gameId >= 0 then
							p4:dispatch(setUniverseIdModule({ universeId = gameId, placeId = p2 }))
							
							return
						end
					end
					var1(p4)
				end, function(_)
					-- upvalues: var1 (copy), p4 (copy)
					var1(p4)
				end)
			else
				var1(p4)
			end
		end)()
	end
end