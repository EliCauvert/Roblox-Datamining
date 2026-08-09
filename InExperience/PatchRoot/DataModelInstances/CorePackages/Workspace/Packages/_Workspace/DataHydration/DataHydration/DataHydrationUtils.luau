local playersService = game:GetService("Players")

return {
	areAllKeysPresent = function(p0, p1) --[[ line: 12 ]]
		if p0 == nil or type(p0) ~= "table" then
			return #p1 == 0
		end
		for i, v in p1 do
			if p0[v] == nil then
				return false
			end
		end
		return true
	end,
	getLocalPlayerUserId = function() --[[ line: 3 ]]
		-- upvalues: playersService (ref)
		local var1 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
		
		return if var1 == nil or var1 <= 0 then nil else var1
	end
}