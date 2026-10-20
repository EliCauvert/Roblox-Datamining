local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ReactModule = require(CorePackages.Packages.React)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceIndicatorFuncModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local VoiceAnalyticsModule = require(RobloxGui.Modules.Settings.Analytics.VoiceAnalytics)
local EnableChromeAudioFocusManagement = game:DefineFastFlag("EnableChromeAudioFocusManagement", false)
local EnableChromeAudioFocusManagement1 = game:GetEngineFeature("AudioFocusManagement") and EnableChromeAudioFocusManagement
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local RedVoiceDotModule = require(Chrome.Integrations.RedVoiceDot)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local FFlagChromeActivatedMappedSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local NewMappedSignal = if FFlagChromeActivatedMappedSignal then MappedSignal.new(Default.muteChanged.Event, function(): boolean
	-- upvalues: Default (copy)
	return Default.localMuted == false
end) else nil
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local NewResult = require(RobloxGui.Modules.SelfView.Analytics).new()
local ChromeIntegrationsToggleMic = if require(RobloxGui.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics)() then VoiceAnalyticsModule.new(RbxAnalyticsService, "Chrome.Integrations.ToggleMic") else nil
local RegisterResult = nil

local function Activated(_)
	-- upvalues: Default (copy), NewResult (copy), ChromeIntegrationsToggleMic (ref)
	Default:ToggleMic("ChromeIntegrationsToggleMic")
	NewResult:setLastCtx("SelfView")
	
	if ChromeIntegrationsToggleMic then
		ChromeIntegrationsToggleMic:onToggleMuteSelf(not Default.localMuted)
	end
end

local function Activated1(_)
	-- upvalues: Default (copy)
	Default:RejoinPreviousChannel()
end

local function Activated2(_)
	-- upvalues: Default (copy)
	Default:ShowVoiceChatLoadingMessage()
end

RegisterResult = require(Chrome.Service):register({
	id = "toggle_mic_mute",
	label = if require(Chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.Unibar,
	activated = Activated,
	isActivated = if FFlagChromeActivatedMappedSignal then NewMappedSignal else nil,
	components = {
		Icon = function(_)
			-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), VoiceIndicatorFuncModule (copy), Players (copy), RedVoiceDotModule (copy)
			local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule.ICON_SIZE
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE)
			}, {
				ReactModule.createElement(VoiceIndicatorFuncModule, {
					hideOnError = false,
					iconStyle = "MicLight",
					selectable = false,
					showConnectingShimmer = true,
					userId = tostring(Players.LocalPlayer.UserId),
					size = UDim2.new(0, ICONSIZE, 0, ICONSIZE)
				}),
				(ReactModule.createElement(RedVoiceDotModule, { position = UDim2.new(1, -7, 1, -7) }))
			})
		end
	}
})

local function applyVoiceUIVisibility()
	-- upvalues: Default (copy), RegisterResult (ref)
	if Default.voiceUIVisible then
		RegisterResult.availability:pinned()
		
		return
	else
		RegisterResult.availability:unavailable()
	end
end

local function updateVoiceState(_, NewState)
	-- upvalues: EnableChromeAudioFocusManagement1 (copy), Default (copy), RegisterResult (ref), Activated1 (copy), Activated2 (copy), Activated (copy)
	if NewState ~= Enum.VoiceChatState.Ended then
		if EnableChromeAudioFocusManagement1 then
			if Default.voiceUIVisible then
				RegisterResult.availability:pinned()
			else
				RegisterResult.availability:unavailable()
			end
		else
			RegisterResult.availability:pinned()
		end
	else
		RegisterResult.availability:unavailable()
	end
	local IsNewStateMatch: boolean = NewState == Enum.VoiceChatState.Joining or NewState == Enum.VoiceChatState.JoiningRetry
	
	if NewState == Enum.VoiceChatState.Failed then
		RegisterResult.activated = Activated1
		
		return
	end
	if IsNewStateMatch then
		RegisterResult.activated = Activated2
		
		return
	else
		RegisterResult.activated = Activated
	end
end

if game:GetEngineFeature("VoiceChatSupported") then
	task.spawn(function()
		-- upvalues: Default (copy), updateVoiceState (copy), EnableChromeAudioFocusManagement1 (copy), applyVoiceUIVisibility (copy), RegisterResult (ref)
		Default:asyncInit():andThen(function()
			-- upvalues: Default (upval), updateVoiceState (upval), EnableChromeAudioFocusManagement1 (upval), applyVoiceUIVisibility (upval), RegisterResult (upval)
			local Service = Default:getService()
			
			if Service then
				Service.StateChanged:Connect(updateVoiceState)
				Default:SetupParticipantListeners()
				
				if EnableChromeAudioFocusManagement1 then
					Default.showVoiceUI.Event:Connect(applyVoiceUIVisibility)
					Default.hideVoiceUI.Event:Connect(applyVoiceUIVisibility)
					
					if Default.voiceUIVisible then
						RegisterResult.availability:pinned()
						
						return
					else
						RegisterResult.availability:unavailable()
						
						return
					end
				else
					RegisterResult.availability:pinned()
				end
			end
		end):catch(function() end)
	end)
end
return RegisterResult