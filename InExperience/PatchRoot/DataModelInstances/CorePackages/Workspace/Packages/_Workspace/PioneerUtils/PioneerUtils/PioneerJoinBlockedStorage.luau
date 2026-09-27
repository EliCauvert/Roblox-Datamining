local memStorageService = game:GetService("MemStorageService")
local t = { AccountUnder13 = "AccountUnder13" }

return {
	Reason = t,
	set = function(value)
		-- upvalues: t (ref), memStorageService (ref)
		if t[value] == nil then
			return
		end
		memStorageService:SetItem("PioneerJoinBlocked", value)
	end,
	consume = function()
		-- upvalues: memStorageService (ref), t (ref)
		local pioneerJoinBlockedItem = memStorageService:GetItem("PioneerJoinBlocked")
		memStorageService:SetItem("PioneerJoinBlocked", "")
		
		return if pioneerJoinBlockedItem == nil then nil else t[pioneerJoinBlockedItem]
	end
}