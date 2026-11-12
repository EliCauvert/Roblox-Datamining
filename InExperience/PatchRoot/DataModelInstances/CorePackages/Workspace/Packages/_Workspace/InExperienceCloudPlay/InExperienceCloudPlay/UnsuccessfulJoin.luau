local MemStorageService = game:GetService("MemStorageService")

return {
	markUnsuccessfulJoin = function()
		-- upvalues: MemStorageService (copy)
		MemStorageService:SetItem("CloudPlayUnsuccessfulJoin", "true")
	end,
	consumeUnsuccessfulJoin = function(): boolean
		-- upvalues: MemStorageService (copy)
		if MemStorageService:GetItem("CloudPlayUnsuccessfulJoin") == "" then
			return false
		else
			MemStorageService:RemoveItem("CloudPlayUnsuccessfulJoin")
			
			return true
		end
	end
}