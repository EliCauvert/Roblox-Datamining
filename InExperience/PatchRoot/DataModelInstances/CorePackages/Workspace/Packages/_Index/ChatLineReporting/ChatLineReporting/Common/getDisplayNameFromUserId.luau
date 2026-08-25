local userService = game:GetService("UserService")

function getDisplayNameFromUserId(p0)
	-- upvalues: userService (ref)
	local ok, status = pcall(function()
		-- upvalues: userService (copy), p0 (ref)
		return userService:GetUserInfosByUserIdsAsync({ tonumber(p0) })[1]
	end)
	
	return if ok then status.DisplayName else ""
end

return getDisplayNameFromUserId