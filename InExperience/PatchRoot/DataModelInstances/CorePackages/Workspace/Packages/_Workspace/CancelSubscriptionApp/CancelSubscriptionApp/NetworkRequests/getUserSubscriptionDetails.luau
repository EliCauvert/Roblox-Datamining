local promiseModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Promise)
local marketplaceService = game:GetService("MarketplaceService")

return function(_, p0)
	-- upvalues: promiseModule (ref), marketplaceService (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: marketplaceService (copy), p0 (ref)
		local ok, status = pcall(function()
			-- upvalues: marketplaceService (copy), p0 (copy)
			return marketplaceService:GetUserSubscriptionDetailsInternalAsync(p0)
		end)
		
		if ok then
			p1(status)
			
			return
		end
		p2(status)
	end)
end