local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(abuseReportMenu.Components.Types)
local tnSAvatarIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAvatarIdentification)
local tnSAdIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAdIdentification)
local screenshotManager = require(corePackagesService.Workspace.Packages.TnSScreenshot).ScreenshotManager
local avatarIdentification = tnSAvatarIdentificationModule.AvatarIdentification
local adIdentification = tnSAdIdentificationModule.AdIdentification

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), screenshotManager (ref), avatarIdentification (ref), adIdentification (ref)
	return reactModule.useCallback(function()
		-- upvalues: screenshotManager (copy), p2 (ref), p1 (ref), avatarIdentification (copy), adIdentification (copy), p3 (ref)
		screenshotManager:TakeScreenshotWithCallback(p2, p1)
		local visibleAvatars, visibleAvatars_1 = avatarIdentification.getVisibleAvatars()
		local visibleAds, visibleAds_1 = adIdentification.getVisibleAds()
		p3({
			identifiedAvatars = visibleAvatars,
			identifiedAds = visibleAds,
			avatarIDStats = visibleAvatars_1,
			adIDStats = visibleAds_1
		})
	end, { p2, p1, p3 })
end