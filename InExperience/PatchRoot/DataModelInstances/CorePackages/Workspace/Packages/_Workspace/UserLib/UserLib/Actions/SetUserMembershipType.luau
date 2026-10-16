return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId, MembershipType) --[[ Line: 6 ]]
	return { userId = UserId, membershipType = MembershipType }
end)