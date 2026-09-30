local sessionService = game:GetService("SessionService")

return {
	setPlayIntent = function(value)
		-- upvalues: sessionService (ref)
		if sessionService:SessionExists("level2a") then
			sessionService:SetMetadata("level2a", "playIntentId", value)
			
			return
		end
	end
}