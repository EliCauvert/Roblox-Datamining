local _ = require(script.Parent.networkingSquadTypes)
local NetworkRequests = script.Parent.networkRequests
local CreateCreateOrJoinSquadModule = require(NetworkRequests.createCreateOrJoinSquad)
local CreateGetSquadActiveModule = require(NetworkRequests.createGetSquadActive)
local CreateGetSquadFromSquadIdModule = require(NetworkRequests.createGetSquadFromSquadId)
local CreateJoinSquadModule = require(NetworkRequests.createJoinSquad)
local CreateActOnPartyNudgeModule = require(NetworkRequests.createActOnPartyNudge)
local CreateLeaveSquadModule = require(NetworkRequests.createLeaveSquad)
local CreateSquadInviteModule = require(NetworkRequests.createSquadInvite)
local CreateCreateExperienceInviteModule = require(NetworkRequests.createCreateExperienceInvite)
local CreateGetExperienceInviteModule = require(NetworkRequests.createGetExperienceInvite)
local CreateVoteForExperienceInviteModule = require(NetworkRequests.createVoteForExperienceInvite)
local CreateSendSquadVoiceAbuseReportModule = require(NetworkRequests.createSendSquadVoiceAbuseReport)
local CreateReinviteToSquadModule = require(NetworkRequests.createReinviteToSquad)
local CreateSetRegroupPromptShownModule = require(NetworkRequests.createSetRegroupPromptShown)

return function(p1) --[[ Line: 25 ]]
	-- upvalues: CreateCreateOrJoinSquadModule (copy), CreateGetSquadActiveModule (copy), CreateGetSquadFromSquadIdModule (copy), CreateJoinSquadModule (copy), CreateActOnPartyNudgeModule (copy), CreateLeaveSquadModule (copy), CreateSquadInviteModule (copy), CreateCreateExperienceInviteModule (copy), CreateGetExperienceInviteModule (copy), CreateVoteForExperienceInviteModule (copy), CreateReinviteToSquadModule (copy), CreateSendSquadVoiceAbuseReportModule (copy), CreateSetRegroupPromptShownModule (copy)
	return {
		CreateOrJoinSquad = CreateCreateOrJoinSquadModule(p1),
		GetSquadActive = CreateGetSquadActiveModule(p1),
		GetSquadFromSquadId = CreateGetSquadFromSquadIdModule(p1),
		JoinSquad = CreateJoinSquadModule(p1),
		ActOnPartyNudge = CreateActOnPartyNudgeModule(p1),
		LeaveSquad = CreateLeaveSquadModule(p1),
		SquadInvite = CreateSquadInviteModule(p1),
		CreateExperienceInvite = CreateCreateExperienceInviteModule(p1),
		GetExperienceInvite = CreateGetExperienceInviteModule(p1),
		VoteForExperienceInvite = CreateVoteForExperienceInviteModule(p1),
		ReinviteToSquad = CreateReinviteToSquadModule(p1),
		SendSquadVoiceAbuseReport = CreateSendSquadVoiceAbuseReportModule(p1),
		SetRegroupPromptShown = CreateSetRegroupPromptShownModule(p1)
	}
end