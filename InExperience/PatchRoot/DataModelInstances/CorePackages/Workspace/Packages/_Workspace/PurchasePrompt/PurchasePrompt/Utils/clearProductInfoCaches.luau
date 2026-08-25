local marketplaceService = game:GetService("MarketplaceService")

return function()
	-- upvalues: marketplaceService (ref)
	pcall(function()
		-- upvalues: marketplaceService (copy)
		marketplaceService:clearProductInfoCaches()
	end)
end