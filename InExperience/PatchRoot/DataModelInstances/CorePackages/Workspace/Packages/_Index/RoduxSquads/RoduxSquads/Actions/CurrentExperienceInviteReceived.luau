return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		payload = {
			experienceInviteId = p1,
			membershipEntityId = p2,
			notificationId = p3,
			isInviter = p4
		}
	}
end)