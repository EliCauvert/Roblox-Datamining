local promiseModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Promise)
local marketplaceService = game:GetService("MarketplaceService")

return function(_, p1)
	-- upvalues: promiseModule (ref), marketplaceService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: marketplaceService (copy), p1 (ref)
		local ok, status = pcall(function()
			-- upvalues: marketplaceService (copy), p1 (copy)
			return marketplaceService:GetUserSubscriptionDetailsInternalAsync(p1)
		end)
		
		if ok then
			p2(status)
			
			return
		end
		p3(status)
	end)
end