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

local function defaultGetWaitFrames() --[[ line: 62 ]]
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames
end

local function defaultGetWaitTime() --[[ line: 69 ]]
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return (if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames) / 60
end

local function defaultDeps() --[[ line: 73 ]]
	-- upvalues: screenshotManager (ref), avatarIdentification (ref), adIdentification (ref), runService (ref), defaultGetWaitFrames (ref), defaultGetWaitTime (ref)
	return {
		takeScreenshot = function(p0) --[[ line: 75 ]]
			-- upvalues: screenshotManager (copy)
			return screenshotManager:TakeScreenshotWithCallback(p0)
		end,
		getVisibleAvatars = function() --[[ line: 78 ]]
			-- upvalues: avatarIdentification (copy)
			return avatarIdentification.getVisibleAvatars()
		end,
		getVisibleAds = function() --[[ line: 81 ]]
			-- upvalues: adIdentification (copy)
			return adIdentification.getVisibleAds()
		end,
		runService = runService,
		getWaitFrames = defaultGetWaitFrames,
		getWaitTime = defaultGetWaitTime
	}
end

local function _(p1) --[[ line: 90 | named "runIdentification" ]]
	local visibleAvatars, visibleAvatars_1 = p1.getVisibleAvatars()
	local visibleAds, visibleAds_1 = p1.getVisibleAds()
	
	return {
		identifiedAvatars = visibleAvatars,
		identifiedAds = visibleAds,
		avatarIDStats = visibleAvatars_1,
		adIDStats = visibleAds_1
	}
end

return function(p2, p3) --[[ line: 101 | named "runScreenshotCaptureSequence" ]]
	-- upvalues: defaultDeps (ref), fFlagIEMTabFocusNav (ref), guiService (ref)
	p3 = p3 or defaultDeps()
	local var17 = if fFlagIEMTabFocusNav then guiService.SelectedCoreObject else nil
	p2.hide()
	local var18 = 0
	local processTime = os.clock()
	local var20 = false
	local heartbeatConnection = nil
	heartbeatConnection = p3.runService.Heartbeat:Connect(function() --[[ line: 116 ]]
		-- upvalues: var20 (write), var18 (write), p3 (ref), p2 (ref), processTime (ref), heartbeatConnection (write), fFlagIEMTabFocusNav (copy), var17 (write), guiService (copy)
		if not var20 and var18 >= 1 then
			var20 = true
			p3.takeScreenshot(p2.onScreenshotUploaded)
			p2.onScreenshotTaken()
			local onIdentificationCompleted = p2.onIdentificationCompleted
			local var22 = p3
			local visibleAvatars, visibleAvatars_1 = var22.getVisibleAvatars()
			local visibleAds, visibleAds_1 = var22.getVisibleAds()
			onIdentificationCompleted({
				identifiedAvatars = visibleAvatars,
				identifiedAds = visibleAds,
				avatarIDStats = visibleAvatars_1,
				adIDStats = visibleAds_1
			})
		end
		if not var20 or not (p3.getWaitFrames() <= var18) or not (p3.getWaitTime() <= os.clock() - processTime) then
			var18 += 1
			
			return
		end
		heartbeatConnection:Disconnect()
		p2.show()
		
		if fFlagIEMTabFocusNav and var17 and var17:IsDescendantOf(game) then
			guiService.SelectedCoreObject = var17
		end
		p2.onCaptureEnd()
	end)
end