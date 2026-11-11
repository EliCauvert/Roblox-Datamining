local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local _ = require(OnPlatformSurveys.Enums.InlineSurveyPreset)
local SurfaceModule = require(OnPlatformSurveys.Enums.Surface)
local config = {
	NoInviteInContent = {
		hasInvite = false,
		inviteSurface = nil,
		surveySurface = SurfaceModule.InContent
	},
	NoInviteModal = {
		hasInvite = false,
		inviteSurface = nil,
		surveySurface = SurfaceModule.Modal
	},
	ModalInviteToModalSurvey = {
		hasInvite = true,
		inviteSurface = SurfaceModule.Modal,
		surveySurface = SurfaceModule.Modal
	},
	InContentInviteToModalSurvey = {
		hasInvite = true,
		inviteSurface = SurfaceModule.InContent,
		surveySurface = SurfaceModule.Modal
	}
}

return {
	DEFAULT_PRESET = "NoInviteModal",
	getPresentationConfig = function(p1)
		-- upvalues: config (copy)
		return config[p1 or "NoInviteModal"] or config.NoInviteModal
	end
}