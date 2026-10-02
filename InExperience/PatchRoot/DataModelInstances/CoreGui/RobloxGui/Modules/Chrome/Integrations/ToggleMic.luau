local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local reactModule = require(corePackagesService.Packages.React)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local foundationModule = require(corePackagesService.Packages.Foundation)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceIndicatorFuncModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local fFlagProactiveVoiceRestrictionsUFRModule = require(robloxGui.Modules.VoiceChat.Flags.FFlagProactiveVoiceRestrictionsUFR)
local voiceAnalyticsModule = require(robloxGui.Modules.Settings.Analytics.VoiceAnalytics)
local getFFlagEnableVoiceMuteAnalyticsModule = require(robloxGui.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics)
local enableChromeAudioFocusManagement = game:GetEngineFeature("AudioFocusManagement") and game:DefineFastFlag("EnableChromeAudioFocusManagement", false)
local micConsumerRegistry = game:DefineFastFlag("MicConsumerRegistry", false)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local isVoiceChatSupportedModule = require(chrome.Integrations.isVoiceChatSupported)
local redVoiceDotModule = require(chrome.Integrations.RedVoiceDot)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local useIsPlaytestModeModule = require(chrome.ChromeShared.Hooks.useIsPlaytestMode)
local fFlagEnablePlaytestModeUnibar = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnablePlaytestModeUnibar
local var1 = if fFlagProactiveVoiceRestrictionsUFRModule then chromeUtilsModule.ObservableValue.new(false) else chromeUtilsModule.MappedSignal.new(default.muteChanged.Event, function()
	-- upvalues: default (ref)
	return default.localMuted == false
end)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local var2 = require(robloxGui.Modules.SelfView.Analytics).new()
local var3 = if getFFlagEnableVoiceMuteAnalyticsModule() then voiceAnalyticsModule.new(rbxAnalyticsService, "Chrome.Integrations.ToggleMic") else nil
local _ = nil

local function handleRestrictedActivation()
	-- upvalues: default (ref)
	local var4 = default:GetVoiceRestrictionState(false)
	
	if var4 == "restricted" then
		default:ShowVoiceRestriction()
	end
	return var4 ~= "normal"
end

local var4 = function(_)
	-- upvalues: fFlagProactiveVoiceRestrictionsUFRModule (ref), default (ref), micConsumerRegistry (ref), var2 (ref), var3 (write)
	if fFlagProactiveVoiceRestrictionsUFRModule then
		local var5 = default:GetVoiceRestrictionState(false)
		
		if var5 == "restricted" then
			default:ShowVoiceRestriction()
		end
		if var5 ~= "normal" then return end
	end
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
	-- upvalues: fFlagProactiveVoiceRestrictionsUFRModule (ref), default (ref)
	if fFlagProactiveVoiceRestrictionsUFRModule then
		local var6 = default:GetVoiceRestrictionState(false)
		
		if var6 == "restricted" then
			default:ShowVoiceRestriction()
		end
		if var6 ~= "normal" then
			return
		end
	end
	default:RejoinPreviousChannel()
end

local var6 = function(_)
	-- upvalues: fFlagProactiveVoiceRestrictionsUFRModule (ref), default (ref)
	if fFlagProactiveVoiceRestrictionsUFRModule then
		local var7 = default:GetVoiceRestrictionState(false)
		
		if var7 == "restricted" then
			default:ShowVoiceRestriction()
		end
		if var7 ~= "normal" then
			return
		end
	end
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
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), fFlagEnablePlaytestModeUnibar (ref), useIsPlaytestModeModule (ref), micConsumerRegistry (ref), default (ref), reactModule (ref), fFlagProactiveVoiceRestrictionsUFRModule (ref), signalsReactModule (ref), foundationModule (ref), voiceIndicatorFuncModule (ref), playersService (ref), redVoiceDotModule (ref)
			local _ = nil
			local var8 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
			local var9 = if fFlagEnablePlaytestModeUnibar and (if fFlagEnablePlaytestModeUnibar then useIsPlaytestModeModule() else nil) then "MicDark" else "MicLight"
			local imageLabel = nil
			
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
				local var17 = var13:map(function(p1)
					-- upvalues: default (copy), var16 (ref), var9 (ref)
					return default:GetIcon(var16 .. tostring(p1), var9)
				end)
				
				if var10 then
					imageLabel = reactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0, var8, 0, var8),
						Image = if var11 then default:GetIcon(var16, var9) else var17
					})
				end
			end
			return if fFlagProactiveVoiceRestrictionsUFRModule and (if fFlagProactiveVoiceRestrictionsUFRModule then signalsReactModule.useSignalState(function(p1)
				-- upvalues: default (copy)
				return default:GetVoiceRestrictionState(p1)
			end) else "normal") == "restricted" then reactModule.createElement(foundationModule.Image, {
				Image = "icons/controls/microphoneMute",
				imageStyle = { Transparency = 0.5 },
				Size = UDim2.fromOffset(var8, var8)
			}) else imageLabel or reactModule.createElement("Frame", {
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
	}
})

local function _(p1)
	-- upvalues: var1 (ref), default (ref)
	var1:set(p1 == "normal" and default.localMuted == false)
end

local _ = function()
	-- upvalues: default (ref), var7 (write), handleRestrictedActivation (ref)
	if default:GetVoiceRestrictionState(false) == "normal" then
		return false
	end
	var7.activated = handleRestrictedActivation
	var7.availability:unavailable()
	
	return true
end

local function observeMicPresentation()
	-- upvalues: signalsModule (ref), default (ref), var1 (ref), var7 (write), handleRestrictedActivation (ref)
	local var8 = signalsModule.createEffect(function(p1)
		-- upvalues: default (copy), var1 (copy), var7 (copy), handleRestrictedActivation (copy)
		var1:set(default:GetVoiceRestrictionState(p1) == "normal" and default.localMuted == false)
		
		if default:GetVoiceRestrictionState(false) == "normal" then
			return
		end
		var7.activated = handleRestrictedActivation
		var7.availability:unavailable()
	end)
	local eventConnection = default.muteChanged.Event:Connect(function()
		-- upvalues: default (copy), var1 (copy)
		var1:set(default:GetVoiceRestrictionState(false) == "normal" and default.localMuted == false)
	end)
	
	return function()
		-- upvalues: var8 (ref), eventConnection (ref)
		var8()
		eventConnection:Disconnect()
	end
end

local function applyVoiceUIVisibility()
	-- upvalues: fFlagProactiveVoiceRestrictionsUFRModule (ref), default (ref), var7 (write), handleRestrictedActivation (ref)
	if fFlagProactiveVoiceRestrictionsUFRModule then
		local var8
		if default:GetVoiceRestrictionState(false) == "normal" then
			var8 = false
		else
			var7.activated = handleRestrictedActivation
			var7.availability:unavailable()
			var8 = true
		end
		if var8 then return end
	end
	if default.voiceUIVisible then
		var7.availability:pinned()
		
		return
	end
	var7.availability:unavailable()
end

local function updateMicAvailabilityFromConsumers()
	-- upvalues: fFlagProactiveVoiceRestrictionsUFRModule (ref), default (ref), var7 (write), handleRestrictedActivation (ref)
	if fFlagProactiveVoiceRestrictionsUFRModule then
		local var8
		if default:GetVoiceRestrictionState(false) == "normal" then
			var8 = false
		else
			var7.activated = handleRestrictedActivation
			var7.availability:unavailable()
			var8 = true
		end
		if var8 then return end
	end
	local micManager = default:GetMicManager()
	
	if micManager and micManager:GetConsumerCount() > 0 then
		var7.availability:pinned()
		
		return
	elseif not default.voiceUIVisible then
		var7.availability:unavailable()
	end
end

local function updateVoiceState(_, p1)
	-- upvalues: fFlagProactiveVoiceRestrictionsUFRModule (ref), default (ref), var7 (write), handleRestrictedActivation (ref), enableChromeAudioFocusManagement (ref), micConsumerRegistry (ref), updateMicAvailabilityFromConsumers (ref), var5 (ref), var6 (ref), var4 (ref)
	if fFlagProactiveVoiceRestrictionsUFRModule then
		local var8
		if default:GetVoiceRestrictionState(false) == "normal" then
			var8 = false
		else
			var7.activated = handleRestrictedActivation
			var7.availability:unavailable()
			var8 = true
		end
		if var8 then return end
	end
	if p1 ~= Enum.VoiceChatState.Ended then
		if enableChromeAudioFocusManagement then
			if fFlagProactiveVoiceRestrictionsUFRModule then
				local var9
				if default:GetVoiceRestrictionState(false) == "normal" then
					var9 = false
				else
					var7.activated = handleRestrictedActivation
					var7.availability:unavailable()
					var9 = true
				end
				if not var9 then
					if default.voiceUIVisible then
						var7.availability:pinned()
					else
						var7.availability:unavailable()
					end
				end
			end
		else
			var7.availability:pinned()
		end
	elseif micConsumerRegistry then
		updateMicAvailabilityFromConsumers()
	else
		var7.availability:unavailable()
	end
	local var10 = if p1 ~= Enum.VoiceChatState.Joining then p1 == Enum.VoiceChatState.JoiningRetry else true
	
	if p1 == Enum.VoiceChatState.Failed then
		var7.activated = var5
		
		return
	elseif var10 then
		var7.activated = var6
		
		return
	end
	var7.activated = var4
end

if isVoiceChatSupportedModule() then
	if fFlagProactiveVoiceRestrictionsUFRModule then
		script.Destroying:Once(observeMicPresentation())
	end
	default:asyncInit():andThen(function()
		-- upvalues: default (ref), updateVoiceState (ref), enableChromeAudioFocusManagement (ref), applyVoiceUIVisibility (ref), fFlagProactiveVoiceRestrictionsUFRModule (ref), var7 (write), handleRestrictedActivation (ref)
		local service = default:getService()
		
		if service then
			service.StateChanged:Connect(updateVoiceState)
			default:SetupParticipantListeners()
			
			if enableChromeAudioFocusManagement then
				default.showVoiceUI.Event:Connect(applyVoiceUIVisibility)
				default.hideVoiceUI.Event:Connect(applyVoiceUIVisibility)
				
				if fFlagProactiveVoiceRestrictionsUFRModule then
					local var8
					if default:GetVoiceRestrictionState(false) == "normal" then
						var8 = false
					else
						var7.activated = handleRestrictedActivation
						var7.availability:unavailable()
						var8 = true
					end
					if var8 then return end
				end
				if default.voiceUIVisible then
					var7.availability:pinned()
					
					return
				end
				var7.availability:unavailable()
				
				return
			elseif fFlagProactiveVoiceRestrictionsUFRModule then
				local var9
				if default:GetVoiceRestrictionState(false) == "normal" then
					var9 = false
				else
					var7.activated = handleRestrictedActivation
					var7.availability:unavailable()
					var9 = true
				end
				if not var9 then
					var7.availability:pinned()
				end
			end
		end
	end):catch(function() end)
end
if micConsumerRegistry then
	local micManager = default:GetMicManager()
	
	if micManager and micManager.hasConsumersChanged then
		micManager.hasConsumersChanged.Event:Connect(function()
			-- upvalues: updateMicAvailabilityFromConsumers (ref), micManager (ref)
			updateMicAvailabilityFromConsumers()
			micManager:SetMicIndicatorReady(micManager:GetConsumerCount() > 0)
		end)
		updateMicAvailabilityFromConsumers()
		micManager:SetMicIndicatorReady(micManager:GetConsumerCount() > 0)
	end
end
return var7