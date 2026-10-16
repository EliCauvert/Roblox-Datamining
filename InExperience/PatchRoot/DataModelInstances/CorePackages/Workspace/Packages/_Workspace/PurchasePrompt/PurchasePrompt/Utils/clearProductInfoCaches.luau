local MarketplaceService = game:GetService("MarketplaceService")

return function() --[[ Line: 12 | Named "clearProductInfoCaches" ]]
	-- upvalues: MarketplaceService (copy)
	pcall(function() --[[ Line: 14 ]]
		-- upvalues: MarketplaceService (upval)
		MarketplaceService:clearProductInfoCaches()
	end)
end