return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId, MembershipType)
	return { userId = UserId, membershipType = MembershipType }
end)