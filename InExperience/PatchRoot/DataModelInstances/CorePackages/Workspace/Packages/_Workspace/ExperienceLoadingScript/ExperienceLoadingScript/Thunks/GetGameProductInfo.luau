local marketplaceService = game:GetService("MarketplaceService")
local setGameProductInfoModule = require(script:FindFirstAncestor("ExperienceLoadingScript").Actions.SetGameProductInfo)

return function(p1)
	-- upvalues: marketplaceService (ref), setGameProductInfoModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), marketplaceService (copy), setGameProductInfoModule (copy)
		coroutine.wrap(function()
			-- upvalues: p1 (copy), marketplaceService (copy), p2 (ref), setGameProductInfoModule (copy)
			local var1 = p1
			
			if not var1 or var1 <= 0 then
				while game.PlaceId <= 0 do
					wait()
				end
				var1 = game.PlaceId
			end
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), var1 (write), p2 (copy), setGameProductInfoModule (copy)
				p2:dispatch(setGameProductInfoModule(marketplaceService:GetProductInfoAsync(var1)))
			end)
			
			if not ok then
				print("LoadingScreen:GetGameProductInfo: %s", status)
			end
		end)()
	end
end