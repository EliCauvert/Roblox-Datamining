local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local reactModule = require(corePackagesService.Packages.React)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceIndicatorFuncModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local voiceAnalyticsModule = require(robloxGui.Modules.Settings.Analytics.VoiceAnalytics)
local getFFlagEnableVoiceMuteAnalyticsModule = require(robloxGui.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics)
local enableChromeAudioFocusManagement = game:GetEngineFeature("AudioFocusManagement") and game:DefineFastFlag("EnableChromeAudioFocusManagement", false)
local micConsumerRegistry = game:DefineFastFlag("MicConsumerRegistry", false)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local redVoiceDotModule = require(chrome.Integrations.RedVoiceDot)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local useIsPlaytestModeModule = require(chrome.ChromeShared.Hooks.useIsPlaytestMode)
local fFlagEnablePlaytestModeUnibar = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnablePlaytestModeUnibar
local var1 = chromeUtilsModule.MappedSignal.new(default.muteChanged.Event, function()
	-- upvalues: default (ref)
	return default.localMuted == false
end)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local var2 = require(robloxGui.Modules.SelfView.Analytics).new()
local var3 = if getFFlagEnableVoiceMuteAnalyticsModule() then voiceAnalyticsModule.new(rbxAnalyticsService, "Chrome.Integrations.ToggleMic") else nil
local _ = nil

local var4 = function(_)
	-- upvalues: micConsumerRegistry (ref), default (ref), var2 (ref), var3 (write)
	if micConsumerRegistry then
		local micManager = default:GetMicManager()
		
		if micManager and not micManager:HasConsumer("voice_chat") and micManager:GetConsumerCount() > 0 then
			micManager:SetMicActiveForAllConsumers(micManager.localMuted ~= false, "ChromeIntegrationsToggleMic")
			var2:setLastCtx("SelfView")
			
			return
		end
	end
	default:ToggleMic("ChromeIntegrationsToggleMic")
	var2:setLastCtx("SelfView")
	
	if var3 then
		var3:onToggleMuteSelf(not default.localMuted)
	end
end

local var5 = function(_)
	-- upvalues: default (ref)
	default:RejoinPreviousChannel()
end

local var6 = function(_)
	-- upvalues: default (ref)
	default:ShowVoiceChatLoadingMessage()
end

local var7 = serviceModule:register({
	id = "toggle_mic_mute",
	label = if require(chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = sideSheetPlacement.Unibar,
	activated = var4,
	isActivated = var1,
	components = {
		Icon = function(_)
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), fFlagEnablePlaytestModeUnibar (ref), useIsPlaytestModeModule (ref), micConsumerRegistry (ref), default (ref), reactModule (ref), voiceIndicatorFuncModule (ref), playersService (ref), redVoiceDotModule (ref)
			local _ = nil
			local var8 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
			local var9 = if fFlagEnablePlaytestModeUnibar and (if fFlagEnablePlaytestModeUnibar then useIsPlaytestModeModule() else nil) then "MicDark" else "MicLight"
			
			if micConsumerRegistry then
				local micManager = default:GetMicManager()
				local var10 = not (micManager and micManager:HasConsumer("voice_chat")) and (micManager and micManager:GetConsumerCount() > 0)
				local var11, var12 = reactModule.useState((if micManager then micManager.localMuted else nil) ~= false)
				local var13, var14 = reactModule.useBinding(0)
				local _, var15 = reactModule.useState(0)
				reactModule.useEffect(function()
					-- upvalues: micManager (ref), var12 (ref), var14 (ref), var15 (ref)
					if micManager then
						local eventConnection = micManager.muteChanged.Event:Connect(function(p1)
							-- upvalues: var12 (copy)
							var12(p1 ~= false)
						end)
						local eventConnection_1 = micManager.levelChanged.Event:Connect(function(p1)
							-- upvalues: var14 (copy)
							var14(p1)
						end)
						local eventConnection_2 = micManager.hasConsumersChanged.Event:Connect(function()
							-- upvalues: var15 (copy)
							var15(function(p1)
								return p1 + 1
							end)
						end)
						
						return function()
							-- upvalues: eventConnection (ref), eventConnection_1 (ref), eventConnection_2 (ref)
							eventConnection:Disconnect()
							eventConnection_1:Disconnect()
							eventConnection_2:Disconnect()
						end
					end
				end, { micManager })
				local var16 = if var11 then "Muted" else "Unmuted"
				
				return if var10 then reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, var8, 0, var8),
					Image = if var11 then default:GetIcon(var16, var9) else var13:map(function(p1)
						-- upvalues: default (copy), var16 (ref), var9 (ref)
						return default:GetIcon(var16 .. tostring(p1), var9)
					end)
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var8, 0, var8)
				}, {
					reactModule.createElement(voiceIndicatorFuncModule, {
						hideOnError = false,
						selectable = false,
						showConnectingShimmer = true,
						userId = tostring(playersService.LocalPlayer.UserId),
						iconStyle = var9,
						size = UDim2.new(0, var8, 0, var8)
					}),
					reactModule.createElement(redVoiceDotModule, { position = UDim2.new(1, -7, 1, -7) })
				})
			end
		end
	}
})

local function applyVoiceUIVisibility()
	-- upvalues: default (ref), var7 (write)
	if default.voiceUIVisible then
		var7.availability:pinned()
		
		return
	end
	var7.availability:unavailable()
end

local function _()
	-- upvalues: default (ref), var7 (write)
	local micManager = default:GetMicManager()
	
	if micManager and micManager:GetConsumerCount() > 0 then
		var7.availability:pinned()
		
		return
	elseif not default.voiceUIVisible then
		var7.availability:unavailable()
	end
end

local function updateVoiceState(_, p1)
	-- upvalues: enableChromeAudioFocusManagement (ref), default (ref), var7 (write), micConsumerRegistry (ref), var5 (ref), var6 (ref), var4 (ref)
	local micManager
	if p1 ~= Enum.VoiceChatState.Ended then
		if not enableChromeAudioFocusManagement then
			var7.availability:pinned()
		elseif default.voiceUIVisible then
			var7.availability:pinned()
		else
			var7.availability:unavailable()
		end
	elseif micConsumerRegistry then
		micManager = default:GetMicManager()
		
		if micManager and micManager:GetConsumerCount() > 0 then
			var7.availability:pinned()
		elseif not default.voiceUIVisible then
			var7.availability:unavailable()
		end
	else
		var7.availability:unavailable()
	end
	micManager = p1 == Enum.VoiceChatState.Failed
	local var8 = if p1 ~= Enum.VoiceChatState.Joining then p1 == Enum.VoiceChatState.JoiningRetry else true
	
	if micManager then
		var7.activated = var5
		
		return
	elseif var8 then
		var7.activated = var6
		
		return
	end
	var7.activated = var4
end

if game:GetEngineFeature("VoiceChatSupported") then
	default:asyncInit():andThen(function()
		-- upvalues: default (ref), updateVoiceState (ref), enableChromeAudioFocusManagement (ref), applyVoiceUIVisibility (ref), var7 (write)
		local service = default:getService()
		
		if service then
			service.StateChanged:Connect(updateVoiceState)
			default:SetupParticipantListeners()
			
			if enableChromeAudioFocusManagement then
				default.showVoiceUI.Event:Connect(applyVoiceUIVisibility)
				default.hideVoiceUI.Event:Connect(applyVoiceUIVisibility)
				
				if default.voiceUIVisible then
					var7.availability:pinned()
					
					return
				end
				var7.availability:unavailable()
				
				return
			else
				var7.availability:pinned()
			end
		end
	end):catch(function() end)
end
if micConsumerRegistry then
	local micManager = default:GetMicManager()
	
	if micManager and micManager.hasConsumersChanged then
		micManager.hasConsumersChanged.Event:Connect(function()
			-- upvalues: default (ref), var7 (write), micManager (ref)
			local micManager_1 = default:GetMicManager()
			
			if micManager_1 and micManager_1:GetConsumerCount() > 0 then
				var7.availability:pinned()
			elseif not default.voiceUIVisible then
				var7.availability:unavailable()
			end
			micManager:SetMicIndicatorReady(micManager:GetConsumerCount() > 0)
		end)
		local micManager_1 = default:GetMicManager()
		
		if micManager_1 and micManager_1:GetConsumerCount() > 0 then
			var7.availability:pinned()
		elseif not default.voiceUIVisible then
			var7.availability:unavailable()
		end
		micManager:SetMicIndicatorReady(micManager:GetConsumerCount() > 0)
	end
end
return var7