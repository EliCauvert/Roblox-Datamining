local MemStorageService = game:GetService("MemStorageService")
local _ = require(script:FindFirstAncestor("InExperienceCloudPlay").CloudPlayTelemetry)

return {
	markUnsuccessfulJoin = function(p1)
		-- upvalues: MemStorageService (copy)
		MemStorageService:SetItem("CloudPlayUnsuccessfulJoin", p1 or "true")
	end,
	consumeUnsuccessfulJoin = function()
		-- upvalues: MemStorageService (copy)
		local CloudPlayUnsuccessfulJoinItem = MemStorageService:GetItem("CloudPlayUnsuccessfulJoin")
		
		if CloudPlayUnsuccessfulJoinItem == "" then
			return false, nil
		else
			MemStorageService:RemoveItem("CloudPlayUnsuccessfulJoin")
			
			return true, if CloudPlayUnsuccessfulJoinItem == "cloud" then "cloud" elseif CloudPlayUnsuccessfulJoinItem == "restyle" then "restyle" else nil
		end
	end
}