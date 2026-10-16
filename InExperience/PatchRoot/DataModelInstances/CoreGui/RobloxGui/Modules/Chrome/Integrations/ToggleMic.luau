local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceIndicatorFuncModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local FFlagProactiveVoiceRestrictionsUFRModule = require(RobloxGui.Modules.VoiceChat.Flags.FFlagProactiveVoiceRestrictionsUFR)
local VoiceAnalyticsModule = require(RobloxGui.Modules.Settings.Analytics.VoiceAnalytics)
local EnableChromeAudioFocusManagement = game:DefineFastFlag("EnableChromeAudioFocusManagement", false)
local EnableChromeAudioFocusManagement1 = game:GetEngineFeature("AudioFocusManagement") and EnableChromeAudioFocusManagement
local MicConsumerRegistry = game:DefineFastFlag("MicConsumerRegistry", false)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local RedVoiceDotModule = require(Chrome.Integrations.RedVoiceDot)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local UseIsPlaytestModeModule = require(Chrome.ChromeShared.Hooks.useIsPlaytestMode)
local FFlagEnablePlaytestModeUnibar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlaytestModeUnibar
local MappedSignal = ChromeUtilsModule.MappedSignal
local NewResult = if FFlagProactiveVoiceRestrictionsUFRModule then ChromeUtilsModule.ObservableValue.new(false) else MappedSignal.new(Default.muteChanged.Event, function(): boolean --[[ Line: 43 ]]
	-- upvalues: Default (copy)
	return Default.localMuted == false
end)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local NewResult1 = require(RobloxGui.Modules.SelfView.Analytics).new()
local ChromeIntegrationsToggleMic = if require(RobloxGui.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics)() then VoiceAnalyticsModule.new(RbxAnalyticsService, "Chrome.Integrations.ToggleMic") else nil
local RegisterResult = nil

local function handleRestrictedActivation(): boolean --[[ Line: 58 ]]
	-- upvalues: Default (copy)
	local VoiceRestrictionState = Default:GetVoiceRestrictionState(false)
	
	if VoiceRestrictionState == "restricted" then
		Default:ShowVoiceRestriction()
	end
	return VoiceRestrictionState ~= "normal"
end

local function Activated(_) --[[ Line: 66 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), MicConsumerRegistry (copy), NewResult1 (copy), ChromeIntegrationsToggleMic (ref)
	if FFlagProactiveVoiceRestrictionsUFRModule then
		local VoiceRestrictionState = Default:GetVoiceRestrictionState(false)
		
		if VoiceRestrictionState == "restricted" then
			Default:ShowVoiceRestriction()
		end
		if VoiceRestrictionState ~= "normal" then return end
	end
	if MicConsumerRegistry then
		local MicManager = Default:GetMicManager()
		
		if MicManager and not MicManager:HasConsumer("voice_chat") and MicManager:GetConsumerCount() > 0 then
			MicManager:SetMicActiveForAllConsumers(MicManager.localMuted ~= false, "ChromeIntegrationsToggleMic")
			NewResult1:setLastCtx("SelfView")
			
			return
		end
	end
	Default:ToggleMic("ChromeIntegrationsToggleMic")
	NewResult1:setLastCtx("SelfView")
	
	if ChromeIntegrationsToggleMic then
		ChromeIntegrationsToggleMic:onToggleMuteSelf(not Default.localMuted)
	end
end

local function Activated1(_) --[[ Line: 88 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule then
		local VoiceRestrictionState = Default:GetVoiceRestrictionState(false)
		
		if VoiceRestrictionState == "restricted" then
			Default:ShowVoiceRestriction()
		end
		if VoiceRestrictionState ~= "normal" then return end
	end
	Default:RejoinPreviousChannel()
end

local function Activated2(_) --[[ Line: 95 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule then
		local VoiceRestrictionState = Default:GetVoiceRestrictionState(false)
		
		if VoiceRestrictionState == "restricted" then
			Default:ShowVoiceRestriction()
		end
		if VoiceRestrictionState ~= "normal" then return end
	end
	Default:ShowVoiceChatLoadingMessage()
end

RegisterResult = require(Chrome.Service):register({
	id = "toggle_mic_mute",
	label = if require(Chrome.Flags.FFlagChangeToggleMicText) then "CoreScripts.TopBar.Mic" else "CoreScripts.TopBar.ToggleMic",
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.Unibar,
	activated = Activated,
	isActivated = NewResult,
	components = {
		Icon = function(_) --[[ Line: 112 ]]
			-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), FFlagEnablePlaytestModeUnibar (copy), UseIsPlaytestModeModule (copy), MicConsumerRegistry (copy), Default (copy), ReactModule (copy), FFlagProactiveVoiceRestrictionsUFRModule (copy), SignalsReactModule (copy), FoundationModule (copy), VoiceIndicatorFuncModule (copy), Players (copy), RedVoiceDotModule (copy)
			local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule.ICON_SIZE
			local UseIsPlaytestModeModuleResult = if FFlagEnablePlaytestModeUnibar then UseIsPlaytestModeModule() else nil
			local MicDark: string = if FFlagEnablePlaytestModeUnibar and UseIsPlaytestModeModuleResult then "MicDark" else "MicLight"
			local ImageLabel = nil
			
			if MicConsumerRegistry then
				local MicManager = Default:GetMicManager()
				local IsConsumerCountAbove: boolean = not (MicManager and MicManager:HasConsumer("voice_chat")) and (MicManager and MicManager:GetConsumerCount() > 0)
				local UseStateResult, UseStateResult2 = ReactModule.useState((if MicManager then MicManager.localMuted else nil) ~= false)
				local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
				local _, UseStateResult2_1 = ReactModule.useState(0)
				ReactModule.useEffect(function() --[[ Line: 133 ]]
					-- upvalues: MicManager (copy), UseStateResult2 (copy), UseBindingResult2 (copy), UseStateResult2_1 (copy)
					if not MicManager then return end
					local EventConnection = MicManager.muteChanged.Event:Connect(function(Enabled) --[[ Line: 137 ]]
						-- upvalues: UseStateResult2 (upval)
						UseStateResult2(Enabled ~= false)
					end)
					local EventConnection1 = MicManager.levelChanged.Event:Connect(function(p1) --[[ Line: 140 ]]
						-- upvalues: UseBindingResult2 (upval)
						UseBindingResult2(p1)
					end)
					local EventConnection2 = MicManager.hasConsumersChanged.Event:Connect(function() --[[ Line: 143 ]]
						-- upvalues: UseStateResult2_1 (upval)
						UseStateResult2_1(function(p1: number): number --[[ Line: 144 ]]
							return p1 + 1
						end)
					end)
					
					return function() --[[ Line: 148 ]]
						-- upvalues: EventConnection (copy), EventConnection1 (copy), EventConnection2 (copy)
						EventConnection:Disconnect()
						EventConnection1:Disconnect()
						EventConnection2:Disconnect()
					end
				end, { MicManager })
				local Muted: string = if UseStateResult then "Muted" else "Unmuted"
				local MapResult = UseBindingResult:map(function(p1) --[[ Line: 156 ]]
					-- upvalues: Default (upval), Muted (copy), MicDark (copy)
					return Default:GetIcon(Muted .. tostring(p1), MicDark)
				end)
				
				if IsConsumerCountAbove then
					ImageLabel = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE),
						Image = if UseStateResult then Default:GetIcon(Muted, MicDark) else MapResult
					})
				end
			end
			local UseSignalStateResult = if FFlagProactiveVoiceRestrictionsUFRModule then SignalsReactModule.useSignalState(function(p1) --[[ Line: 174 ]]
				-- upvalues: Default (upval)
				return Default:GetVoiceRestrictionState(p1)
			end) else "normal"
			
			return if FFlagProactiveVoiceRestrictionsUFRModule and UseSignalStateResult == "restricted" then ReactModule.createElement(FoundationModule.Image, {
				Image = "icons/controls/microphoneMute",
				imageStyle = { Transparency = 0.5 },
				Size = UDim2.fromOffset(ICONSIZE, ICONSIZE)
			}) elseif ImageLabel then ImageLabel else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE)
			}, {
				ReactModule.createElement(VoiceIndicatorFuncModule, {
					hideOnError = false,
					selectable = false,
					showConnectingShimmer = true,
					userId = tostring(Players.LocalPlayer.UserId),
					iconStyle = MicDark,
					size = UDim2.new(0, ICONSIZE, 0, ICONSIZE)
				}),
				(ReactModule.createElement(RedVoiceDotModule, { position = UDim2.new(1, -7, 1, -7) }))
			})
		end
	}
})

local function _(p1) --[[ Line: 211 | Named "updateMicActivated" ]]
	-- upvalues: NewResult (copy), Default (copy)
	NewResult:set(p1 == "normal" and Default.localMuted == false)
end

local _ = function(): boolean --[[ Line: 215 | Named "applyRestrictionState" ]]
	-- upvalues: Default (copy), RegisterResult (ref), handleRestrictedActivation (copy)
	if Default:GetVoiceRestrictionState(false) == "normal" then
		return false
	else
		RegisterResult.activated = handleRestrictedActivation
		RegisterResult.availability:unavailable()
		
		return true
	end
end

local function observeMicPresentation() --[[ Line: 228 ]]
	-- upvalues: SignalsModule (copy), Default (copy), NewResult (copy), RegisterResult (ref), handleRestrictedActivation (copy)
	local Effect = SignalsModule.createEffect(function(p1) --[[ Line: 229 ]]
		-- upvalues: Default (upval), NewResult (upval), RegisterResult (upval), handleRestrictedActivation (upval)
		NewResult:set(Default:GetVoiceRestrictionState(p1) == "normal" and Default.localMuted == false)
		
		if Default:GetVoiceRestrictionState(false) ~= "normal" then
			RegisterResult.activated = handleRestrictedActivation
			RegisterResult.availability:unavailable()
			
			return
		end
	end)
	local EventConnection = Default.muteChanged.Event:Connect(function() --[[ Line: 234 ]]
		-- upvalues: Default (upval), NewResult (upval)
		NewResult:set(Default:GetVoiceRestrictionState(false) == "normal" and Default.localMuted == false)
	end)
	
	return function() --[[ Line: 238 ]]
		-- upvalues: Effect (copy), EventConnection (copy)
		Effect()
		EventConnection:Disconnect()
	end
end

local function applyVoiceUIVisibility() --[[ Line: 244 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), RegisterResult (ref), handleRestrictedActivation (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule then
		local Flag = nil
		if Default:GetVoiceRestrictionState(false) == "normal" then
			Flag = false
		else
			RegisterResult.activated = handleRestrictedActivation
			RegisterResult.availability:unavailable()
			Flag = true
		end
		if Flag then return end
	end
	if Default.voiceUIVisible then
		RegisterResult.availability:pinned()
		
		return
	else
		RegisterResult.availability:unavailable()
	end
end

local function updateMicAvailabilityFromConsumers() --[[ Line: 256 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), RegisterResult (ref), handleRestrictedActivation (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule then
		local Flag = nil
		if Default:GetVoiceRestrictionState(false) == "normal" then
			Flag = false
		else
			RegisterResult.activated = handleRestrictedActivation
			RegisterResult.availability:unavailable()
			Flag = true
		end
		if Flag then return end
	end
	local MicManager = Default:GetMicManager()
	
	if MicManager and MicManager:GetConsumerCount() > 0 then
		RegisterResult.availability:pinned()
		
		return
	end
	if not Default.voiceUIVisible then
		RegisterResult.availability:unavailable()
	end
end

local function updateVoiceState(_, NewState) --[[ Line: 269 ]]
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRModule (copy), Default (copy), RegisterResult (ref), handleRestrictedActivation (copy), EnableChromeAudioFocusManagement1 (copy), MicConsumerRegistry (copy), updateMicAvailabilityFromConsumers (copy), Activated1 (copy), Activated2 (copy), Activated (copy)
	if FFlagProactiveVoiceRestrictionsUFRModule then
		local Flag = nil
		if Default:GetVoiceRestrictionState(false) == "normal" then
			Flag = false
		else
			RegisterResult.activated = handleRestrictedActivation
			RegisterResult.availability:unavailable()
			Flag = true
		end
		if Flag then return end
	end
	repeat
		if NewState ~= Enum.VoiceChatState.Ended then
			if EnableChromeAudioFocusManagement1 then
				if FFlagProactiveVoiceRestrictionsUFRModule then
					local Flag = nil
					if Default:GetVoiceRestrictionState(false) == "normal" then
						Flag = false
					else
						RegisterResult.activated = handleRestrictedActivation
						RegisterResult.availability:unavailable()
						Flag = true
					end
					if Flag then break end
				end
				if Default.voiceUIVisible then
					RegisterResult.availability:pinned()
					break
				else
					RegisterResult.availability:unavailable()
					break
				end
			else
				RegisterResult.availability:pinned()
				break
			end
		end
		if MicConsumerRegistry then
			updateMicAvailabilityFromConsumers()
			break
		end
		RegisterResult.availability:unavailable()
	until true
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

if require(Chrome.Integrations.isVoiceChatSupported)() then
	if FFlagProactiveVoiceRestrictionsUFRModule then
		script.Destroying:Once((observeMicPresentation()))
	end
	Default:asyncInit():andThen(function() --[[ Line: 308 ]]
		-- upvalues: Default (copy), updateVoiceState (copy), EnableChromeAudioFocusManagement1 (copy), applyVoiceUIVisibility (copy), FFlagProactiveVoiceRestrictionsUFRModule (copy), RegisterResult (ref), handleRestrictedActivation (copy)
		local Service = Default:getService()
		
		if Service then
			Service.StateChanged:Connect(updateVoiceState)
			Default:SetupParticipantListeners()
			
			if EnableChromeAudioFocusManagement1 then
				Default.showVoiceUI.Event:Connect(applyVoiceUIVisibility)
				Default.hideVoiceUI.Event:Connect(applyVoiceUIVisibility)
				
				if FFlagProactiveVoiceRestrictionsUFRModule then
					local Flag = nil
					if Default:GetVoiceRestrictionState(false) == "normal" then
						Flag = false
					else
						RegisterResult.activated = handleRestrictedActivation
						RegisterResult.availability:unavailable()
						Flag = true
					end
					if Flag then return end
				end
				if Default.voiceUIVisible then
					RegisterResult.availability:pinned()
					
					return
				else
					RegisterResult.availability:unavailable()
					
					return
				end
			else
				if FFlagProactiveVoiceRestrictionsUFRModule then
					local Flag = nil
					if Default:GetVoiceRestrictionState(false) == "normal" then
						Flag = false
					else
						RegisterResult.activated = handleRestrictedActivation
						RegisterResult.availability:unavailable()
						Flag = true
					end
					if not Flag then
						RegisterResult.availability:pinned()
					end
				end
			end
		end
	end):catch(function() --[[ Line: 324 ]] end)
end
if MicConsumerRegistry then
	local MicManager = Default:GetMicManager()
	
	if MicManager and MicManager.hasConsumersChanged then
		MicManager.hasConsumersChanged.Event:Connect(function() --[[ Line: 330 ]]
			-- upvalues: updateMicAvailabilityFromConsumers (copy), MicManager (copy)
			updateMicAvailabilityFromConsumers()
			MicManager:SetMicIndicatorReady(MicManager:GetConsumerCount() > 0)
		end)
		updateMicAvailabilityFromConsumers()
		MicManager:SetMicIndicatorReady(MicManager:GetConsumerCount() > 0)
	end
end
return RegisterResult