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
	-- upvalues: default (ref), var2 (ref), var3 (write)
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
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), fFlagEnablePlaytestModeUnibar (ref), useIsPlaytestModeModule (ref), reactModule (ref), voiceIndicatorFuncModule (ref), playersService (ref), redVoiceDotModule (ref)
			local _ = nil
			local var8 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var8, 0, var8)
			}, {
				reactModule.createElement(voiceIndicatorFuncModule, {
					hideOnError = false,
					selectable = false,
					showConnectingShimmer = true,
					userId = tostring(playersService.LocalPlayer.UserId),
					iconStyle = if fFlagEnablePlaytestModeUnibar and (if fFlagEnablePlaytestModeUnibar then useIsPlaytestModeModule() else nil) then "MicDark" else "MicLight",
					size = UDim2.new(0, var8, 0, var8)
				}),
				reactModule.createElement(redVoiceDotModule, { position = UDim2.new(1, -7, 1, -7) })
			})
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

local function updateVoiceState(_, p1)
	-- upvalues: enableChromeAudioFocusManagement (ref), default (ref), var7 (write), var5 (ref), var6 (ref), var4 (ref)
	if p1 == Enum.VoiceChatState.Ended then
		var7.availability:unavailable()
	elseif not enableChromeAudioFocusManagement then
		var7.availability:pinned()
	elseif default.voiceUIVisible then
		var7.availability:pinned()
	else
		var7.availability:unavailable()
	end
	local var8 = if p1 ~= Enum.VoiceChatState.Joining then p1 == Enum.VoiceChatState.JoiningRetry else true
	
	if p1 == Enum.VoiceChatState.Failed then
		var7.activated = var5
		
		return
	elseif var8 then
		var7.activated = var6
		
		return
	end
	var7.activated = var4
end

if game:GetEngineFeature("VoiceChatSupported") then
	task.spawn(function()
		-- upvalues: default (ref), updateVoiceState (ref), enableChromeAudioFocusManagement (ref), applyVoiceUIVisibility (ref), var7 (write)
		default:asyncInit():andThen(function()
			-- upvalues: default (copy), updateVoiceState (copy), enableChromeAudioFocusManagement (copy), applyVoiceUIVisibility (copy), var7 (copy)
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
	end)
end
return var7