local marketplaceService = game:GetService("MarketplaceService")

return function() --[[ line: 12 | named "clearProductInfoCaches" ]]
	-- upvalues: marketplaceService (ref)
	pcall(function() --[[ line: 14 ]]
		-- upvalues: marketplaceService (copy)
		marketplaceService:clearProductInfoCaches()
	end)
end