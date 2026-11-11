local UserService = game:GetService("UserService")

function getDisplayNameFromUserId(p1)
	-- upvalues: UserService (copy)
	local Success, Result = pcall(function()
		-- upvalues: UserService (upval), p1 (copy)
		return UserService:GetUserInfosByUserIdsAsync({ (tonumber(p1)) })[1]
	end)
	
	return if Success then Result.DisplayName else ""
end

return getDisplayNameFromUserId