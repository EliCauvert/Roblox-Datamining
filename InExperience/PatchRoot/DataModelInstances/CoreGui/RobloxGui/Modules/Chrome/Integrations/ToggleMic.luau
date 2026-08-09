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
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local var13 = if fFlagChromeActivatedMappedSignal then chromeUtilsModule.MappedSignal.new(default.muteChanged.Event, function() --[[ line: 33 ]]
	-- upvalues: default (ref)
	return default.localMuted == false
end) else nil
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local var15 = require(robloxGui.Modules.SelfView.Analytics).new()
local var16 = if getFFlagEnableVoiceMuteAnalyticsModule() then voiceAnalyticsModule.new(rbxAnalyticsService, "Chrome.Integrations.ToggleMic") else nil
local _ = nil

local var17 = function(_) --[[ line: 49 ]]
	-- upvalues: default (ref), var15 (ref), var16 (write)
	default:ToggleMic("ChromeIntegrationsToggleMic")
	var15:setLastCtx("SelfView")
	
	if var16 then
		var16:onToggleMuteSelf(not default.localMuted)
	end
end

local var18 = function(_) --[[ line: 57 ]]
	-- upvalues: default (ref)
	default:RejoinPreviousChannel()
end

local var19 = function(_) --[[ line: 61 ]]
	-- upvalues: default (ref)
	default:ShowVoiceChatLoadingMessage()
end

local var20 = serviceModule:register({
	id = "toggle_mic_mute",
	label = if require(chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = sideSheetPlacement.Unibar,
	activated = var17,
	isActivated = if fFlagChromeActivatedMappedSignal then var13 else nil,
	components = {
		Icon = function(_) --[[ line: 75 ]]
			-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), voiceIndicatorFuncModule (ref), playersService (ref), redVoiceDotModule (ref)
			local _ = nil
			local var23 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var23, 0, var23)
			}, {
				reactModule.createElement(voiceIndicatorFuncModule, {
					hideOnError = false,
					iconStyle = "MicLight",
					selectable = false,
					showConnectingShimmer = true,
					userId = tostring(playersService.LocalPlayer.UserId),
					size = UDim2.new(0, var23, 0, var23)
				}),
				reactModule.createElement(redVoiceDotModule, { position = UDim2.new(1, -7, 1, -7) })
			})
		end
	}
})

local function applyVoiceUIVisibility() --[[ line: 104 ]]
	-- upvalues: default (ref), var20 (write)
	if default.voiceUIVisible then
		var20.availability:pinned()
		
		return
	end
	var20.availability:unavailable()
end

local function updateVoiceState(_, p0) --[[ line: 112 ]]
	-- upvalues: enableChromeAudioFocusManagement (ref), default (ref), var20 (write), var18 (ref), var19 (ref), var17 (ref)
	if p0 == Enum.VoiceChatState.Ended then
		var20.availability:unavailable()
	elseif not enableChromeAudioFocusManagement then
		var20.availability:pinned()
	elseif default.voiceUIVisible then
		var20.availability:pinned()
	else
		var20.availability:unavailable()
	end
	local var24 = if p0 ~= Enum.VoiceChatState.Joining then p0 == Enum.VoiceChatState.JoiningRetry else true
	
	if p0 == Enum.VoiceChatState.Failed then
		var20.activated = var18
		
		return
	elseif var24 then
		var20.activated = var19
		
		return
	end
	var20.activated = var17
end

if game:GetEngineFeature("VoiceChatSupported") then
	task.spawn(function() --[[ line: 138 ]]
		-- upvalues: default (ref), updateVoiceState (ref), enableChromeAudioFocusManagement (ref), applyVoiceUIVisibility (ref), var20 (write)
		default:asyncInit():andThen(function() --[[ line: 140 ]]
			-- upvalues: default (copy), updateVoiceState (copy), enableChromeAudioFocusManagement (copy), applyVoiceUIVisibility (copy), var20 (copy)
			local service = default:getService()
			
			if service then
				service.StateChanged:Connect(updateVoiceState)
				default:SetupParticipantListeners()
				
				if enableChromeAudioFocusManagement then
					default.showVoiceUI.Event:Connect(applyVoiceUIVisibility)
					default.hideVoiceUI.Event:Connect(applyVoiceUIVisibility)
					
					if default.voiceUIVisible then
						var20.availability:pinned()
						
						return
					end
					var20.availability:unavailable()
					
					return
				else
					var20.availability:pinned()
				end
			end
		end):catch(function() --[[ line: 154 ]] end)
	end)
end
return var20