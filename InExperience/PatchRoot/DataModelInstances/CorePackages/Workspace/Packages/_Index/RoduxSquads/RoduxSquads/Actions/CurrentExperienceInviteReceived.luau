return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3)
	return {
		payload = {
			experienceInviteId = p0,
			membershipEntityId = p1,
			notificationId = p2,
			isInviter = p3
		}
	}
end)