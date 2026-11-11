local CreateLazyComponentFunction = require(script:FindFirstAncestor("Squads").Parent.RoactUtils).Components.createLazyComponent

return {
	AppSquadEventReceiver = CreateLazyComponentFunction(function()
		return (require(script.AppSquadEventReceiver))
	end),
	ScheduledSquadsListSheet = CreateLazyComponentFunction(function()
		return (require(script.ScheduledSquads.ScheduledSquadsListSheet))
	end),
	ScheduledSquadsMoreInfoSheet = CreateLazyComponentFunction(function()
		return (require(script.ScheduledSquads.ScheduledSquadsMoreInfoSheet))
	end),
	SquadComponentAccessWrapper = CreateLazyComponentFunction(function()
		return (require(script.SquadComponentAccessWrapper))
	end),
	SquadInviteFriends = CreateLazyComponentFunction(function()
		return (require(script.SquadInviteFriends))
	end),
	SquadJoinButton = CreateLazyComponentFunction(function()
		return (require(script.SquadJoinButton))
	end),
	SquadLobby = CreateLazyComponentFunction(function()
		return (require(script.SquadLobby))
	end),
	SquadTopBanner = CreateLazyComponentFunction(function()
		return (require(script.SquadTopBanner))
	end),
	SquadVoiceAbuseReportScreen = CreateLazyComponentFunction(function()
		return (require(script.SquadVoiceAbuseReportScreen))
	end)
}