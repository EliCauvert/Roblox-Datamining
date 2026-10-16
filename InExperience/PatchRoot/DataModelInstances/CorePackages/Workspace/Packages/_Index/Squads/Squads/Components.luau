local CreateLazyComponentFunction = require(script:FindFirstAncestor("Squads").Parent.RoactUtils).Components.createLazyComponent

return {
	AppSquadEventReceiver = CreateLazyComponentFunction(function() --[[ Line: 8 ]]
		return (require(script.AppSquadEventReceiver))
	end),
	ScheduledSquadsListSheet = CreateLazyComponentFunction(function() --[[ Line: 11 ]]
		return (require(script.ScheduledSquads.ScheduledSquadsListSheet))
	end),
	ScheduledSquadsMoreInfoSheet = CreateLazyComponentFunction(function() --[[ Line: 14 ]]
		return (require(script.ScheduledSquads.ScheduledSquadsMoreInfoSheet))
	end),
	SquadComponentAccessWrapper = CreateLazyComponentFunction(function() --[[ Line: 17 ]]
		return (require(script.SquadComponentAccessWrapper))
	end),
	SquadInviteFriends = CreateLazyComponentFunction(function() --[[ Line: 20 ]]
		return (require(script.SquadInviteFriends))
	end),
	SquadJoinButton = CreateLazyComponentFunction(function() --[[ Line: 23 ]]
		return (require(script.SquadJoinButton))
	end),
	SquadLobby = CreateLazyComponentFunction(function() --[[ Line: 26 ]]
		return (require(script.SquadLobby))
	end),
	SquadTopBanner = CreateLazyComponentFunction(function() --[[ Line: 29 ]]
		return (require(script.SquadTopBanner))
	end),
	SquadVoiceAbuseReportScreen = CreateLazyComponentFunction(function() --[[ Line: 32 ]]
		return (require(script.SquadVoiceAbuseReportScreen))
	end)
}