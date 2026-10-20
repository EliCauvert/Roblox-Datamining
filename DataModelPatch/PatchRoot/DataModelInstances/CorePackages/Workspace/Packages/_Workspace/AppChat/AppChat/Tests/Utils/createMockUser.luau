local MockUser = require(script:FindFirstAncestor("AppChat").Parent.UserLib).Models.MockUser

return function(p1)
	-- upvalues: MockUser (copy)
	local NewMockUser = MockUser.new()
	NewMockUser.name = p1.name
	NewMockUser.displayName = p1.displayName
	NewMockUser.id = p1.id
	NewMockUser.isFriend = p1.isFriend or true
	
	return NewMockUser
end