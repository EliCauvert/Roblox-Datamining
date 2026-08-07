local promiseModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Promise)
local marketplaceService = game:GetService("MarketplaceService")

return function(_, p0) --[[ line: 6 | named "getUserSubscriptionDetails" ]]
	-- upvalues: promiseModule (ref), marketplaceService (ref)
	return promiseModule.new(function(p1, p2) --[[ line: 7 ]]
		-- upvalues: marketplaceService (copy), p0 (ref)
		local ok, status = pcall(function() --[[ line: 8 ]]
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