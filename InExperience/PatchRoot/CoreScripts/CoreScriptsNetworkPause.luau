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
local t = {
	eventName = "StreamingPauseUISessionStats",
	description = "Session stats for streaming pause UI visibility",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("StreamingPauseUIAnalyticsThrottleHP", 0),
	lastUpdated = { 2026, 6, 2 }
}
local processTime = os.clock()
local var1 = 0
local var2 = 0
local var3 = nil
local frozen = table.freeze({
	UNPAUSED = "unpaused",
	PENDING_SHOW = "pendingShow",
	PAUSED = "paused",
	RAPID_PAUSE_PENDING_DISMISS = "rapidPausePendingDismiss"
})
local var4 = true
local UNPAUSED = frozen.UNPAUSED
local var5 = -1e999
local var6 = false
local var7 = nil
local var8 = nil
local var9 = networkPauseNotificationModule.new()
local var10 = create("ScreenGui")({
	Name = "RobloxNetworkPauseNotification",
	OnTopOfCoreBlur = true,
	DisplayOrder = 8,
	IgnoreGuiInset = false,
	AutoLocalize = false,
	Parent = coreGuiService
})

local function reportPauseSessionAnalytics()
	-- upvalues: var2 (write), var3 (write), telemetryService (ref), t (ref), processTime (ref), var1 (write), var10 (ref)
	local var11 = var2
	
	if var3 ~= nil then
		var11 += (os.clock() - var3) * 1000
	end
	telemetryService:LogEvent(t, {
		customFields = {
			sessionDurationMs = (os.clock() - processTime) * 1000,
			pauseCount = var1,
			totalPauseDurationMs = var11,
			pauseEnabled = var10.Enabled
		}
	})
end

local function _(value)
	-- upvalues: var9 (ref), runService (ref), var3 (write), var1 (write), var2 (write)
	if value then
		var9:Show()
	else
		var9:Hide()
	end
	runService:SetRobloxGuiFocused(value)
	
	if value then
		if var3 == nil then
			var3 = os.clock()
			var1 += 1
			
			return
		end
	elseif var3 ~= nil then
		var2 += (os.clock() - var3) * 1000
		var3 = nil
	end
end

local _ = function()
	-- upvalues: var7 (write), var8 (write)
	if var7 ~= nil then
		task.cancel(var7)
		var7 = nil
	end
	if var8 ~= nil then
		task.cancel(var8)
		var8 = nil
	end
end

local _ = function()
	-- upvalues: var5 (write), rapidGameplayPauseIntervalMs (ref)
	return (os.clock() - var5) * 1000 < rapidGameplayPauseIntervalMs
end

local function enterStage(p1)
	-- upvalues: UNPAUSED (write), var7 (write), var8 (write), frozen (ref), var6 (write), var9 (ref), runService (ref), var3 (write), var2 (write), gameplayPauseShowDelayMs (ref), localPlayer (write), var10 (ref), enterStage (ref), var5 (write), rapidGameplayPauseIntervalMs (ref), var1 (write), rapidGameplayPauseMinNotificationDurationMs (ref)
	UNPAUSED = p1
	
	if var7 ~= nil then
		task.cancel(var7)
		var7 = nil
	end
	if var8 ~= nil then
		task.cancel(var8)
		var8 = nil
	end
	if p1 == frozen.UNPAUSED then
		var6 = false
		var9:Hide()
		runService:SetRobloxGuiFocused(false)
		
		if var3 == nil then
			return
		else
			var2 += (os.clock() - var3) * 1000
			var3 = nil
			
			return
		end
	elseif p1 == frozen.PENDING_SHOW then
		var7 = task.delay(gameplayPauseShowDelayMs / 1000, function()
			-- upvalues: var7 (copy), UNPAUSED (copy), frozen (copy), localPlayer (copy), var10 (copy), enterStage (copy)
			var7 = nil
			
			if UNPAUSED == frozen.PENDING_SHOW and localPlayer.GameplayPaused and var10.Enabled then
				enterStage(frozen.PAUSED)
			end
		end)
		
		return
	elseif p1 == frozen.PAUSED then
		var6 = (os.clock() - var5) * 1000 < rapidGameplayPauseIntervalMs
		var9:Show()
		runService:SetRobloxGuiFocused(true)
		
		if var3 == nil then
			var3 = os.clock()
			var1 += 1
			
			return
		end
	elseif p1 == frozen.RAPID_PAUSE_PENDING_DISMISS then
		var8 = task.delay(rapidGameplayPauseMinNotificationDurationMs / 1000, function()
			-- upvalues: var8 (copy), UNPAUSED (copy), frozen (copy), localPlayer (copy), enterStage (copy)
			var8 = nil
			
			if UNPAUSED == frozen.RAPID_PAUSE_PENDING_DISMISS and not localPlayer.GameplayPaused then
				enterStage(frozen.UNPAUSED)
			end
		end)
	end
end

local function onGameplayPausedChanged()
	-- upvalues: localPlayer (write), var10 (ref), var4 (write), UNPAUSED (write), frozen (ref), var5 (write), rapidGameplayPauseIntervalMs (ref), enterStage (ref), var6 (write)
	local var11 = localPlayer.GameplayPaused and (var10.Enabled and not var4)
	var4 = false
	
	if var11 then
		if UNPAUSED == frozen.RAPID_PAUSE_PENDING_DISMISS or (os.clock() - var5) * 1000 < rapidGameplayPauseIntervalMs then
			enterStage(frozen.PAUSED)
			
			return
		end
		enterStage(frozen.PENDING_SHOW)
		
		return
	elseif UNPAUSED ~= frozen.UNPAUSED then
		var5 = os.clock()
	end
	if UNPAUSED == frozen.PENDING_SHOW then
		enterStage(frozen.UNPAUSED)
		
		return
	elseif var6 then
		enterStage(frozen.RAPID_PAUSE_PENDING_DISMISS)
		
		return
	end
	enterStage(frozen.UNPAUSED)
end

localPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(onGameplayPausedChanged)

local function enableNotification(p1)
	-- upvalues: var10 (ref), onGameplayPausedChanged (ref), enterStage (ref), frozen (ref)
	assert(type(p1) == "boolean", "Specified argument 'enabled' must be of type boolean")
	
	if p1 == var10.Enabled then return end
	var10.Enabled = p1
	
	if p1 then
		onGameplayPausedChanged()
		
		return
	end
	enterStage(frozen.UNPAUSED)
end

var9:SetParent(var10)
guiService.NetworkPausedEnabledChanged:Connect(enableNotification)
game.Close:Connect(reportPauseSessionAnalytics)