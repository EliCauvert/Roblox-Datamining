return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(ExperienceInviteId, MembershipEntityId, NotificationId, IsInviter)
	return {
		payload = {
			experienceInviteId = ExperienceInviteId,
			membershipEntityId = MembershipEntityId,
			notificationId = NotificationId,
			isInviter = IsInviter
		}
	}
end)