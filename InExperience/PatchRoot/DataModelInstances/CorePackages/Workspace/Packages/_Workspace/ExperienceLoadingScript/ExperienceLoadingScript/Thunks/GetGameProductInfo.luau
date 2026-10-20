local MarketplaceService = game:GetService("MarketplaceService")
local SetGameProductInfoModule = require(script:FindFirstAncestor("ExperienceLoadingScript").Actions.SetGameProductInfo)

return function(PlaceId)
	-- upvalues: MarketplaceService (copy), SetGameProductInfoModule (copy)
	return function(p1)
		-- upvalues: PlaceId (copy), MarketplaceService (upval), SetGameProductInfoModule (upval)
		coroutine.wrap(function()
			-- upvalues: PlaceId (upval), MarketplaceService (upval), p1 (copy), SetGameProductInfoModule (upval)
			local PlaceId1 = PlaceId
			
			if not PlaceId1 or PlaceId1 <= 0 then
				while game.PlaceId <= 0 do
					wait()
				end
				PlaceId1 = game.PlaceId
			end
			local Success, Result = pcall(function()
				-- upvalues: MarketplaceService (upval), PlaceId1 (ref), p1 (upval), SetGameProductInfoModule (upval)
				p1:dispatch(SetGameProductInfoModule((MarketplaceService:GetProductInfoAsync(PlaceId1))))
			end)
			
			if not Success then
				print("LoadingScreen:GetGameProductInfo: %s", Result)
			end
		end)()
	end
end