local default = require(game:GetService("CorePackages").Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager.default

return {
	getReportAnythingAvatarEnabled = function()
		-- upvalues: default (ref)
		return default:getReportAnythingAvatarEnabled()
	end,
	getReportAnythingExperienceEnabled = function()
		-- upvalues: default (ref)
		return default:getReportAnythingExperienceEnabled()
	end
}