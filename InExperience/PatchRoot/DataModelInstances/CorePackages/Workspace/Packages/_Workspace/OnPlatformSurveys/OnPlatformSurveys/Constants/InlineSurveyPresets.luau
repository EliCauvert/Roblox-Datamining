local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local _ = require(onPlatformSurveys.Enums.InlineSurveyPreset)
local surfaceModule = require(onPlatformSurveys.Enums.Surface)
local t = {
	NoInviteInContent = {
		hasInvite = false,
		inviteSurface = nil,
		surveySurface = surfaceModule.InContent
	},
	NoInviteModal = {
		hasInvite = false,
		inviteSurface = nil,
		surveySurface = surfaceModule.Modal
	},
	ModalInviteToModalSurvey = {
		hasInvite = true,
		inviteSurface = surfaceModule.Modal,
		surveySurface = surfaceModule.Modal
	},
	InContentInviteToModalSurvey = {
		hasInvite = true,
		inviteSurface = surfaceModule.InContent,
		surveySurface = surfaceModule.Modal
	}
}

return {
	DEFAULT_PRESET = "NoInviteModal",
	getPresentationConfig = function(p0)
		-- upvalues: t (ref)
		return t[p0 or "NoInviteModal"] or t.NoInviteModal
	end
}