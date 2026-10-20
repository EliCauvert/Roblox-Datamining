local MarketplaceService = game:GetService("MarketplaceService")
local SetGameProductInfoModule = require(script:FindFirstAncestor("ExperienceLoadingScript").Actions.SetGameProductInfo)

return function(AssetId)
	-- upvalues: MarketplaceService (copy), SetGameProductInfoModule (copy)
	return function(p1)
		-- upvalues: AssetId (copy), MarketplaceService (upval), SetGameProductInfoModule (upval)
		coroutine.wrap(function()
			-- upvalues: AssetId (upval), MarketplaceService (upval), p1 (copy), SetGameProductInfoModule (upval)
			local AssetId1 = AssetId
			
			if not AssetId1 or AssetId1 <= 0 then
				while game.PlaceId <= 0 do
					wait()
				end
				AssetId1 = game.PlaceId
			end
			local Success, Result = pcall(function()
				-- upvalues: MarketplaceService (upval), AssetId1 (ref), p1 (upval), SetGameProductInfoModule (upval)
				if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
					p1:dispatch(SetGameProductInfoModule((MarketplaceService:GetProductInfoAsync(AssetId1))))
					
					return
				else
					p1:dispatch(SetGameProductInfoModule((MarketplaceService:GetProductInfo(AssetId1))))
				end
			end)
			
			if not Success then
				print("LoadingScreen:GetGameProductInfo: %s", Result)
			end
		end)()
	end
end