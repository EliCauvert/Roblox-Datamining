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
local var14 = chromeUtilsModule.MappedSignal.new(default.muteChanged.Event, function() --[[ line: 32 ]]
	-- upvalues: default (ref)
	return default.localMuted == false
end)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local var16 = require(robloxGui.Modules.SelfView.Analytics).new()
local var17 = if getFFlagEnableVoiceMuteAnalyticsModule() then voiceAnalyticsModule.new(rbxAnalyticsService, "Chrome.Integrations.ToggleMic") else nil
local _ = nil

local var18 = function(_) --[[ line: 47 ]]
	-- upvalues: default (ref), var16 (ref), var17 (write)
	default:ToggleMic("ChromeIntegrationsToggleMic")
	var16:setLastCtx("SelfView")
	
	if var17 then
		var17:onToggleMuteSelf(not default.localMuted)
	end
end

local var19 = function(_) --[[ line: 55 ]]
	-- upvalues: default (ref)
	default:RejoinPreviousChannel()
end

local var20 = function(_) --[[ line: 59 ]]
	-- upvalues: default (ref)
	default:ShowVoiceChatLoadingMessage()
end

local var21 = serviceModule:register({
	id = "toggle_mic_mute",
	label = if require(chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = sideSheetPlacement.Unibar,
	activated = var18,
	isActivated = var14,
	components = {
		Icon = function(_) --[[ line: 73 ]]
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), fFlagEnablePlaytestModeUnibar (ref), useIsPlaytestModeModule (ref), reactModule (ref), voiceIndicatorFuncModule (ref), playersService (ref), redVoiceDotModule (ref)
			local _ = nil
			local var24 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var24, 0, var24)
			}, {
				reactModule.createElement(voiceIndicatorFuncModule, {
					hideOnError = false,
					selectable = false,
					showConnectingShimmer = true,
					userId = tostring(playersService.LocalPlayer.UserId),
					iconStyle = if fFlagEnablePlaytestModeUnibar and (if fFlagEnablePlaytestModeUnibar then useIsPlaytestModeModule() else nil) then "MicDark" else "MicLight",
					size = UDim2.new(0, var24, 0, var24)
				}),
				reactModule.createElement(redVoiceDotModule, { position = UDim2.new(1, -7, 1, -7) })
			})
		end
	}
})

local function applyVoiceUIVisibility() --[[ line: 105 ]]
	-- upvalues: default (ref), var21 (write)
	if default.voiceUIVisible then
		var21.availability:pinned()
		
		return
	end
	var21.availability:unavailable()
end

local function updateVoiceState(_, p0) --[[ line: 113 ]]
	-- upvalues: enableChromeAudioFocusManagement (ref), default (ref), var21 (write), var19 (ref), var20 (ref), var18 (ref)
	if p0 == Enum.VoiceChatState.Ended then
		var21.availability:unavailable()
	elseif not enableChromeAudioFocusManagement then
		var21.availability:pinned()
	elseif default.voiceUIVisible then
		var21.availability:pinned()
	else
		var21.availability:unavailable()
	end
	local var25 = if p0 ~= Enum.VoiceChatState.Joining then p0 == Enum.VoiceChatState.JoiningRetry else true
	
	if p0 == Enum.VoiceChatState.Failed then
		var21.activated = var19
		
		return
	elseif var25 then
		var21.activated = var20
		
		return
	end
	var21.activated = var18
end

if game:GetEngineFeature("VoiceChatSupported") then
	task.spawn(function() --[[ line: 139 ]]
		-- upvalues: default (ref), updateVoiceState (ref), enableChromeAudioFocusManagement (ref), applyVoiceUIVisibility (ref), var21 (write)
		default:asyncInit():andThen(function() --[[ line: 141 ]]
			-- upvalues: default (copy), updateVoiceState (copy), enableChromeAudioFocusManagement (copy), applyVoiceUIVisibility (copy), var21 (copy)
			local service = default:getService()
			
			if service then
				service.StateChanged:Connect(updateVoiceState)
				default:SetupParticipantListeners()
				
				if enableChromeAudioFocusManagement then
					default.showVoiceUI.Event:Connect(applyVoiceUIVisibility)
					default.hideVoiceUI.Event:Connect(applyVoiceUIVisibility)
					
					if default.voiceUIVisible then
						var21.availability:pinned()
						
						return
					end
					var21.availability:unavailable()
					
					return
				else
					var21.availability:pinned()
				end
			end
		end):catch(function() --[[ line: 155 ]] end)
	end)
end
return var21