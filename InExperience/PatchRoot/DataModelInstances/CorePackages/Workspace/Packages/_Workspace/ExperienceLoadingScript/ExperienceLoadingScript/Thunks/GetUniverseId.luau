local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local SetUniverseIdModule = require(ExperienceLoadingScript.Actions.SetUniverseId)
local Url = require(ExperienceLoadingScript.Parent.Http).Url

return function(Callback, PlaceId) --[[ Line: 6 ]]
	-- upvalues: SetUniverseIdModule (copy), Url (copy)
	local function v3(p1) --[[ Line: 7 ]]
		-- upvalues: SetUniverseIdModule (upval)
		local PlaceId = game.PlaceId
		local GameId = game.GameId
		while PlaceId <= 0 or GameId <= 0 do
			wait()
			PlaceId = game.PlaceId
			GameId = game.GameId
		end
		p1:dispatch(SetUniverseIdModule({ universeId = GameId, placeId = PlaceId }))
	end
	
	return function(p2) --[[ Line: 23 ]]
		-- upvalues: PlaceId (copy), Url (upval), Callback (copy), SetUniverseIdModule (upval), v3 (copy)
		coroutine.wrap(function() --[[ Line: 24 ]]
			-- upvalues: PlaceId (upval), Url (upval), Callback (upval), p2 (copy), SetUniverseIdModule (upval), v3 (upval)
			local GameId: number = game.GameId
			
			if PlaceId > 0 and GameId <= 0 then
				Callback(string.format("%suniverses/v1/places/%d/universe", Url.APIS_URL, PlaceId), "GET"):andThen(function(Result) --[[ Line: 31 ]]
					-- upvalues: GameId (ref), p2 (upval), SetUniverseIdModule (upval), PlaceId (copy), v3 (upval)
					if Result and Result.responseBody then
						GameId = Result.responseBody.universeId
						
						if GameId and GameId >= 0 then
							p2:dispatch(SetUniverseIdModule({ universeId = GameId, placeId = PlaceId }))
							
							return
						end
					end
					v3(p2)
				end, function(_) --[[ Line: 44 ]]
					-- upvalues: v3 (upval), p2 (upval)
					v3(p2)
				end)
			else
				v3(p2)
			end
		end)()
	end
end