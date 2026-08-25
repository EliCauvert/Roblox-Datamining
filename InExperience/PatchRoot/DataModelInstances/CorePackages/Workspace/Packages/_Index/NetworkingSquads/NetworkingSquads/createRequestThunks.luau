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

return function(p0)
	-- upvalues: createCreateOrJoinSquadModule (ref), createGetSquadActiveModule (ref), createGetSquadFromSquadIdModule (ref), createJoinSquadModule (ref), createActOnPartyNudgeModule (ref), createLeaveSquadModule (ref), createSquadInviteModule (ref), createCreateExperienceInviteModule (ref), createGetExperienceInviteModule (ref), createVoteForExperienceInviteModule (ref), createReinviteToSquadModule (ref), createSendSquadVoiceAbuseReportModule (ref), createSetRegroupPromptShownModule (ref)
	return {
		CreateOrJoinSquad = createCreateOrJoinSquadModule(p0),
		GetSquadActive = createGetSquadActiveModule(p0),
		GetSquadFromSquadId = createGetSquadFromSquadIdModule(p0),
		JoinSquad = createJoinSquadModule(p0),
		ActOnPartyNudge = createActOnPartyNudgeModule(p0),
		LeaveSquad = createLeaveSquadModule(p0),
		SquadInvite = createSquadInviteModule(p0),
		CreateExperienceInvite = createCreateExperienceInviteModule(p0),
		GetExperienceInvite = createGetExperienceInviteModule(p0),
		VoteForExperienceInvite = createVoteForExperienceInviteModule(p0),
		ReinviteToSquad = createReinviteToSquadModule(p0),
		SendSquadVoiceAbuseReport = createSendSquadVoiceAbuseReportModule(p0),
		SetRegroupPromptShown = createSetRegroupPromptShownModule(p0)
	}
end