local MarketplaceService = game:GetService("MarketplaceService")

return function()
	-- upvalues: MarketplaceService (copy)
	pcall(function()
		-- upvalues: MarketplaceService (upval)
		MarketplaceService:clearProductInfoCaches()
	end)
end