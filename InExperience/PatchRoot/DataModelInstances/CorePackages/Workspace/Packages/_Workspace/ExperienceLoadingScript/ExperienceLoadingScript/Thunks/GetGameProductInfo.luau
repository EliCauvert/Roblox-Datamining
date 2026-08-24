local marketplaceService = game:GetService("MarketplaceService")
local setGameProductInfoModule = require(script:FindFirstAncestor("ExperienceLoadingScript").Actions.SetGameProductInfo)

return function(p0)
	-- upvalues: marketplaceService (ref), setGameProductInfoModule (ref)
	return function(p1)
		-- upvalues: p0 (ref), marketplaceService (copy), setGameProductInfoModule (copy)
		coroutine.wrap(function()
			-- upvalues: p0 (copy), marketplaceService (copy), p1 (ref), setGameProductInfoModule (copy)
			local var2 = p0
			
			if not var2 or var2 <= 0 then
				while game.PlaceId <= 0 do
					wait()
				end
				var2 = game.PlaceId
			end
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), var2 (write), p1 (copy), setGameProductInfoModule (copy)
				if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
					p1:dispatch(setGameProductInfoModule(marketplaceService:GetProductInfoAsync(var2)))
					
					return
				end
				p1:dispatch(setGameProductInfoModule(marketplaceService:GetProductInfo(var2)))
			end)
			
			if not ok then
				print("LoadingScreen:GetGameProductInfo: %s", status)
			end
		end)()
	end
end