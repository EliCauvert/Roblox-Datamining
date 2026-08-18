local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local telemetryService = game:GetService("TelemetryService")
local modules = coreGuiService.RobloxGui.Modules
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	wait()
	localPlayer = playersService.LocalPlayer
end
local networkPauseNotificationModule = require(modules.NetworkPauseNotification)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local gameplayPauseFlickerMitigation = game:DefineFastFlag("GameplayPauseFlickerMitigation", false)
local rapidGameplayPauseIntervalMs = game:DefineFastInt("RapidGameplayPauseIntervalMs", 1000)
local rapidGameplayPauseMinNotificationDurationMs = game:DefineFastInt("RapidGameplayPauseMinNotificationDurationMs", 500)
local gameplayPauseShowDelayMs = game:DefineFastInt("GameplayPauseShowDelayMs", 300)
local streamingPauseUIAnalyticsEnabled = game:DefineFastFlag("StreamingPauseUIAnalyticsEnabled", false)
local t = {
	eventName = "StreamingPauseUISessionStats",
	description = "Session stats for streaming pause UI visibility",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("StreamingPauseUIAnalyticsThrottleHP", 0),
	lastUpdated = { 2026, 6, 2 }
}
local processTime = os.clock()
local var14 = 0
local var15 = 0
local var16 = nil
local frozen = table.freeze({
	UNPAUSED = "unpaused",
	PENDING_SHOW = "pendingShow",
	PAUSED = "paused",
	RAPID_PAUSE_PENDING_DISMISS = "rapidPausePendingDismiss"
})
local var18 = true
local UNPAUSED = frozen.UNPAUSED
local var19 = -1e999
local var20 = false
local var21 = nil
local var22 = nil
local var23 = networkPauseNotificationModule.new()
local var24 = create("ScreenGui")({
	Name = "RobloxNetworkPauseNotification",
	OnTopOfCoreBlur = true,
	DisplayOrder = 8,
	IgnoreGuiInset = false,
	AutoLocalize = false,
	Parent = coreGuiService
})

local function reportPauseSessionAnalytics() --[[ line: 85 ]]
	-- upvalues: var15 (write), var16 (write), telemetryService (ref), t (ref), processTime (ref), var14 (write), var24 (ref)
	local var30 = var15
	
	if var16 ~= nil then
		var30 += (os.clock() - var16) * 1000
	end
	telemetryService:LogEvent(t, {
		customFields = {
			sessionDurationMs = (os.clock() - processTime) * 1000,
			pauseCount = var14,
			totalPauseDurationMs = var30,
			pauseEnabled = var24.Enabled
		}
	})
end

local function _(value) --[[ line: 101 | named "setNotificationVisible" ]]
	-- upvalues: var23 (ref), runService (ref), streamingPauseUIAnalyticsEnabled (ref), var16 (write), var14 (write), var15 (write)
	if value then
		var23:Show()
	else
		var23:Hide()
	end
	runService:SetRobloxGuiFocused(value)
	
	if streamingPauseUIAnalyticsEnabled then
		if value then
			if var16 == nil then
				var16 = os.clock()
				var14 += 1
				
				return
			end
		elseif var16 ~= nil then
			var15 += (os.clock() - var16) * 1000
			var16 = nil
		end
	end
end

local _ = function() --[[ line: 125 | named "cancelTimers" ]]
	-- upvalues: var21 (write), var22 (write)
	if var21 ~= nil then
		task.cancel(var21)
		var21 = nil
	end
	if var22 ~= nil then
		task.cancel(var22)
		var22 = nil
	end
end

local _ = function() --[[ line: 136 | named "isRapidRepause" ]]
	-- upvalues: var19 (write), rapidGameplayPauseIntervalMs (ref)
	return (os.clock() - var19) * 1000 < rapidGameplayPauseIntervalMs
end

local function enterStage(p0) --[[ line: 140 ]]
	-- upvalues: UNPAUSED (write), var21 (write), var22 (write), frozen (ref), var20 (write), var23 (ref), runService (ref), streamingPauseUIAnalyticsEnabled (ref), var16 (write), var15 (write), gameplayPauseShowDelayMs (ref), localPlayer (write), var24 (ref), enterStage (ref), var19 (write), rapidGameplayPauseIntervalMs (ref), var14 (write), rapidGameplayPauseMinNotificationDurationMs (ref)
	UNPAUSED = p0
	
	if var21 ~= nil then
		task.cancel(var21)
		var21 = nil
	end
	if var22 ~= nil then
		task.cancel(var22)
		var22 = nil
	end
	if p0 == frozen.UNPAUSED then
		var20 = false
		var23:Hide()
		runService:SetRobloxGuiFocused(false)
		
		if streamingPauseUIAnalyticsEnabled and var16 ~= nil then
			var15 += (os.clock() - var16) * 1000
			var16 = nil
			
			return
		end
	elseif p0 == frozen.PENDING_SHOW then
		var21 = task.delay(gameplayPauseShowDelayMs / 1000, function() --[[ line: 149 ]]
			-- upvalues: var21 (copy), UNPAUSED (copy), frozen (copy), localPlayer (copy), var24 (copy), enterStage (copy)
			var21 = nil
			
			if UNPAUSED == frozen.PENDING_SHOW and localPlayer.GameplayPaused and var24.Enabled then
				enterStage(frozen.PAUSED)
			end
		end)
		
		return
	elseif p0 == frozen.PAUSED then
		var20 = (os.clock() - var19) * 1000 < rapidGameplayPauseIntervalMs
		var23:Show()
		runService:SetRobloxGuiFocused(true)
		
		if streamingPauseUIAnalyticsEnabled and var16 == nil then
			var16 = os.clock()
			var14 += 1
			
			return
		end
	elseif p0 == frozen.RAPID_PAUSE_PENDING_DISMISS then
		var22 = task.delay(rapidGameplayPauseMinNotificationDurationMs / 1000, function() --[[ line: 162 ]]
			-- upvalues: var22 (copy), UNPAUSED (copy), frozen (copy), localPlayer (copy), enterStage (copy)
			var22 = nil
			
			if UNPAUSED == frozen.RAPID_PAUSE_PENDING_DISMISS and not localPlayer.GameplayPaused then
				enterStage(frozen.UNPAUSED)
			end
		end)
	end
end

local function onGameplayPausedChanged() --[[ line: 172 ]]
	-- upvalues: localPlayer (write), var24 (ref), var18 (write), UNPAUSED (write), frozen (ref), var19 (write), rapidGameplayPauseIntervalMs (ref), enterStage (ref), var20 (write)
	local var31 = localPlayer.GameplayPaused and (var24.Enabled and not var18)
	var18 = false
	
	if var31 then
		if UNPAUSED == frozen.RAPID_PAUSE_PENDING_DISMISS or (os.clock() - var19) * 1000 < rapidGameplayPauseIntervalMs then
			enterStage(frozen.PAUSED)
			
			return
		end
		enterStage(frozen.PENDING_SHOW)
		
		return
	elseif UNPAUSED ~= frozen.UNPAUSED then
		var19 = os.clock()
	end
	if UNPAUSED == frozen.PENDING_SHOW then
		enterStage(frozen.UNPAUSED)
		
		return
	elseif var20 then
		enterStage(frozen.RAPID_PAUSE_PENDING_DISMISS)
		
		return
	end
	enterStage(frozen.UNPAUSED)
end

local function togglePauseState() --[[ line: 201 ]]
	-- upvalues: localPlayer (write), var24 (ref), var18 (write), var23 (ref), runService (ref)
	local var32 = localPlayer.GameplayPaused and (var24.Enabled and not var18)
	var18 = false
	
	if var32 then
		var23:Show()
	else
		var23:Hide()
	end
	runService:SetRobloxGuiFocused(var32)
end

if gameplayPauseFlickerMitigation then
	localPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(onGameplayPausedChanged)
else
	localPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(togglePauseState)
end
local function enableNotification(p1) --[[ line: 218 ]]
	-- upvalues: var24 (ref), gameplayPauseFlickerMitigation (ref), onGameplayPausedChanged (ref), enterStage (ref), frozen (ref), localPlayer (write), var18 (write), var23 (ref), runService (ref)
	assert(type(p1) == "boolean", "Specified argument 'enabled' must be of type boolean")
	
	if p1 == var24.Enabled then return end
	var24.Enabled = p1
	
	if gameplayPauseFlickerMitigation then
		if p1 then
			onGameplayPausedChanged()
			
			return
		end
		enterStage(frozen.UNPAUSED)
		
		return
	else
		local var33 = localPlayer.GameplayPaused and (var24.Enabled and not var18)
		var18 = false
		
		if var33 then
			var23:Show()
		else
			var23:Hide()
		end
		runService:SetRobloxGuiFocused(var33)
	end
end

var23:SetParent(var24)
guiService.NetworkPausedEnabledChanged:Connect(enableNotification)

if gameplayPauseFlickerMitigation and streamingPauseUIAnalyticsEnabled then
	game.Close:Connect(reportPauseSessionAnalytics)
end