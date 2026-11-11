local SessionService = game:GetService("SessionService")
local FFlagMomentsWatchSessionalization = require(script:FindFirstAncestor("Moments").Parent.SharedFlags).FFlagMomentsWatchSessionalization

return {
	setPlayIntent = function(Value)
		-- upvalues: FFlagMomentsWatchSessionalization (copy), SessionService (copy)
		if not FFlagMomentsWatchSessionalization then return end
		if SessionService:SessionExists("level2a") then
			SessionService:SetMetadata("level2a", "playIntentId", Value)
			
			return
		end
	end
}