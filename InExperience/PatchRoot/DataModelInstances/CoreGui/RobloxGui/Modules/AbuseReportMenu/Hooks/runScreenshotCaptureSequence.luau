local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local _ = require(abuseReportMenu.Components.Types)
local fFlagIEMTabFocusNav = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local tnSAvatarIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAvatarIdentification)
local tnSAdIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAdIdentification)
local screenshotManager = require(corePackagesService.Workspace.Packages.TnSScreenshot).ScreenshotManager
local avatarIdentification = tnSAvatarIdentificationModule.AvatarIdentification
local adIdentification = tnSAdIdentificationModule.AdIdentification
local abuseReportMenuScreenshotReduceMotionWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local abuseReportMenuScreenshotWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local function defaultGetWaitFrames()
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames
end

local function defaultGetWaitTime()
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return (if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames) / 60
end

local function defaultDeps()
	-- upvalues: screenshotManager (ref), avatarIdentification (ref), adIdentification (ref), runService (ref), defaultGetWaitFrames (ref), defaultGetWaitTime (ref)
	return {
		takeScreenshot = function(p1)
			-- upvalues: screenshotManager (copy)
			return screenshotManager:TakeScreenshotWithCallback(p1)
		end,
		getVisibleAvatars = function()
			-- upvalues: avatarIdentification (copy)
			return avatarIdentification.getVisibleAvatars()
		end,
		getVisibleAds = function()
			-- upvalues: adIdentification (copy)
			return adIdentification.getVisibleAds()
		end,
		runService = runService,
		getWaitFrames = defaultGetWaitFrames,
		getWaitTime = defaultGetWaitTime
	}
end

local function _(p1)
	local visibleAvatars, visibleAvatars_1 = p1.getVisibleAvatars()
	local visibleAds, visibleAds_1 = p1.getVisibleAds()
	
	return {
		identifiedAvatars = visibleAvatars,
		identifiedAds = visibleAds,
		avatarIDStats = visibleAvatars_1,
		adIDStats = visibleAds_1
	}
end

return function(p1, p2)
	-- upvalues: defaultDeps (ref), fFlagIEMTabFocusNav (ref), guiService (ref)
	p2 = p2 or defaultDeps()
	local var1 = if fFlagIEMTabFocusNav then guiService.SelectedCoreObject else nil
	p1.hide()
	local var2 = 0
	local processTime = os.clock()
	local var3 = false
	local heartbeatConnection = nil
	heartbeatConnection = p2.runService.Heartbeat:Connect(function()
		-- upvalues: var3 (write), var2 (write), p2 (ref), p1 (ref), processTime (ref), heartbeatConnection (write), fFlagIEMTabFocusNav (copy), var1 (write), guiService (copy)
		if not var3 and var2 >= 1 then
			var3 = true
			p2.takeScreenshot(p1.onScreenshotUploaded)
			p1.onScreenshotTaken()
			local onIdentificationCompleted = p1.onIdentificationCompleted
			local var4 = p2
			local visibleAvatars, visibleAvatars_1 = var4.getVisibleAvatars()
			local visibleAds, visibleAds_1 = var4.getVisibleAds()
			onIdentificationCompleted({
				identifiedAvatars = visibleAvatars,
				identifiedAds = visibleAds,
				avatarIDStats = visibleAvatars_1,
				adIDStats = visibleAds_1
			})
		end
		if not var3 or not (p2.getWaitFrames() <= var2) or not (p2.getWaitTime() <= os.clock() - processTime) then
			var2 += 1
			
			return
		end
		heartbeatConnection:Disconnect()
		p1.show()
		
		if fFlagIEMTabFocusNav and var1 and var1:IsDescendantOf(game) then
			guiService.SelectedCoreObject = var1
		end
		p1.onCaptureEnd()
	end)
end