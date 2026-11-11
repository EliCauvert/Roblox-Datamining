local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local TelemetryService = game:GetService("TelemetryService")
local Modules = CoreGui.RobloxGui.Modules
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	wait()
	LocalPlayer = Players.LocalPlayer
end
local GameplayPauseFlickerMitigation = game:DefineFastFlag("GameplayPauseFlickerMitigation", false)
local RapidGameplayPauseIntervalMs = game:DefineFastInt("RapidGameplayPauseIntervalMs", 1000)
local RapidGameplayPauseMinNotificationDurationMs = game:DefineFastInt("RapidGameplayPauseMinNotificationDurationMs", 500)
local GameplayPauseShowDelayMs = game:DefineFastInt("GameplayPauseShowDelayMs", 300)
local StreamingPauseUIAnalyticsEnabled = game:DefineFastFlag("StreamingPauseUIAnalyticsEnabled", false)
local config = {
	eventName = "StreamingPauseUISessionStats",
	description = "Session stats for streaming pause UI visibility",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("StreamingPauseUIAnalyticsThrottleHP", 0),
	lastUpdated = { 2026, 6, 2 }
}
local ClockTime = os.clock()
local Count = 0
local NewClockTime = 0
local ClockTime1 = nil
local Frozen = table.freeze({
	UNPAUSED = "unpaused",
	PENDING_SHOW = "pendingShow",
	PAUSED = "paused",
	RAPID_PAUSE_PENDING_DISMISS = "rapidPausePendingDismiss"
})
local Flag = true
local UNPAUSED = Frozen.UNPAUSED
local ClockTime2 = -1e999
local IsClockTimeBelow = false
local DelayedThread = nil
local DelayedThread1 = nil
local NewResult = require(Modules.NetworkPauseNotification).new()
local v1 = require(CorePackages.Workspace.Packages.AppCommonLib).Create("ScreenGui")({
	Name = "RobloxNetworkPauseNotification",
	OnTopOfCoreBlur = true,
	DisplayOrder = 8,
	IgnoreGuiInset = false,
	AutoLocalize = false,
	Parent = CoreGui
})

local function reportPauseSessionAnalytics()
	-- upvalues: NewClockTime (ref), ClockTime1 (ref), TelemetryService (copy), config (copy), ClockTime (copy), Count (ref), v1 (copy)
	local NewClockTime1 = NewClockTime
	
	if ClockTime1 ~= nil then
		NewClockTime1 += (os.clock() - ClockTime1) * 1000
	end
	TelemetryService:LogEvent(config, {
		customFields = {
			sessionDurationMs = (os.clock() - ClockTime) * 1000,
			pauseCount = Count,
			totalPauseDurationMs = NewClockTime1,
			pauseEnabled = v1.Enabled
		}
	})
end

local function _(Focus)
	-- upvalues: NewResult (copy), RunService (copy), StreamingPauseUIAnalyticsEnabled (copy), ClockTime1 (ref), Count (ref), NewClockTime (ref)
	if Focus then
		NewResult:Show()
	else
		NewResult:Hide()
	end
	RunService:SetRobloxGuiFocused(Focus)
	
	if StreamingPauseUIAnalyticsEnabled then
		if Focus then
			if ClockTime1 == nil then
				ClockTime1 = os.clock()
				Count += 1
				
				return
			end
		elseif ClockTime1 ~= nil then
			NewClockTime += (os.clock() - ClockTime1) * 1000
			ClockTime1 = nil
		end
	end
end

local _ = function()
	-- upvalues: DelayedThread (ref), DelayedThread1 (ref)
	if DelayedThread ~= nil then
		task.cancel(DelayedThread)
		DelayedThread = nil
	end
	if DelayedThread1 ~= nil then
		task.cancel(DelayedThread1)
		DelayedThread1 = nil
	end
end

local _ = function(): boolean
	-- upvalues: ClockTime2 (ref), RapidGameplayPauseIntervalMs (copy)
	return (os.clock() - ClockTime2) * 1000 < RapidGameplayPauseIntervalMs
end

local function enterStage(UNPAUSED1)
	-- upvalues: UNPAUSED (ref), DelayedThread (ref), DelayedThread1 (ref), Frozen (copy), IsClockTimeBelow (ref), NewResult (copy), RunService (copy), StreamingPauseUIAnalyticsEnabled (copy), ClockTime1 (ref), NewClockTime (ref), GameplayPauseShowDelayMs (copy), LocalPlayer (ref), v1 (copy), enterStage (copy), ClockTime2 (ref), RapidGameplayPauseIntervalMs (copy), Count (ref), RapidGameplayPauseMinNotificationDurationMs (copy)
	UNPAUSED = UNPAUSED1
	
	if DelayedThread ~= nil then
		task.cancel(DelayedThread)
		DelayedThread = nil
	end
	if DelayedThread1 ~= nil then
		task.cancel(DelayedThread1)
		DelayedThread1 = nil
	end
	if UNPAUSED1 == Frozen.UNPAUSED then
		IsClockTimeBelow = false
		NewResult:Hide()
		RunService:SetRobloxGuiFocused(false)
		
		if StreamingPauseUIAnalyticsEnabled and ClockTime1 ~= nil then
			NewClockTime += (os.clock() - ClockTime1) * 1000
			ClockTime1 = nil
			
			return
		end
	elseif UNPAUSED1 == Frozen.PENDING_SHOW then
		DelayedThread = task.delay(GameplayPauseShowDelayMs / 1000, function()
			-- upvalues: DelayedThread (upval), UNPAUSED (upval), Frozen (upval), LocalPlayer (upval), v1 (upval), enterStage (upval)
			DelayedThread = nil
			
			if UNPAUSED == Frozen.PENDING_SHOW and LocalPlayer.GameplayPaused and v1.Enabled then
				enterStage(Frozen.PAUSED)
			end
		end)
		
		return
	else
		if UNPAUSED1 == Frozen.PAUSED then
			IsClockTimeBelow = (os.clock() - ClockTime2) * 1000 < RapidGameplayPauseIntervalMs
			NewResult:Show()
			RunService:SetRobloxGuiFocused(true)
			
			if StreamingPauseUIAnalyticsEnabled and ClockTime1 == nil then
				ClockTime1 = os.clock()
				Count += 1
				
				return
			end
		elseif UNPAUSED1 == Frozen.RAPID_PAUSE_PENDING_DISMISS then
			DelayedThread1 = task.delay(RapidGameplayPauseMinNotificationDurationMs / 1000, function()
				-- upvalues: DelayedThread1 (upval), UNPAUSED (upval), Frozen (upval), LocalPlayer (upval), enterStage (upval)
				DelayedThread1 = nil
				
				if UNPAUSED == Frozen.RAPID_PAUSE_PENDING_DISMISS and not LocalPlayer.GameplayPaused then
					enterStage(Frozen.UNPAUSED)
				end
			end)
		end
	end
end

local function onGameplayPausedChanged()
	-- upvalues: LocalPlayer (ref), v1 (copy), Flag (ref), UNPAUSED (ref), Frozen (copy), ClockTime2 (ref), RapidGameplayPauseIntervalMs (copy), enterStage (copy), IsClockTimeBelow (ref)
	local NoFlag: boolean = LocalPlayer.GameplayPaused and (v1.Enabled and not Flag)
	Flag = false
	
	if not NoFlag then
		if UNPAUSED ~= Frozen.UNPAUSED then
			ClockTime2 = os.clock()
		end
		if UNPAUSED == Frozen.PENDING_SHOW then
			enterStage(Frozen.UNPAUSED)
			
			return
		end
		if IsClockTimeBelow then
			enterStage(Frozen.RAPID_PAUSE_PENDING_DISMISS)
			
			return
		else
			enterStage(Frozen.UNPAUSED)
			
			return
		end
	elseif UNPAUSED == Frozen.RAPID_PAUSE_PENDING_DISMISS or (os.clock() - ClockTime2) * 1000 < RapidGameplayPauseIntervalMs then
		enterStage(Frozen.PAUSED)
		
		return
	else
		enterStage(Frozen.PENDING_SHOW)
	end
end

local function togglePauseState()
	-- upvalues: LocalPlayer (ref), v1 (copy), Flag (ref), NewResult (copy), RunService (copy)
	local NoFlag: boolean = LocalPlayer.GameplayPaused and (v1.Enabled and not Flag)
	Flag = false
	
	if NoFlag then
		NewResult:Show()
	else
		NewResult:Hide()
	end
	RunService:SetRobloxGuiFocused(NoFlag)
end

if GameplayPauseFlickerMitigation then
	LocalPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(onGameplayPausedChanged)
else
	LocalPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(togglePauseState)
end
local function enableNotification(Enabled)
	-- upvalues: v1 (copy), GameplayPauseFlickerMitigation (copy), onGameplayPausedChanged (copy), enterStage (copy), Frozen (copy), LocalPlayer (ref), Flag (ref), NewResult (copy), RunService (copy)
	assert(type(Enabled) == "boolean", "Specified argument 'enabled' must be of type boolean")
	
	if Enabled == v1.Enabled then return end
	v1.Enabled = Enabled
	
	if not GameplayPauseFlickerMitigation then
		local NoFlag: boolean = LocalPlayer.GameplayPaused and (v1.Enabled and not Flag)
		Flag = false
		
		if NoFlag then
			NewResult:Show()
		else
			NewResult:Hide()
		end
		RunService:SetRobloxGuiFocused(NoFlag)
		
		return
	elseif Enabled then
		onGameplayPausedChanged()
		
		return
	else
		enterStage(Frozen.UNPAUSED)
	end
end

NewResult:SetParent(v1)
GuiService.NetworkPausedEnabledChanged:Connect(enableNotification)

if GameplayPauseFlickerMitigation and StreamingPauseUIAnalyticsEnabled then
	game.Close:Connect(reportPauseSessionAnalytics)
end