local Default = require(game:GetService("CorePackages").Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager.default

return {
	getReportAnythingAvatarEnabled = function()
		-- upvalues: Default (copy)
		return Default:getReportAnythingAvatarEnabled()
	end,
	getReportAnythingExperienceEnabled = function()
		-- upvalues: Default (copy)
		return Default:getReportAnythingExperienceEnabled()
	end
}