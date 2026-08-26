local userService = game:GetService("UserService")

function getDisplayNameFromUserId(p1)
	-- upvalues: userService (ref)
	local ok, status = pcall(function()
		-- upvalues: userService (copy), p1 (ref)
		return userService:GetUserInfosByUserIdsAsync({ tonumber(p1) })[1]
	end)
	
	return if ok then status.DisplayName else ""
end

return getDisplayNameFromUserId