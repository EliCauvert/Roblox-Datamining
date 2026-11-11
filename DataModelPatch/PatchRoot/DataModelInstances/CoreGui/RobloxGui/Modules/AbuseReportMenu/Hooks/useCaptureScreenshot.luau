local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(script:FindFirstAncestor("AbuseReportMenu").Components.Types)
local ScreenshotManager = require(CorePackages.Workspace.Packages.TnSScreenshot).ScreenshotManager
local AvatarIdentification = require(CorePackages.Workspace.Packages.TnSAvatarIdentification).AvatarIdentification
local AdIdentification = require(CorePackages.Workspace.Packages.TnSAdIdentification).AdIdentification

return function(p1, p2, Callback)
	-- upvalues: ReactModule (copy), ScreenshotManager (copy), AvatarIdentification (copy), AdIdentification (copy)
	return ReactModule.useCallback(function()
		-- upvalues: ScreenshotManager (upval), p2 (copy), p1 (copy), AvatarIdentification (upval), AdIdentification (upval), Callback (copy)
		ScreenshotManager:TakeScreenshotWithCallback(p2, p1)
		local VisibleAvatars, VisibleAvatars2 = AvatarIdentification.getVisibleAvatars()
		local VisibleAds, VisibleAds2 = AdIdentification.getVisibleAds()
		Callback({
			identifiedAvatars = VisibleAvatars,
			identifiedAds = VisibleAds,
			avatarIDStats = VisibleAvatars2,
			adIDStats = VisibleAds2
		})
	end, { p2, p1, Callback })
end