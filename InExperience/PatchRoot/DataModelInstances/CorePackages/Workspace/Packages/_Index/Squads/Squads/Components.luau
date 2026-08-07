local createLazyComponent = require(script:FindFirstAncestor("Squads").Parent.RoactUtils).Components.createLazyComponent

return {
	AppSquadEventReceiver = createLazyComponent(function() --[[ line: 8 ]]
		return require(script.AppSquadEventReceiver)
	end),
	ScheduledSquadsListSheet = createLazyComponent(function() --[[ line: 11 ]]
		return require(script.ScheduledSquads.ScheduledSquadsListSheet)
	end),
	ScheduledSquadsMoreInfoSheet = createLazyComponent(function() --[[ line: 14 ]]
		return require(script.ScheduledSquads.ScheduledSquadsMoreInfoSheet)
	end),
	SquadComponentAccessWrapper = createLazyComponent(function() --[[ line: 17 ]]
		return require(script.SquadComponentAccessWrapper)
	end),
	SquadInviteFriends = createLazyComponent(function() --[[ line: 20 ]]
		return require(script.SquadInviteFriends)
	end),
	SquadJoinButton = createLazyComponent(function() --[[ line: 23 ]]
		return require(script.SquadJoinButton)
	end),
	SquadLobby = createLazyComponent(function() --[[ line: 26 ]]
		return require(script.SquadLobby)
	end),
	SquadTopBanner = createLazyComponent(function() --[[ line: 29 ]]
		return require(script.SquadTopBanner)
	end),
	SquadVoiceAbuseReportScreen = createLazyComponent(function() --[[ line: 32 ]]
		return require(script.SquadVoiceAbuseReportScreen)
	end)
}