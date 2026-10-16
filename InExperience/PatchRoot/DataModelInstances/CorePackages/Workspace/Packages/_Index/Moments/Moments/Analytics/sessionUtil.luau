local SessionService = game:GetService("SessionService")

return {
	setPlayIntent = function(Value) --[[ Line: 30 ]]
		-- upvalues: SessionService (copy)
		if SessionService:SessionExists("level2a") then
			SessionService:SetMetadata("level2a", "playIntentId", Value)
			
			return
		end
	end
}