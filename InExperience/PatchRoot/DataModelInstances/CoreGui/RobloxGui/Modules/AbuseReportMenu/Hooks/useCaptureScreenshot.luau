local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(abuseReportMenu.Components.Types)
local tnSAvatarIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAvatarIdentification)
local tnSAdIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAdIdentification)
local screenshotManager = require(corePackagesService.Workspace.Packages.TnSScreenshot).ScreenshotManager
local avatarIdentification = tnSAvatarIdentificationModule.AvatarIdentification
local adIdentification = tnSAdIdentificationModule.AdIdentification

return function(p0, p1, p2) --[[ line: 18 ]]
	-- upvalues: reactModule (ref), screenshotManager (ref), avatarIdentification (ref), adIdentification (ref)
	return reactModule.useCallback(function() --[[ line: 23 ]]
		-- upvalues: screenshotManager (copy), p1 (ref), p0 (ref), avatarIdentification (copy), adIdentification (copy), p2 (ref)
		screenshotManager:TakeScreenshotWithCallback(p1, p0)
		local visibleAvatars, visibleAvatars_1 = avatarIdentification.getVisibleAvatars()
		local visibleAds, visibleAds_1 = adIdentification.getVisibleAds()
		p2({
			identifiedAvatars = visibleAvatars,
			identifiedAds = visibleAds,
			avatarIDStats = visibleAvatars_1,
			adIDStats = visibleAds_1
		})
	end, { p1, p0, p2 })
end