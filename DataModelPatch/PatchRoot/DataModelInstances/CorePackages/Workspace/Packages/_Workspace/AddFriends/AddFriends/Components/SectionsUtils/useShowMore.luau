local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled

return function(p1, p2, p3, Callback)
	-- upvalues: ReactModule (copy), FFlagAddFriendsUserListEnabled (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or 0)
	
	if FFlagAddFriendsUserListEnabled then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy), p1 (copy)
			UseStateResult2(p1 or 0)
		end, { p1 })
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1)
	
	return ReactModule.useCallback(function()
		-- upvalues: Callback (copy), UseStateResult2_1 (copy), UseStateResult (copy), p3 (copy), p2 (copy), UseStateResult2 (copy)
		Callback()
		UseStateResult2_1(UseStateResult * p3 + 1)
		local CeiledDelta = math.ceil(p2 / p3) - 2
		
		if CeiledDelta <= 0 then
			CeiledDelta = math.floor(p2 / p3)
		end
		UseStateResult2(UseStateResult + CeiledDelta)
	end, { UseStateResult, p2, Callback, p3 }), UseStateResult, UseStateResult1
end