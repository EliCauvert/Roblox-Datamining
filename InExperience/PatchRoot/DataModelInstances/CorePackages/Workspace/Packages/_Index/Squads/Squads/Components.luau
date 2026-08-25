local createLazyComponent = require(script:FindFirstAncestor("Squads").Parent.RoactUtils).Components.createLazyComponent

return {
	AppSquadEventReceiver = createLazyComponent(function()
		return require(script.AppSquadEventReceiver)
	end),
	ScheduledSquadsListSheet = createLazyComponent(function()
		return require(script.ScheduledSquads.ScheduledSquadsListSheet)
	end),
	ScheduledSquadsMoreInfoSheet = createLazyComponent(function()
		return require(script.ScheduledSquads.ScheduledSquadsMoreInfoSheet)
	end),
	SquadComponentAccessWrapper = createLazyComponent(function()
		return require(script.SquadComponentAccessWrapper)
	end),
	SquadInviteFriends = createLazyComponent(function()
		return require(script.SquadInviteFriends)
	end),
	SquadJoinButton = createLazyComponent(function()
		return require(script.SquadJoinButton)
	end),
	SquadLobby = createLazyComponent(function()
		return require(script.SquadLobby)
	end),
	SquadTopBanner = createLazyComponent(function()
		return require(script.SquadTopBanner)
	end),
	SquadVoiceAbuseReportScreen = createLazyComponent(function()
		return require(script.SquadVoiceAbuseReportScreen)
	end)
}