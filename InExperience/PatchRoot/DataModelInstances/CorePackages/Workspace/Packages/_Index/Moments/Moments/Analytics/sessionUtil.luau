local sessionService = game:GetService("SessionService")
local fFlagMomentsWatchSessionalization = require(script:FindFirstAncestor("Moments").Parent.SharedFlags).FFlagMomentsWatchSessionalization

return {
	setPlayIntent = function(value) --[[ line: 33 ]]
		-- upvalues: fFlagMomentsWatchSessionalization (ref), sessionService (ref)
		if not fFlagMomentsWatchSessionalization then return end
		if sessionService:SessionExists("level2a") then
			sessionService:SetMetadata("level2a", "playIntentId", value)
			
			return
		end
	end
}