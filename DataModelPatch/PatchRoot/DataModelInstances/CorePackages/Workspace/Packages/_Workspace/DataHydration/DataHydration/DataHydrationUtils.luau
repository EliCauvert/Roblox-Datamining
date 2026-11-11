local Players = game:GetService("Players")

return {
	areAllKeysPresent = function(p1, List): boolean
		if p1 == nil or type(p1) ~= "table" then
			return #List == 0
		end
		for _, value in List do
			if p1[value] == nil then
				return false
			end
		end
		return true
	end,
	getLocalPlayerUserId = function()
		-- upvalues: Players (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		
		return if UserId == nil or UserId <= 0 then nil else UserId
	end
}