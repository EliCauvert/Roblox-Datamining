local _ = require(script.Parent.networkingSquadTypes)
local networkRequests = script.Parent.networkRequests
local createCreateOrJoinSquadModule = require(networkRequests.createCreateOrJoinSquad)
local createGetSquadActiveModule = require(networkRequests.createGetSquadActive)
local createGetSquadFromSquadIdModule = require(networkRequests.createGetSquadFromSquadId)
local createJoinSquadModule = require(networkRequests.createJoinSquad)
local createActOnPartyNudgeModule = require(networkRequests.createActOnPartyNudge)
local createLeaveSquadModule = require(networkRequests.createLeaveSquad)
local createSquadInviteModule = require(networkRequests.createSquadInvite)
local createCreateExperienceInviteModule = require(networkRequests.createCreateExperienceInvite)
local createGetExperienceInviteModule = require(networkRequests.createGetExperienceInvite)
local createVoteForExperienceInviteModule = require(networkRequests.createVoteForExperienceInvite)
local createSendSquadVoiceAbuseReportModule = require(networkRequests.createSendSquadVoiceAbuseReport)
local createReinviteToSquadModule = require(networkRequests.createReinviteToSquad)
local createSetRegroupPromptShownModule = require(networkRequests.createSetRegroupPromptShown)

return function(p1)
	-- upvalues: createCreateOrJoinSquadModule (ref), createGetSquadActiveModule (ref), createGetSquadFromSquadIdModule (ref), createJoinSquadModule (ref), createActOnPartyNudgeModule (ref), createLeaveSquadModule (ref), createSquadInviteModule (ref), createCreateExperienceInviteModule (ref), createGetExperienceInviteModule (ref), createVoteForExperienceInviteModule (ref), createReinviteToSquadModule (ref), createSendSquadVoiceAbuseReportModule (ref), createSetRegroupPromptShownModule (ref)
	return {
		CreateOrJoinSquad = createCreateOrJoinSquadModule(p1),
		GetSquadActive = createGetSquadActiveModule(p1),
		GetSquadFromSquadId = createGetSquadFromSquadIdModule(p1),
		JoinSquad = createJoinSquadModule(p1),
		ActOnPartyNudge = createActOnPartyNudgeModule(p1),
		LeaveSquad = createLeaveSquadModule(p1),
		SquadInvite = createSquadInviteModule(p1),
		CreateExperienceInvite = createCreateExperienceInviteModule(p1),
		GetExperienceInvite = createGetExperienceInviteModule(p1),
		VoteForExperienceInvite = createVoteForExperienceInviteModule(p1),
		ReinviteToSquad = createReinviteToSquadModule(p1),
		SendSquadVoiceAbuseReport = createSendSquadVoiceAbuseReportModule(p1),
		SetRegroupPromptShown = createSetRegroupPromptShownModule(p1)
	}
end