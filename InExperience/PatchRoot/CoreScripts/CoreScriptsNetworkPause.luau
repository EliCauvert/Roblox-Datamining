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
local var13 = 0
local var14 = 0
local var15 = nil
local frozen = table.freeze({
	UNPAUSED = "unpaused",
	PENDING_SHOW = "pendingShow",
	PAUSED = "paused",
	RAPID_PAUSE_PENDING_DISMISS = "rapidPausePendingDismiss"
})
local var17 = true
local UNPAUSED = frozen.UNPAUSED
local var18 = -1e999
local var19 = false
local var20 = nil
local var21 = nil
local var22 = networkPauseNotificationModule.new()
local var23 = create("ScreenGui")({
	Name = "RobloxNetworkPauseNotification",
	OnTopOfCoreBlur = true,
	DisplayOrder = 8,
	IgnoreGuiInset = false,
	AutoLocalize = false,
	Parent = coreGuiService
})

local function reportPauseSessionAnalytics()
	-- upvalues: var14 (write), var15 (write), telemetryService (ref), t (ref), processTime (ref), var13 (write), var23 (ref)
	local var28 = var14
	
	if var15 ~= nil then
		var28 += (os.clock() - var15) * 1000
	end
	telemetryService:LogEvent(t, {
		customFields = {
			sessionDurationMs = (os.clock() - processTime) * 1000,
			pauseCount = var13,
			totalPauseDurationMs = var28,
			pauseEnabled = var23.Enabled
		}
	})
end

local function _(value)
	-- upvalues: var22 (ref), runService (ref), streamingPauseUIAnalyticsEnabled (ref), var15 (write), var13 (write), var14 (write)
	if value then
		var22:Show()
	else
		var22:Hide()
	end
	runService:SetRobloxGuiFocused(value)
	
	if streamingPauseUIAnalyticsEnabled then
		if value then
			if var15 == nil then
				var15 = os.clock()
				var13 += 1
				
				return
			end
		elseif var15 ~= nil then
			var14 += (os.clock() - var15) * 1000
			var15 = nil
		end
	end
end

local _ = function()
	-- upvalues: var20 (write), var21 (write)
	if var20 ~= nil then
		task.cancel(var20)
		var20 = nil
	end
	if var21 ~= nil then
		task.cancel(var21)
		var21 = nil
	end
end

local _ = function()
	-- upvalues: var18 (write), rapidGameplayPauseIntervalMs (ref)
	return (os.clock() - var18) * 1000 < rapidGameplayPauseIntervalMs
end

local function enterStage(p0)
	-- upvalues: UNPAUSED (write), var20 (write), var21 (write), frozen (ref), var19 (write), var22 (ref), runService (ref), streamingPauseUIAnalyticsEnabled (ref), var15 (write), var14 (write), gameplayPauseShowDelayMs (ref), localPlayer (write), var23 (ref), enterStage (ref), var18 (write), rapidGameplayPauseIntervalMs (ref), var13 (write), rapidGameplayPauseMinNotificationDurationMs (ref)
	UNPAUSED = p0
	
	if var20 ~= nil then
		task.cancel(var20)
		var20 = nil
	end
	if var21 ~= nil then
		task.cancel(var21)
		var21 = nil
	end
	if p0 == frozen.UNPAUSED then
		var19 = false
		var22:Hide()
		runService:SetRobloxGuiFocused(false)
		
		if streamingPauseUIAnalyticsEnabled and var15 ~= nil then
			var14 += (os.clock() - var15) * 1000
			var15 = nil
			
			return
		end
	elseif p0 == frozen.PENDING_SHOW then
		var20 = task.delay(gameplayPauseShowDelayMs / 1000, function()
			-- upvalues: var20 (copy), UNPAUSED (copy), frozen (copy), localPlayer (copy), var23 (copy), enterStage (copy)
			var20 = nil
			
			if UNPAUSED == frozen.PENDING_SHOW and localPlayer.GameplayPaused and var23.Enabled then
				enterStage(frozen.PAUSED)
			end
		end)
		
		return
	elseif p0 == frozen.PAUSED then
		var19 = (os.clock() - var18) * 1000 < rapidGameplayPauseIntervalMs
		var22:Show()
		runService:SetRobloxGuiFocused(true)
		
		if streamingPauseUIAnalyticsEnabled and var15 == nil then
			var15 = os.clock()
			var13 += 1
			
			return
		end
	elseif p0 == frozen.RAPID_PAUSE_PENDING_DISMISS then
		var21 = task.delay(rapidGameplayPauseMinNotificationDurationMs / 1000, function()
			-- upvalues: var21 (copy), UNPAUSED (copy), frozen (copy), localPlayer (copy), enterStage (copy)
			var21 = nil
			
			if UNPAUSED == frozen.RAPID_PAUSE_PENDING_DISMISS and not localPlayer.GameplayPaused then
				enterStage(frozen.UNPAUSED)
			end
		end)
	end
end

local function onGameplayPausedChanged()
	-- upvalues: localPlayer (write), var23 (ref), var17 (write), UNPAUSED (write), frozen (ref), var18 (write), rapidGameplayPauseIntervalMs (ref), enterStage (ref), var19 (write)
	local var29 = localPlayer.GameplayPaused and (var23.Enabled and not var17)
	var17 = false
	
	if var29 then
		if UNPAUSED == frozen.RAPID_PAUSE_PENDING_DISMISS or (os.clock() - var18) * 1000 < rapidGameplayPauseIntervalMs then
			enterStage(frozen.PAUSED)
			
			return
		end
		enterStage(frozen.PENDING_SHOW)
		
		return
	elseif UNPAUSED ~= frozen.UNPAUSED then
		var18 = os.clock()
	end
	if UNPAUSED == frozen.PENDING_SHOW then
		enterStage(frozen.UNPAUSED)
		
		return
	elseif var19 then
		enterStage(frozen.RAPID_PAUSE_PENDING_DISMISS)
		
		return
	end
	enterStage(frozen.UNPAUSED)
end

localPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(onGameplayPausedChanged)

local function enableNotification(p1)
	-- upvalues: var23 (ref), onGameplayPausedChanged (ref), enterStage (ref), frozen (ref)
	assert(type(p1) == "boolean", "Specified argument 'enabled' must be of type boolean")
	
	if p1 == var23.Enabled then return end
	var23.Enabled = p1
	
	if p1 then
		onGameplayPausedChanged()
		
		return
	end
	enterStage(frozen.UNPAUSED)
end

var22:SetParent(var23)
guiService.NetworkPausedEnabledChanged:Connect(enableNotification)

if streamingPauseUIAnalyticsEnabled then
	game.Close:Connect(reportPauseSessionAnalytics)
end