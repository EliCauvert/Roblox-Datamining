local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local _ = require(script:FindFirstAncestor("AbuseReportMenu").Components.Types)
local FFlagIEMTabFocusNav = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local ScreenshotManager = require(CorePackages.Workspace.Packages.TnSScreenshot).ScreenshotManager
local AvatarIdentification = require(CorePackages.Workspace.Packages.TnSAvatarIdentification).AvatarIdentification
local AdIdentification = require(CorePackages.Workspace.Packages.TnSAdIdentification).AdIdentification
local AbuseReportMenuScreenshotReduceMotionWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local AbuseReportMenuScreenshotWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function defaultGetWaitFrames()
	-- upvalues: UserGameSettings (copy), AbuseReportMenuScreenshotReduceMotionWaitFrames (copy), AbuseReportMenuScreenshotWaitFrames (copy)
	return if UserGameSettings.ReducedMotion then AbuseReportMenuScreenshotReduceMotionWaitFrames else AbuseReportMenuScreenshotWaitFrames
end

local function defaultGetWaitTime()
	-- upvalues: UserGameSettings (copy), AbuseReportMenuScreenshotReduceMotionWaitFrames (copy), AbuseReportMenuScreenshotWaitFrames (copy)
	return (if UserGameSettings.ReducedMotion then AbuseReportMenuScreenshotReduceMotionWaitFrames else AbuseReportMenuScreenshotWaitFrames) / 60
end

local function defaultDeps()
	-- upvalues: ScreenshotManager (copy), AvatarIdentification (copy), AdIdentification (copy), RunService (copy), defaultGetWaitFrames (copy), defaultGetWaitTime (copy)
	return {
		takeScreenshot = function(OnScreenshotUploaded)
			-- upvalues: ScreenshotManager (upval)
			return ScreenshotManager:TakeScreenshotWithCallback(OnScreenshotUploaded)
		end,
		getVisibleAvatars = function()
			-- upvalues: AvatarIdentification (upval)
			return AvatarIdentification.getVisibleAvatars()
		end,
		getVisibleAds = function()
			-- upvalues: AdIdentification (upval)
			return AdIdentification.getVisibleAds()
		end,
		runService = RunService,
		getWaitFrames = defaultGetWaitFrames,
		getWaitTime = defaultGetWaitTime
	}
end

local function _(p1)
	local VisibleAvatars, VisibleAvatars2 = p1.getVisibleAvatars()
	local VisibleAds, VisibleAds2 = p1.getVisibleAds()
	
	return {
		identifiedAvatars = VisibleAvatars,
		identifiedAds = VisibleAds,
		avatarIDStats = VisibleAvatars2,
		adIDStats = VisibleAds2
	}
end

return function(p1, p2)
	-- upvalues: defaultDeps (copy), FFlagIEMTabFocusNav (copy), GuiService (copy)
	local P3 = p2 or defaultDeps()
	local SelectedCoreObject = if FFlagIEMTabFocusNav then GuiService.SelectedCoreObject else nil
	p1.hide()
	local Count = 0
	local ClockTime = os.clock()
	local Flag = false
	local Connection = nil
	Connection = P3.runService.Heartbeat:Connect(function()
		-- upvalues: Flag (ref), Count (ref), P3 (copy), p1 (copy), ClockTime (copy), Connection (ref), FFlagIEMTabFocusNav (upval), SelectedCoreObject (ref), GuiService (upval)
		if not Flag and Count >= 1 then
			Flag = true
			P3.takeScreenshot(p1.onScreenshotUploaded)
			p1.onScreenshotTaken()
			local OnIdentificationCompletedFunction: (any) -> () = p1.onIdentificationCompleted
			local VisibleAvatars, VisibleAvatars2 = P3.getVisibleAvatars()
			local VisibleAds, VisibleAds2 = P3.getVisibleAds()
			OnIdentificationCompletedFunction({
				identifiedAvatars = VisibleAvatars,
				identifiedAds = VisibleAds,
				avatarIDStats = VisibleAvatars2,
				adIDStats = VisibleAds2
			})
		end
		local IsWaitFramesBelow = P3.getWaitFrames() <= Count
		local IsClockTimeAbove = os.clock() - ClockTime >= P3.getWaitTime()
		
		if not Flag or not IsWaitFramesBelow or not IsClockTimeAbove then
			Count += 1
			
			return
		end
		Connection:Disconnect()
		p1.show()
		
		if FFlagIEMTabFocusNav and SelectedCoreObject and SelectedCoreObject:IsDescendantOf(game) then
			GuiService.SelectedCoreObject = SelectedCoreObject
		end
		p1.onCaptureEnd()
	end)
end